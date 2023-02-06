---
layout:  post
title:   使用CompletableFuture优化你的代码执行效率
date:   0-02-14 12:26:01 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-Java并发-CompletableFuture

---

这篇文章详细讲解java8中CompletableFuture的特性,方法以及实例.

在java8以前,我们使用java的多线程编程,一般是通过Runnable中的run方法来完成,这种方式,有个很明显的缺点,就是,没有返回值,这时候,大家可能会去尝试使用Callable中的call方法,然后用Future返回结果,如下:

```java
public static void main(String[]args)throws Exception{
        ExecutorService executor=Executors.newSingleThreadExecutor();
        Future<String> stringFuture=executor.submit(new Callable<String>(){
@Override public String call()throws Exception{
        Thread.sleep(2000);
        return"async thread";
        }
        });
        Thread.sleep(1000);
        System.out.println("main thread");
        System.out.println(stringFuture.get());

        }
```

通过观察控制台,我们发现先打印&nbsp;main thread ,一秒后打印 async thread,似乎能满足我们的需求,但仔细想我们发现一个问题,当调用future的get()
方法时,当前主线程是堵塞的,这好像并不是我们想看到的,另一种获取返回结果的方式是先轮询,可以调用isDone,等完成再获取,但这也不能让我们满意.

不管怎么看,这种用法看起来并不优雅,起码从视觉上就有些丑陋,而且某些场景无法使用,比如说,

1.很多个异步线程执行时间可能不一致,我的主线程业务不能一直等着,这时候我可能会想要只等最快的线程执行完或者最重要的那个任务执行完,亦或者我只等1秒钟,至于没返回结果的线程我就用默认值代替.

2.我两个异步任务之间执行独立,但是第二个依赖第一个的执行结果.

java8的CompletableFuture,就在这混乱且不完美的多线程江湖中闪亮登场了.CompletableFuture让Future的功能和使用场景得到极大的完善和扩展,提供了函数式编程能力,使代码更加美观优雅,而且可以通过回调的方式计算处理结果,对异常处理也有了更好的处理手段.

CompletableFuture源码中有四个静态方法用来执行异步任务:

## 创建任务

```java
public static<U> CompletableFuture<U> supplyAsync(Supplier<U> supplier){..}

public static<U> CompletableFuture<U> supplyAsync(Supplier<U> supplier,Executor executor){..}

public static CompletableFuture<Void> runAsync(Runnable runnable){..}

public static CompletableFuture<Void> runAsync(Runnable runnable,
        Executor executor){..}
```

如果有多线程的基础知识,我们很容易看出,run开头的两个方法,用于执行没有返回值的任务,因为它的入参是Runnable对象,而supply开头的方法显然是执行有返回值的任务了,至于方法的入参,如果没有传入Executor对象将会使用ForkJoinPool.commonPool()
作为它的线程池执行异步代码.在实际使用中,一般我们使用自己创建的线程池对象来作为参数传入使用,这样速度会快些.

执行异步任务的方式也很简单,只需要使用上述方法就可以了:

```java
CompletableFuture<String> future=CompletableFuture.supplyAsync(()->{
        　　　　//....执行任务
        　　　　return"hello";},executor)
```

接下来看一下获取执行结果的几个方法.

```java
V get();
        V get(long timeout,Timeout unit);
        T getNow(T defaultValue);
        T join();
```

上面两个方法是Future中的实现方式,get()会堵塞当前的线程,这就造成了一个问题,如果执行线程迟迟没有返回数据,get()会一直等待下去,因此,第二个get()方法可以设置等待的时间.

&nbsp; getNow()方法比较有意思,表示当有了返回结果时会返回结果,如果异步线程抛了异常会返回自己设置的默认值.

接下来以一些场景的实例来介绍一下CompletableFuture中其他一些常用的方法.

## thenAccept()

```java
public CompletionStage<Void> thenAccept(Consumer<? super T>action);
public CompletionStage<Void> thenAcceptAsync(Consumer<? super T>action);
public CompletionStage<Void> thenAcceptAsync(Consumer<? super T>action,Executor executor);
```

功能:当前任务正常完成以后执行,当前任务的执行结果可以作为下一任务的输入参数,无返回值.

场景:执行任务A,同时异步执行任务B,待任务B正常返回之后,用B的返回值执行任务C,任务C无返回值

```java
CompletableFuture<String> futureA=CompletableFuture.supplyAsync(()->"任务A");
        CompletableFuture<String> futureB=CompletableFuture.supplyAsync(()->"任务B");
        CompletableFuture<String> futureC=futureB.thenApply(b->{
        System.out.println("执行任务C.");
        System.out.println("参数:"+b);//参数:任务B
        return"a";
        });
```

## thenRun(..)

```java
public CompletionStage<Void> thenRun(Runnable action);
public CompletionStage<Void> thenRunAsync(Runnable action);
public CompletionStage<Void> thenRunAsync(Runnable action,Executor executor);
```

功能:对不关心上一步的计算结果，执行下一个操作

场景:执行任务A,任务A执行完以后,执行任务B,任务B不接受任务A的返回值(不管A有没有返回值),也无返回值

```java
CompletableFuture<String> futureA=CompletableFuture.supplyAsync(()->"任务A");
        futureA.thenRun(()->System.out.println("执行任务B"));
```

## thenApply(..)

```java
public<U> CompletableFuture<U> thenApply(Function<? super T,?extends U>fn)
public<U> CompletableFuture<U> thenApplyAsync(Function<? super T,?extends U>fn)
public<U> CompletableFuture<U> thenApplyAsync(Function<? super T,?extends U>fn,Executor executor)
```

功能:当前任务正常完成以后执行，当前任务的执行的结果会作为下一任务的输入参数,有返回值

场景:多个任务串联执行,下一个任务的执行依赖上一个任务的结果,每个任务都有输入和输出

实例1:异步执行任务A,当任务A完成时使用A的返回结果resultA作为入参进行任务B的处理,可实现任意多个任务的串联执行

```java
CompletableFuture<String> futureA=CompletableFuture.supplyAsync(()->"hello");

        CompletableFuture<String> futureB=futureA.thenApply(s->s+" world");

        CompletableFuture<String> future3=futureB.thenApply(String::toUpperCase);

        System.out.println(future3.join());
```

上面的代码,我们当然可以先调用future.join()
先得到任务A的返回值,然后再拿返回值做入参去执行任务B,而thenApply的存在就在于帮我简化了这一步,我们不必因为等待一个计算完成而一直阻塞着调用线程，而是告诉CompletableFuture你啥时候执行完就啥时候进行下一步.
就把多个任务串联起来了.

## thenCombine(..) thenAcceptBoth(..) runAfterBoth(..)

```java
public<U, V> CompletableFuture<V> thenCombine(CompletionStage<?extends U> other,BiFunction<? super T,?super U,?extends V>fn)
public<U, V> CompletableFuture<V> thenCombineAsync(CompletionStage<?extends U> other,BiFunction<? super T,?super U,?extends V>fn)
public<U, V> CompletableFuture<V> thenCombineAsync(CompletionStage<?extends U> other,BiFunction<? super T,?super U,?extends V>fn,Executor executor)
```

功能:结合两个CompletionStage的结果，进行转化后返回

场景:需要根据商品id查询商品的当前价格,分两步,查询商品的原始价格和折扣,这两个查询相互独立,当都查出来的时候用原始价格乘折扣,算出当前价格. 使用方法:
thenCombine(..)

```java
CompletableFuture<Double> futurePrice=CompletableFuture.supplyAsync(()->100d);
        CompletableFuture<Double> futureDiscount=CompletableFuture.supplyAsync(()->0.8);
        CompletableFuture<Double> futureResult=futurePrice.thenCombine(futureDiscount,(price,discount)->price*discount);
        System.out.println("最终价格为:"+futureResult.join()); //最终价格为:80.0
```

thenCombine(..)是结合两个任务的返回值进行转化后再返回,那如果不需要返回呢,那就需要**thenAcceptBoth**(..)
,同理,如果连两个任务的返回值也不关心呢,那就需要runAfterBoth了,如果理解了上面三个方法,thenApply,thenAccept,thenRun,这里就不需要单独再提这两个方法了,只在这里提一下.

## thenCompose(..)

```java
public<U> CompletableFuture<U> thenCompose(Function<? super T,?extends CompletionStage<U>>fn)
public<U> CompletableFuture<U> thenComposeAsync(Function<? super T,?extends CompletionStage<U>>fn)
public<U> CompletableFuture<U> thenComposeAsync(Function<? super T,?extends CompletionStage<U>>fn,Executor executor)
```

功能:这个方法接收的输入是当前的CompletableFuture的计算值，返回结果将是一个新的CompletableFuture

这个方法和thenApply非常像,都是接受上一个任务的结果作为入参,执行自己的操作,然后返回.那具体有什么区别呢?

**thenApply():它的功能相当于将CompletableFuture<T>转换成CompletableFuture<U>,改变的是同一个CompletableFuture中的泛型类型**

**thenCompose():用来连接两个CompletableFuture，返回值是一个新的CompletableFuture**

```java
CompletableFuture<String> futureA=CompletableFuture.supplyAsync(()->"hello");

        CompletableFuture<String> futureB=futureA.thenCompose(s->CompletableFuture.supplyAsync(()->s+"world"));

        CompletableFuture<String> future3=futureB.thenCompose(s->CompletableFuture.supplyAsync(s::toUpperCase));

        System.out.println(future3.join());
```

这段代码实现的和上面thenApply一样的效果,在实际使用中,我并没有很清楚两个在使用上的区别,如果有大佬,跪求告知.

## applyToEither(..) acceptEither(..) runAfterEither(..)

```java
public<U> CompletionStage<U> applyToEither(CompletionStage<?extends T> other,Function<? super T,U>fn);
public<U> CompletionStage<U> applyToEitherAsync(CompletionStage<?extends T> other,Function<? super T,U>fn);
public<U> CompletionStage<U> applyToEitherAsync(CompletionStage<?extends T> other,Function<? super T,U>fn,Executor executor);
```

功能:执行两个CompletionStage的结果,那个先执行完了,就是用哪个的返回值进行下一步操作 场景:假设查询商品a,有两种方式,A和B,但是A和B的执行速度不一样,我们希望哪个先返回就用那个的返回值.

```java
CompletableFuture<String> futureA=CompletableFuture.supplyAsync(()->{
        try{
        Thread.sleep(1000);
        }catch(InterruptedException e){
        e.printStackTrace();
        }
        return"通过方式A获取商品a";
        });
        CompletableFuture<String> futureB=CompletableFuture.supplyAsync(()->{
        try{
        Thread.sleep(2000);
        }catch(InterruptedException e){
        e.printStackTrace();
        }
        return"通过方式B获取商品a";
        });
        CompletableFuture<String> futureC=futureA.applyToEither(futureB,product->"结果:"+product);
        System.out.println(futureC.join()); //结果:通过方式A获取商品a
```

同样的道理,applyToEither的兄弟方法还有acceptEither(),runAfterEither(),我想不需要我解释你也知道该怎么用了.

## exceptionally(..)

```java
public CompletionStage<T> exceptionally(Function<Throwable, ?extends T> fn);
```

功能:当运行出现异常时,调用该方法可进行一些补偿操作,如设置默认值.

场景:异步执行任务A获取结果,如果任务A执行过程中抛出异常,则使用默认值100返回.

```java
CompletableFuture<String> futureA=CompletableFuture.
        supplyAsync(()->"执行结果:"+(100/0))
        .thenApply(s->"futureA result:"+s)
        .exceptionally(e->{
        System.out.println(e.getMessage()); //java.lang.ArithmeticException: / by zero
        return"futureA result: 100";
        });
        CompletableFuture<String> futureB=CompletableFuture.
        supplyAsync(()->"执行结果:"+50)
        .thenApply(s->"futureB result:"+s)
        .exceptionally(e->"futureB result: 100");
        System.out.println(futureA.join());//futureA result: 100
        System.out.println(futureB.join());//futureB result:执行结果:50
```

上面代码展示了正常流程和出现异常的情况,可以理解成catch,根据返回值可以体会下.

## whenComplete(..)

```java
public CompletionStage<T> whenComplete(BiConsumer<? super T,?super Throwable>action);
public CompletionStage<T> whenCompleteAsync(BiConsumer<? super T,?super Throwable>action);
public CompletionStage<T> whenCompleteAsync(BiConsumer<? super T,?super Throwable>action,Executor executor);
```

功能:当CompletableFuture的计算结果完成，或者抛出异常的时候，都可以进入whenComplete方法执行,举个栗子

```java
CompletableFuture<String> futureA=CompletableFuture.
        supplyAsync(()->"执行结果:"+(100/0))
        .thenApply(s->"apply result:"+s)
        .whenComplete((s,e)->{
        if(s!=null){
        System.out.println(s);//未执行
        }
        if(e==null){
        System.out.println(s);//未执行
        }else{
        System.out.println(e.getMessage());//java.lang.ArithmeticException: / by zero
        }
        })
        .exceptionally(e->{
        System.out.println("ex"+e.getMessage()); //ex:java.lang.ArithmeticException: / by zero
        　　　　　　　　　　　  return"futureA result: 100";});
        System.out.println(futureA.join());//futureA result: 100
```

根据控制台,我们可以看出执行流程是这样,supplyAsync-&gt;whenComplete-&gt;exceptionally,可以看出并没有进入thenApply执行,原因也显而易见,在supplyAsync中出现了异常,thenApply只有当正常返回时才会去执行.而whenComplete不管是否正常执行,还要注意一点,whenComplete是没有返回值的.

上面代码我们使用了函数式的编程风格并且先调用whenComplete再调用exceptionally,如果我们先调用exceptionally,再调用whenComplete会发生什么呢,我们看一下:

```java
CompletableFuture<String> futureA=CompletableFuture.
        supplyAsync(()->"执行结果:"+(100/0))
        .thenApply(s->"apply result:"+s)
        .exceptionally(e->{
        System.out.println("ex:"+e.getMessage()); //ex:java.lang.ArithmeticException: / by zero
        return"futureA result: 100";
        })
        .whenComplete((s,e)->{
        if(e==null){
        System.out.println(s);//futureA result: 100
        }else{
        System.out.println(e.getMessage());//未执行
        }
        })
        ;
        System.out.println(futureA.join());//futureA result: 100
```

代码先执行了exceptionally后执行whenComplete,可以发现,由于在exceptionally中对异常进行了处理,并返回了默认值,whenComplete中接收到的结果是一个正常的结果,被exceptionally美化过的结果,这一点需要留意一下.

## handle(..)

```java
public<U> CompletionStage<U> handle(BiFunction<? super T,Throwable,?extends U>fn);
public<U> CompletionStage<U> handleAsync(BiFunction<? super T,Throwable,?extends U>fn);
public<U> CompletionStage<U> handleAsync(BiFunction<? super T,Throwable,?extends U>fn,Executor executor);
```

功能:当CompletableFuture的计算结果完成，或者抛出异常的时候，可以通过handle方法对结果进行处理

```java
CompletableFuture<String> futureA=CompletableFuture.
        supplyAsync(()->"执行结果:"+(100/0))
        .thenApply(s->"apply result:"+s)
        .exceptionally(e->{
        System.out.println("ex:"+e.getMessage()); //java.lang.ArithmeticException: / by zero
        return"futureA result: 100";
        })
        .handle((s,e)->{
        if(e==null){
        System.out.println(s);//futureA result: 100
        }else{
        System.out.println(e.getMessage());//未执行
        }
        return"handle result:"+(s==null?"500":s);
        });
        System.out.println(futureA.join());//handle result:futureA result: 100
```

通过控制台,我们可以看出,最后打印的是handle result:futureA result: 100,执行exceptionally后对异常进行了"美化"
,返回了默认值,那么handle得到的就是一个正常的返回,我们再试下,先调用handle再调用exceptionally的情况.

```java
CompletableFuture<String> futureA=CompletableFuture.
        supplyAsync(()->"执行结果:"+(100/0))
        .thenApply(s->"apply result:"+s)
        .handle((s,e)->{
        if(e==null){
        System.out.println(s);//未执行
        }else{
        System.out.println(e.getMessage());//java.lang.ArithmeticException: / by zero
        }
        return"handle result:"+(s==null?"500":s);
        })
        .exceptionally(e->{
        System.out.println("ex:"+e.getMessage()); //未执行
        return"futureA result: 100";
        });
        System.out.println(futureA.join());//handle result:500
```

根据控制台输出,可以看到先执行handle,打印了异常信息,并对接过设置了默认值500,exceptionally并没有执行,因为它得到的是handle返回给它的值,由此我们大概推测handle和whenComplete的区别

1.都是对结果进行处理,handle有返回值,whenComplete没有返回值

2.由于1的存在,使得handle多了一个特性,可在handle里实现exceptionally的功能

## allOf(..) anyOf(..)

```java
public static CompletableFuture<Void>  allOf(CompletableFuture<?>...cfs)
public static CompletableFuture<Object>  anyOf(CompletableFuture<?>...cfs)
```

allOf:当所有的CompletableFuture都执行完后执行计算

anyOf:最快的那个CompletableFuture执行完之后执行计算

场景二:查询一个商品详情,需要分别去查商品信息,卖家信息,库存信息,订单信息等,这些查询相互独立,在不同的服务上,假设每个查询都需要一到两秒钟,要求总体查询时间小于2秒.

```java
public static void main(String[]args)throws Exception{

        ExecutorService executorService=Executors.newFixedThreadPool(4);

        long start=System.currentTimeMillis();
        CompletableFuture<String> futureA=CompletableFuture.supplyAsync(()->{
        try{
        Thread.sleep(1000+RandomUtils.nextInt(1000));
        }catch(InterruptedException e){
        e.printStackTrace();
        }
        return"商品详情";
        },executorService);

        CompletableFuture<String> futureB=CompletableFuture.supplyAsync(()->{
        try{
        Thread.sleep(1000+RandomUtils.nextInt(1000));
        }catch(InterruptedException e){
        e.printStackTrace();
        }
        return"卖家信息";
        },executorService);

        CompletableFuture<String> futureC=CompletableFuture.supplyAsync(()->{
        try{
        Thread.sleep(1000+RandomUtils.nextInt(1000));
        }catch(InterruptedException e){
        e.printStackTrace();
        }
        return"库存信息";
        },executorService);

        CompletableFuture<String> futureD=CompletableFuture.supplyAsync(()->{
        try{
        Thread.sleep(1000+RandomUtils.nextInt(1000));
        }catch(InterruptedException e){
        e.printStackTrace();
        }
        return"订单信息";
        },executorService);

        CompletableFuture<Void> allFuture=CompletableFuture.allOf(futureA,futureB,futureC,futureD);
        allFuture.join();

        System.out.println(futureA.join()+futureB.join()+futureC.join()+futureD.join());
        System.out.println("总耗时:"+(System.currentTimeMillis()-start));
        }
```

&nbsp;

