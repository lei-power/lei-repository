### 一.背景介绍
#### 1.需求产生
神农口袋项目随着公司业务的发展，子服务数量不可避免快速的膨胀，数据库单表的数据量也日益庞大。
这带来一个后果就是某些核心接口获取数据时需要拉取多个下游服务，以及会大批量的处理数据，在同步调用的情况下会严重影响接口的性能，甚至造成阻塞，例如归档相关的接口。
对于具有上述问题的接口进行优化时，现有的较为常见的做法是采用多线程异步编排的方式来进行接口改造；

##### 1.1 同步调用与异步调用对比
同步调用：

![](D:\png\tongbu.png)

异步调用：

![](D:\png\异步1.png)

##### 1.1 同步调用与异步调用时间对比
假设每个任务时间消耗为T1，T2...
```java
T总 = T1+T2+T3+T4+T5+T6+T7
```
异步的话，可以给任务根据依赖关系编组G1，G2...
```java
T总 = G1.max(T1)+
      G1.max(T2,T3)+
      G1.max(T4,T5,T6)+
      G1.max(T7)
```
#### 2.异步编排的实现方案
##### 2.1 Future接口的局限
Future接口是Java1.5新增的，用来描述一个异步计算的结果，虽然Future以及相关的使用方法提供了异步执行任务的能力，但是对于结果的获取却很不友好，只能通过阻塞或者轮询的方式得到任务的结果，且没有异常处理。
```java
public interface Future<V> {
    boolean cancel(boolean mayInterruptIfRunning);  //任务正常完成前将其取消，则返回 true
    boolean isCancelled();  
    boolean isDone();       //轮询; 任务正常终止、异常或取消，都将返回true 
    V get()throws InterruptedException, ExecutionException;   //阻塞, 获取计算结果
    V get(long timeout, TimeUnit unit)throws InterruptedException, ExecutionException, TimeoutException;
}
```
Future接口虽然可以构建异步应用，但仍有其局限性，它难以直接表达多个异步任务之间的依赖性。
实际开发中，我们经常需要达成以下目的：
1. 将多个异步任务的结果合并成一个；  
2. 等待Future集合中的所有任务都完成；  
3. Future完成事件（即，任务完成以后触发执行动作）； 
这些目的难以直接使用Future接口实现。

##### 2.2 CompletableFuture的特点
1. CompletableFuture类是java1.8引入的，它实现了Future和CompletionStage接口；  
2. 它可能代表一个明确完成的Future,也有可能代表一个完成阶段(CompletionStage),它支持在计算完成以后触发一些函数或执行某些动作；
3. 它提供了强大的Future的扩展功能,可以帮助我们简化异步编程的复杂性,并且提供了函数式编程的能力,可以通过回调的方式处理计算结果,也提供了转换和组合CompletableFuture的方法。
4. CompletionStage接口说明 
- CompletionStage代表异步计算过程中的某一个阶段,一个阶段完成后可能会触发另外一个阶段；
- 一个阶段的计算执行可以是一个Funcation、Consumer、Runnable；
- 一个阶段的执行可能是被单个阶段的完成触发,也可能是由多个阶段一起触发。

##### 2.3 结论
业界比较流行的解决方案还有RxJava、Reactor等。

改造上述接口所需要的特性主要是“异步”与"可编排"，由于CompletableFuture类能较好的满足需求，且JDK原生支持，不需要引入第三方jar包，故本人最终选择了CompletableFuture类进行学习与使用，并针对于实践过程中遇到的问题与大家进行交流与分享。

### 二.实践探究
#### 1.常用api介绍
##### 1.1 创建异步任务（runAsync，supplyAsync）
```java
//runAsync方法不支持返回值
public static CompletableFuture<Void> runAsync(Runnable runnable)
public static CompletableFuture<Void> runAsync(Runnable runnable, Executor executor)
//supplyAsync可以支持返回值
public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)
public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier, Executor executor)
```
##### 1.2 获得结果和触发计算(get、getNow、join、complete)
```java
public T get( )                            //不见不散(会抛出异常) 只要调用了get( )方法,不管是否计算完成都会导致阻塞  
public T get(long timeout, TimeUnit unit)  //过时不候  
public T getNow(T valuelfAbsent)           //没有计算完成的情况下,给我一个替代结果计算完,返回计算完成后的结果、没算完,返回设定的valuelfAbsent  
public T join( )                           //join方法和get( )方法作用一样,不同的是,join方法不抛出异常 
public boolean complete(T value)           //主动结束异步任务，可以打断get方法，立即返回括号值
```
##### 1.3 对计算结果进行消费(thenRun、thenAccept、thenApply)
都有对应的后缀Async的异步方法
```java
thenRun(Runnable runnable)                                                              //无参无返
CompletableFuture<Void> thenAccept(Consumer<? super T> action)                          //消费型，有参无返
public <U> CompletableFuture<U> thenApply(Function<? super T,? extends U> fn)           //函数型，有参有返
```
##### 1.4 对计算结果进行处理(exceptionally、whenComplete、handle)
都有对应的后缀Async的异步方法
```java
CompletableFuture<T> exceptionally(Function<Throwable, ? extends T> fn)                 //就相当于 catch,出现异常,将会跳过 exceptionally 的后续操作,直接捕获异常，进行异常处理
CompletableFuture<T> whenComplete(BiConsumer<? super T, ? super Throwable> action)      //有异常也可以往下一步走,根据带的异常参数可以进一步处理,无返回值    
<U> CompletableFuture<U> handle(BiFunction<? super T, Throwable, ? extends U> fn)       //有异常也可以往下一步走,根据带的异常参数可以进一步处理,有返回值
```
![](D:\png\图片5.png)

##### 1.5 对计算速度进行选用(applyToEither、acceptEither、runAfterEither)
都有对应的后缀Async的异步方法
```java
public <U> CompletableFuture<U> applyToEither(CompletionStage<? extends T> other, Function<? super T, U> fn)       //这个方法表示的是,2个异步任务谁快就用谁的结果

//测试
public void test() {
    System.out.println(CompletableFuture.supplyAsync(() -> {
    //暂停几秒钟线程
        try { TimeUnit.SECONDS.sleep(1);  } catch (InterruptedException e) {e.printStackTrace();}
        return 1;
    }).applyToEither(CompletableFuture.supplyAsync(() -> {
        try { TimeUnit.SECONDS.sleep(2);} catch (InterruptedException e) { e.printStackTrace();}
        return 2;
    }),r -> r).join());
    //主线程暂停几秒钟线程防止退出
    try { TimeUnit.SECONDS.sleep(3); } catch (InterruptedException e) { e.printStackTrace(); }
}
```
##### 1.6 对计算结果进行合并(thenCombine、thenAcceptBoth、runAfterBoth)
都有对应的后缀Async的异步方法
```java
public <U,V> CompletableFuture<V> thenCombine(CompletionStage<? extends U> other,BiFunction<? super T,? super U,? extends V> fn)//两个CompletionStage任务都完成后,最终把两个任务的结果一起交给thenCombine来处理,先完成的先等着,等待其他分支任务
public <U> CompletableFuture<Void> thenAcceptBoth(CompletionStage<? extends U> other,BiConsumer<? super T, ? super U> action)   //与thenCombine相比是没有返回参数
public CompletableFuture<Void> runAfterBoth(CompletionStage<?> other,Runnable action)                                           //无参无返

//测试
public void test() {
System.out.println(CompletableFuture.supplyAsync(() -> 10).thenCombine(CompletableFuture.supplyAsync(() -> 20), (r1, r2) -> r1 + r2).thenCombine(CompletableFuture.supplyAsync(() -> 30), (r3, r4) -> r3 + r4).join());
}       
```
##### 1.7 多任务组合(allOf、anyOf)
```java
public static CompletableFuture<Void> allOf(CompletableFuture<?>... cfs)       //allOf:等待所有任务完成
public static CompletableFuture<Object> anyOf(CompletableFuture<?>... cfs)     //anyOf:只要有一个任务完成
```

#### 2.案例分析（注销登记接口）
##### 2.1 时序图

![](D:\png\注销-0.png)

##### 2.2 数据校验
###### 2.2.1 代码

![](D:\png\图片1-1.png)

![](D:\png\图片1-2.png)

###### 2.2.2 任务依赖图

![](D:\png\校验.png)

##### 2.3 数据操作
###### 2.3.1 代码

![](D:\png\图片2.png)

###### 2.3.2 任务依赖图

![](D:\png\审核.png)

#### 3.问题归纳
##### 3.1 代码执行在哪个线程上？
多线程编程的前提是要清楚自己写的每一行代码会在哪一个线程上执行，CompletableFuture实现了CompletionStage接口，通过丰富的回调方法，实现了各种组合操作，每种组合场景都有同步和异步两种方法。
###### 3.1.1同步方法（不带Async后缀的方法）的代码执行有两种情况。
- 如果注册时被依赖的操作已经执行完成，则直接由当前线程(main线程)执行。（异步计算只会计算一次）  
- 如果注册时被依赖的操作还未执行完，则由回调线程执行。 
###### 3.1.2异步方法（带Async后缀的方法）
- 可以选择是否传递线程池参数Executor运行在指定线程池中；当不传递Executor时，会使用ForkJoinPool中的共用线程池CommonPool（CommonPool的大小是CPU核数-1，如果是IO密集的应用，线程数可能成为瓶颈）。

##### 3.2 线程池相关问题
###### 3.2.1 异步回调要传线程池
前面提到，异步回调方法可以选择是否传递线程池参数Executor，一般建议**强制传线程池，且根据实际情况做线程池隔离**。
当不传递线程池时，会使用ForkJoinPool中的公共线程池CommonPool，这里所有调用将共用该线程池，核心线程数=处理器数量-1（单核核心线程数为1），所有异步回调都会共用该CommonPool，核心与非核心业务都竞争同一个池中的线程，很容易成为系统瓶颈。手动传递线程池参数可以更方便的调节参数，并且可以给不同的业务分配不同的线程池，以求资源隔离，减少不同业务之间的相互干扰。

###### 3.2.2 循环引用造成死锁
![](D:\png\图片3.png)

如上代码块所示，父任务向executor线程池请求线程，并且内部子任务又向executor线程池请求线程。executor线程池大小为5，当同一时刻有5个请求到达，则executor线程池被打满，子任务请求线程时进入阻塞队列排队，但是父任务的完成又依赖于子任务，这时由于子任务得不到线程，父任务无法完成。主线程执行fatherFuture.join()进入阻塞状态，无法自行恢复。
故为解决该问题，需要将父任务与子任务做线程池隔离，两个任务请求不同的线程池，避免循环依赖导致的死锁。

##### 3.3 多线程操作数据库的事务问题
由于事务是与线程绑定的，每一个线程与数据库建立链接时都会开启独立的事务，所以在多线程环境下操作数据库可能会存在事务不一致的问题。

解决思路:

主线程开启多个子线程，每个子线程开启独立的事务,然后在数据库io后悬停线程,等待其他子线程全部执行完, 若任一一个子线程存在异常, 则全部子线程进行事务回滚.否则提交;

技术要点:

1.没有使用Object的wait和notify等方法, 而是使用了LockSupport的park和unpark来实现线程间通信.

2.有兴趣的同学也可以使用CountDownLatch（闭锁）来实现一下。

### 三.总结
本次和大家分享与交流到此就要结束了。
由于CompletableFuture底层采用了Unsafe类相关CAS方法，所以除了get或join，其他方法都实现了无锁操作，性能较好。并且其具有的链式调用，转换组合，异步回调等能力也让其在很多场景下都有发挥的机会。最后希望小伙伴们能在以后的工作中多多使用，多多踩坑，然后多多分享^_^。


### 四.参考文献
1. CompletableFuture (Java Platform SE 8 )
2. CompletableFuture In Java With Examples
3. java - Does CompletionStage always wrap exceptions in CompletionException
4. CompletableFuture概述、创建方式、常用API
5. CompletableFuture原理与实践-外卖商家端API的异步化
6. 项目开发之Spring多线程事务如何一起提交一起回滚，并发处理批量数据，实现多线程事务回滚，事务补偿
