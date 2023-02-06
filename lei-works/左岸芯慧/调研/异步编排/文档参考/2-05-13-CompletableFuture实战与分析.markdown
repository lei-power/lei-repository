---
layout:  post
title:   CompletableFuture实战与分析
date:   2-05-13 11:23:26 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-Java
-java

---


Future对于结果的获取不够好，只能通过阻塞或者轮询的方式得到任务的结果。在Java8中Doug Lea大师提供了一个CompletableFuture工具类，可以更优雅的对异步并行操作进行编排。

## Future VS CompletableFuture

1. CompletableFuture支持手动完成任务，比如被调用的远程服务无响应，可以手动返回一个结果；Future则会导致调用方挂起。
2. CompletableFuture支持callback，Future只能通过get阻塞的获取结果。
3. CompletableFuture支持组合Future，更加方便编排异步请求

## 常见非阻塞编程“模型”对比

- **Composable - 可组合** ：可以将多个依赖操作通过不同的方式进行编排，例如CompletableFuture提供thenCompose、thenCombine等各种then开头的方法，这些方法就是对“可组合”特性的支持。
- **Operator fusion - 操作融合**：将数据流中使用的多个操作符以某种方式结合起来，如just、from、flatMap等
- **Lazy - 延迟执行**：操作不会立即执行，当收到明确指示时操作才会触发。例如Reactor只有当有订阅者订阅时，才会触发操作。
- **Backpressure - 背压**：将压力返回到调用者，这样调用方可以感知下游压力

## CompletableFuture

>
Future、CompletionStage。Future表示异步计算的结果，CompletionStage用于表示异步执行过程中的一个步骤（Stage），这个步骤可能是由另外一个CompletionStage触发的，随着当前步骤的完成，也可能会触发其他一系列CompletionStage的执行。从而我们可以根据实际业务对这些步骤进行多样化的编排组合，CompletionStage接口正是定义了这样的能力，我们可以通过其提供的thenAppy、thenCompose等函数式编程方法来组合编排这些步骤。<br> <img src="https://img-blog.csdnimg.cn/2f1e0ccd175c45989f61f35e92c80705.png" alt="CompletableFuture">

### 使用CompletableFuture优雅的处理不通业务场景

业务场景可以大致划分为2类场景，Fork调用，Join调用

1. Fork类型 接口CF1成功后调用CF2、CF3；


1. Join类型 接口CF3依赖接口CF1、CF2同时成功后再执行

根据CompletableFuture依赖数量，可以将上述场景的CompletableFuture的创建分为以下几类：零源依赖、一元依赖、二元依赖和多元依赖。

#### 零源依赖

无前置依赖，下面是相关API与3种创建方式参考

- supplyAsync执行CompletableFuture任务，支持返回值
- runAsync执行CompletableFuture任务，没有返回值
- completedFuture用于将结果封装为已完成的CompletableFuture对象

```java
ExecutorService executor=Executors.newFixedThreadPool(5);
        //1、使用runAsync或supplyAsync发起异步调用
        CompletableFuture<String> cf1=CompletableFuture.supplyAsync(()->{

        return"result1";
        },executor);
        //2、CompletableFuture.completedFuture()直接创建一个已完成状态的CompletableFuture
        CompletableFuture<String> cf1=CompletableFuture.completedFuture("result1");
        //3、先初始化一个未完成的CompletableFuture，然后通过complete()、completeExceptionally()，完成该CompletableFuture
        CompletableFuture<String> cf1=new CompletableFuture<>();
        cf1.complete("success");
```

第三种方式可用于封装回调接口，美图提供示例如下：

```java

@FunctionalInterface
public interface ThriftAsyncCall {

    void invoke() throws TException;
}

    /**
     * 该方法为美团内部rpc注册监听的封装，可以作为其他实现的参照
     * OctoThriftCallback 为thrift回调方法
     * ThriftAsyncCall 为自定义函数，用来表示一次thrift调用（定义如上）
     */
    static <T> CompletableFuture<T> toCompletableFuture(final OctoThriftCallback<?, T> callback, ThriftAsyncCall thriftCall) {

        //新建一个未完成的CompletableFuture
        CompletableFuture<T> resultFuture = new CompletableFuture<>();
        //监听回调的完成，并且与CompletableFuture同步状态
        callback.addObserver(new OctoObserver<T>() {

            @Override
            public void onSuccess(T t) {

                resultFuture.complete(t);
            }

            @Override
            public void onFailure(Throwable throwable) {

                resultFuture.completeExceptionally(throwable);
            }
        });
        if (thriftCall != null) {

            try {

                thriftCall.invoke();
            } catch (TException e) {

                resultFuture.completeExceptionally(e);
            }
        }
        return resultFuture;
    }
```

#### 一源依赖

仅有一个前置CompletableFuture的情况。对于单个CompletableFuture的依赖可以通过thenApply、thenAccept、thenCompose等方法来实现，将前置任务的执行结果作为方法入参然后执行指定的方法。

- thenApply 转换的是泛型中的类型，相当于将CompletableFuture<T> 转换生成新的CompletableFuture<U>
- thenAccept 与thenApply一样，但是无返回值
- thenCompose 与thenApply不同之处是该方法会返回一个新的CompletableFuture实例

```java
CompletableFuture<String> cf2=cf1.thenApply(result1->{

        //result1为CF1的结果
        //......
        return"result2";
        });
        CompletableFuture<String> cf3=cf1.thenApply(result1->{

        //result1为CF1的结果
        //......
        return"result3";
        });
```

#### 双源依赖

CF3同时依赖于两个CF1和CF2，这种二元依赖可以通过thenCombine等回调来实现

```java
CompletableFuture<String> cf3=cf1.thenCombine(cf2,(result1,result2)->{

        //result1和result2分别为cf1和cf2的结果
        return"result3";
        });
```

#### 多源依赖

整个流程的结束依赖于三个步骤CF1、CF2、CF3，这种多元依赖可以通过allOf或anyOf方法来实现，区别是当需要多个依赖全部完成时使用allOf，当多个依赖中的任意一个完成即可时使用anyOf

```java
CompletableFuture<Void> cf6=CompletableFuture.allOf(cf1,cf2,cf3);
        CompletableFuture<String> result=cf4.thenApply(v->{

        //这里的join并不会阻塞，因为传给thenApply的函数是在CF1、CF2、CF3全部完成时，才会执行 。
        result1=cf1.join();
        result2=cf2.join();
        result3=cf3.join();
        //根据result1、result2、result3组装最终result;
        return"result4";
        });
```

## CompletableFuture分析

![img](https://img-blog.csdnimg.cn/215dfc93aa2d43aeac90157ac6b2728f.png)

### 被观察者

1. 每个CompletableFuture都可以被看作一个被观察者，其内部有一个Completion类型的链表成员变量stack，用来存储注册到其中的所有观察者。当被观察者执行完成后会弹栈stack属性，依次通知注册到其中的观察者。上面例子中步骤fn2就是作为观察者被封装在UniApply中。
2. 被观察者CF中的result属性，用来存储返回结果数据。这里可能是一次RPC调用的返回值，也可能是任意对象，在上面的例子中对应步骤fn1的执行结果。

### 观察者

CompletableFuture支持很多回调方法，例如thenAccept、thenApply、exceptionally等，这些方法接收一个函数类型的参数f，生成一个Completion类型的对象（即观察者），并将入参函数f赋值给Completion的成员变量fn，然后检查当前CF是否已处于完成状态（即result !=
null），如果已完成直接触发fn，否则将观察者Completion加入到CF的观察者链stack中，再次尝试触发，如果被观察者未执行完则其执行完毕之后通知触发。

1. 观察者中的dep属性：指向其对应的CompletableFuture，在上面的例子中dep指向CF2。
2. 观察者中的src属性：指向其依赖的CompletableFuture，在上面的例子中src指向CF1。
3. 观察者Completion中的fn属性：用来存储具体的等待被回调的函数。这里需要注意的是不同的回调方法（thenAccept、thenApply、exceptionally等）接收的函数类型也不同，即fn的类型有很多种，在上面的例子中fn指向fn2。

## 使用注意

1. 执行线程问题

> CompletableFuture实现了CompletionStage接口，通过丰富的回调方法，支持各种组合操作，每种组合场景都有同步和异步两种方法。<br> 同步方法（即不带Async后缀的方法）有两种情况。

```java
ExecutorService threadPool1=new ThreadPoolExecutor(10,10,0L,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<>(100));
        CompletableFuture<String> future1=CompletableFuture.supplyAsync(()->{

        System.out.println("supplyAsync 执行线程："+Thread.currentThread().getName());
        //业务操作
        return"";
        },threadPool1);
        //此时，如果future1中的业务操作已经执行完毕并返回，则该thenApply直接由当前main线程执行；否则，将会由执行以上业务操作的threadPool1中的线程执行。
        future1.thenApply(value->{

        System.out.println("thenApply 执行线程："+Thread.currentThread().getName());
        return value+"1";
        });
        //使用ForkJoinPool中的共用线程池CommonPool
        future1.thenApplyAsync(value->{

        //do something
        return value+"1";
        });
        //使用指定线程池
        future1.thenApplyAsync(value->{

        //do something
        return value+"1";
        },threadPool1);
```

1. 线程池导致死锁分析

```java
ExecutorService threadPool1=new ThreadPoolExecutor(10,10,0L,TimeUnit.MILLISECONDS,new ArrayBlockingQueue<>(100));
public Object doGet(){

        CompletableFuture cf1=CompletableFuture.supplyAsync(()->{

        //do sth
        return CompletableFuture.supplyAsync(()->{

        System.out.println("child");
        return"child";
        },threadPool1).join();//子任务
        },threadPool1);
        return cf1.join();
        }
```

>
doGet方法第三行通过supplyAsync向threadPool1请求线程，并且内部子任务又向threadPool1请求线程。threadPool1大小为10，当同一时刻有10个请求到达，则threadPool1被打满，子任务请求线程时进入阻塞队列排队，但是父任务的完成又依赖于子任务，这时由于子任务得不到线程，父任务无法完成。主线程执行cf1.join()
进入阻塞状态，并且永远无法恢复。为了修复该问题，需要将父任务与子任务做线程池隔离，两个任务请求不同的线程池，避免循环依赖导致的阻塞。

1. 异步RPC调用注意不要阻塞IO线程池

>
服务异步化后很多步骤都会依赖于异步RPC调用的结果，这时需要特别注意一点，如果是使用基于NIO（比如Netty）的异步RPC，则返回结果是由IO线程负责设置的，即回调方法由IO线程触发，CompletableFuture同步回调（如thenApply、thenAccept等无Async后缀的方法）如果依赖的异步RPC调用的返回结果，那么这些同步回调将运行在IO线程上，而整个服务只有一个IO线程池，这时需要保证同步回调中不能有阻塞等耗时过长的逻辑，否则在这些逻辑执行完成前，IO线程将一直被占用，影响整个服务的响应。

1. Future需要获取返回值，才能获取异常信息

```java
ExecutorService executorService=new ThreadPoolExecutor(5,10,5L,
        TimeUnit.SECONDS,new ArrayBlockingQueue<>(10));
        CompletableFuture<Void> future=CompletableFuture.supplyAsync(()->{

        int a=0;
        int b=666;
        int c=b/a;
        return true;
        },executorService).thenAccept(System.out::println);

//如果不加 get()方法这一行，看不到异常信息
//future.get();
```

Future需要获取返回值，才能获取到异常信息。如果不加 get()/join()方法，看不到异常信息。异常处理考虑是否加try…catch…或者使用exceptionally方法。

1. 异常处理

> 由于异步执行的任务在其他线程上执行，而异常信息存储在线程栈中，因此当前线程除非阻塞等待返回结果，否则无法通过try\catch捕获异常。CompletableFuture提供了异常捕获回调exceptionally，相当于同步调用中的try\catch。使用方法如下所示：

```java
@Autowired private WmOrderAdditionInfoThriftService wmOrderAdditionInfoThriftService;//内部接口
public CompletableFuture<Integer> getCancelTypeAsync(long orderId){

        CompletableFuture<WmOrderOpRemarkResult> remarkResultFuture=wmOrderAdditionInfoThriftService.findOrderCancelledRemarkByOrderIdAsync(orderId);//业务方法，内部会发起异步rpc调用
        return remarkResultFuture
        .exceptionally(err->{
        //通过exceptionally 捕获异常，打印日志并返回默认值
        log.error("WmOrderRemarkService.getCancelTypeAsync Exception orderId={}",orderId,err);
        return 0;
        });
        }
```

>
有一点需要注意，CompletableFuture在回调方法中对异常进行了包装。大部分异常会封装成CompletionException后抛出，真正的异常存储在cause属性中，因此如果调用链中经过了回调方法处理那么就需要用Throwable.getCause()
方法提取真正的异常。但是，有些情况下会直接返回真正的异常（Stack Overflow的讨论），最好使用工具类提取异常，如下代码所示：

```java
@Autowired private WmOrderAdditionInfoThriftService wmOrderAdditionInfoThriftService;//内部接口
public CompletableFuture<Integer> getCancelTypeAsync(long orderId){

        CompletableFuture<WmOrderOpRemarkResult> remarkResultFuture=wmOrderAdditionInfoThriftService.findOrderCancelledRemarkByOrderIdAsync(orderId);//业务方法，内部会发起异步rpc调用
        return remarkResultFuture
        .thenApply(result->{
        //这里增加了一个回调方法thenApply，如果发生异常thenApply内部会通过new CompletionException(throwable) 对异常进行包装
        //这里是一些业务操作
        })
        .exceptionally(err->{
        //通过exceptionally 捕获异常，这里的err已经被thenApply包装过，因此需要通过Throwable.getCause()提取异常
        log.error("WmOrderRemarkService.getCancelTypeAsync Exception orderId={}",orderId,ExceptionUtils.extractRealException(err));
        return 0;
        });
        }

//自定义的工具类ExceptionUtils，用于CompletableFuture的异常提取，在使用CompletableFuture做异步编程时，可以直接使用该工具类处理异常
public class ExceptionUtils {

    public static Throwable extractRealException(Throwable throwable) {

        //这里判断异常类型是否为CompletionException、ExecutionException，如果是则进行提取，否则直接返回。
        if (throwable instanceof CompletionException || throwable instanceof ExecutionException) {

            if (throwable.getCause() != null) {

                return throwable.getCause();
            }
        }
        return throwable;
    }
}
```

## 参考文档

[CompletableFuture原理与实践-外卖商家端API的异步化](https://mp.weixin.qq.com/s/GQGidprakfticYnbVYVYGQ)  [CompletableFuture In Java With Examples](https://xperti.io/blogs/completablefuture-in-java/)  [异步编程利器：CompletableFuture详解 ｜Java 开发实战](https://juejin.cn/post/6970558076642394142)

