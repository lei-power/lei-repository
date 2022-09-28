---
layout:  post
title:   Java8新的异步编程方式 CompletableFuture
date:   0-02-13 21:27:58 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-Java并发-CompletableFuture

---

**一. Future**

JDK 5引入了Future模式。Future接口是Java多线程Future模式的实现，在java.util.concurrent包中，可以来进行异步计算。

Future模式是多线程设计常用的一种设计模式。Future模式可以理解成：我有一个任务，提交给了Future，Future替我完成这个任务。期间我自己可以去做任何想做的事情。一段时间之后，我就便可以从Future那儿取出结果。

Future的接口很简单，只有五个方法。

```java
public interface Future<V> {

    boolean cancel(boolean mayInterruptIfRunning);

    boolean isCancelled();

    boolean isDone();

    V get() throws InterruptedException, ExecutionException;

    V get(long timeout, TimeUnit unit)
        throws InterruptedException, ExecutionException, TimeoutException;
}
```

Future接口的方法介绍如下：

- boolean cancel (boolean mayInterruptIfRunning) 取消任务的执行。参数指定是否立即中断任务执行，或者等等任务结束 
- boolean isCancelled () 任务是否已经取消，任务正常完成前将其取消，则返回 true 
- boolean isDone () 任务是否已经完成。需要注意的是如果任务正常终止、异常或取消，都将返回true 
- V get () throws InterruptedException, ExecutionException 等待任务执行结束，然后获得V类型的结果。InterruptedException 线程被中断异常， ExecutionException任务执行异常，如果任务被取消，还会抛出CancellationException 
- V get (long timeout, TimeUnit unit) throws InterruptedException, ExecutionException, TimeoutException 同上面的get功能一样，多了设置超时时间。参数timeout指定超时时间，uint指定时间的单位，在枚举类TimeUnit中有相关的定义。如果计 算超时，将抛出TimeoutException

一般情况下，我们会结合Callable和Future一起使用，通过ExecutorService的submit方法执行Callable，并返回Future。

```java
ExecutorService executor = Executors.newCachedThreadPool();

        Future<String> future = executor.submit(() -> { //Lambda 是一个 callable， 提交后便立即执行，这里返回的是 FutureTask 实例
            System.out.println("running task");
            Thread.sleep(10000);
            return "return task";
        });

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
        }

        System.out.println("do something else");  //前面的的 Callable 在其他线程中运行着，可以做一些其他的事情

        try {
            System.out.println(future.get());  //等待 future 的执行结果，执行完毕之后打印出来
        } catch (InterruptedException e) {
        } catch (ExecutionException e) {

        } finally {
            executor.shutdown();
        }
```

>比起future.get()，其实更推荐使用get (long timeout, TimeUnit unit) 方法，设置了超时时间可以防止程序无限制的等待future的结果。

 []()

**二. CompletableFuture介绍**

 []()

**2.1 Future模式的缺点**

-  Future虽然可以实现获取异步执行结果的需求，但是它没有提供通知的机制，我们无法得知Future什么时候完成。  
- 要么使用阻塞，在future.get()的地方等待future返回的结果，这时又变成同步操作。要么使用isDone()轮询地判断Future是否完成，这样会耗费CPU的资源。

 []()

**2.2 CompletableFuture介绍**

Netty、Guava分别扩展了Java 的 Future 接口，方便异步编程。

Java 8新增的CompletableFuture类正是吸收了所有Google Guava中ListenableFuture和SettableFuture的特征，还提供了其它强大的功能，让Java拥有了完整的非阻塞编程模型：Future、Promise 和 Callback(在Java8之前，只有无Callback 的Future)。

CompletableFuture能够将回调放到与任务不同的线程中执行，也能将回调作为继续执行的同步函数，在与任务相同的线程中执行。它避免了传统回调最大的问题，那就是能够将控制流分离到不同的事件处理器中。

CompletableFuture弥补了Future模式的缺点。在异步的任务完成后，需要用其结果继续操作时，无需等待。可以直接通过thenAccept、thenApply、thenCompose等方式将前面异步处理的结果交给另外一个异步事件处理线程来处理。

 []()

**三. CompletableFuture特性**

 []()

**3.1 CompletableFuture的静态工厂方法**


runAsync 和 supplyAsync 方法的区别是runAsync返回的CompletableFuture是没有返回值的。

```java
CompletableFuture<Void> future = CompletableFuture.runAsync(() -> {
            System.out.println("Hello");
        });

        try {
            future.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        System.out.println("CompletableFuture");
```

而supplyAsync返回的CompletableFuture是由返回值的，下面的代码打印了future的返回值。

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello");

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }

        System.out.println("CompletableFuture");
```

 []()

**3.2 Completable**


future.get()在等待执行结果时，程序会一直block，如果此时调用complete(T t)会立即执行。

```java
CompletableFuture<String> future  = CompletableFuture.supplyAsync(() -> "Hello");

        future.complete("World");

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
World
```

可以看到future调用complete(T t)会立即执行。但是complete(T t)只能调用一次，后续的重复调用会失效。

如果future已经执行完毕能够返回结果，此时再调用complete(T t)则会无效。

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello");

        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        future.complete("World");

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
Hello
```

如果使用completeExceptionally(Throwable ex)则抛出一个异常，而不是一个成功的结果。

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello");

        future.completeExceptionally(new Exception());

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
java.util.concurrent.ExecutionException: java.lang.Exception
...
```

**3.3 转换**

我们可以通过CompletableFuture来异步获取一组数据，并对数据进行一些转换，类似RxJava、Scala的map、flatMap操作。

### 3.3.1 map


thenApply的功能相当于将CompletableFuture&lt;T&gt;转换成CompletableFuture&lt;U&gt;。

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello");

        future = future.thenApply(new Function<String, String>() {

            @Override
            public String apply(String s) {

                return s + " World";
            }
        }).thenApply(new Function<String, String>() {
            @Override
            public String apply(String s) {

                return s.toUpperCase();
            }
        });

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

再用lambda表达式简化一下

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello")
                .thenApply(s -> s + " World").thenApply(String::toUpperCase);

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
HELLO WORLD
```

下面的例子，展示了数据流的类型经历了如下的转换：String -&gt; Integer -&gt; Double。

```java
CompletableFuture<Double> future = CompletableFuture.supplyAsync(() -> "10")
                .thenApply(Integer::parseInt)
                .thenApply(i->i*10.0);

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
100.0
```

### 3.3.2 flatMap


thenCompose可以用于组合多个CompletableFuture，将前一个结果作为下一个计算的参数，它们之间存在着先后顺序。

```java
CompletableFuture<String> future = CompletableFuture.supplyAsync(() -> "Hello")
                .thenCompose(s -> CompletableFuture.supplyAsync(() -> s + " World"));

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
Hello World
```

下面的例子展示了多次调用thenCompose()

```java
CompletableFuture<Double> future = CompletableFuture.supplyAsync(() -> "100")
                .thenCompose(s -> CompletableFuture.supplyAsync(() -> s + "100"))
                .thenCompose(s -> CompletableFuture.supplyAsync(() -> Double.parseDouble(s)));

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
100100.0
```

**3.4 组合**


现在有CompletableFuture&lt;T&gt;、CompletableFuture&lt;U&gt;和一个函数(T,U)-&gt;V，thenCompose就是将CompletableFuture&lt;T&gt;和CompletableFuture&lt;U&gt;变为CompletableFuture&lt;V&gt;。

```java
CompletableFuture<String> future1 = CompletableFuture.supplyAsync(() -> "100");
        CompletableFuture<Integer> future2 = CompletableFuture.supplyAsync(() -> 100);

        CompletableFuture<Double> future = future1.thenCombine(future2, (s, i) -> Double.parseDouble(s + i));

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
100100.0
```

>使用thenCombine()之后future1、future2之间是并行执行的，最后再将结果汇总。这一点跟thenCompose()不同。

thenAcceptBoth跟thenCombine类似，但是返回CompletableFuture&lt;Void&gt;类型。


```java
CompletableFuture<String> future1 = CompletableFuture.supplyAsync(() -> "100");
        CompletableFuture<Integer> future2 = CompletableFuture.supplyAsync(() -> 100);

        CompletableFuture<Void> future = future1.thenAcceptBoth(future2, (s, i) -> System.out.println(Double.parseDouble(s + i)));

        try {
            future.get();
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
100100.0
```

**3.5 计算结果完成时的处理**

当CompletableFuture完成计算结果后，我们可能需要对结果进行一些处理。

### 3.5.1 执行特定的Action


```java
CompletableFuture.supplyAsync(() -> "Hello")
                .thenApply(s->s+" World")
                .thenApply(s->s+ "\nThis is CompletableFuture demo")
                .thenApply(String::toLowerCase)
                .whenComplete((result, throwable) -> System.out.println(result));
```

执行结果：

```java
hello world
this is completablefuture demo
```

### 3.5.2 执行完Action可以做转换


```java
CompletableFuture<Double> future = CompletableFuture.supplyAsync(() -> "100")
                .thenApply(s->s+"100")
                .handle((s, t) -> s != null ? Double.parseDouble(s) : 0);

        try {
            System.out.println(future.get());
        } catch (InterruptedException e) {
            e.printStackTrace();
        } catch (ExecutionException e) {
            e.printStackTrace();
        }
```

执行结果：

```java
100100.0
```

在这里，handle()的参数是BiFunction，apply()方法返回R，相当于转换的操作。

```java
@FunctionalInterface
public interface BiFunction<T, U, R> {

    /**
     * Applies this function to the given arguments.
     *
     * @param t the first function argument
     * @param u the second function argument
     * @return the function result
     */
    R apply(T t, U u);

    /**
     * Returns a composed function that first applies this function to
     * its input, and then applies the {@code after} function to the result.
     * If evaluation of either function throws an exception, it is relayed to
     * the caller of the composed function.
     *
     * @param <V> the type of output of the {@code after} function, and of the
     *           composed function
     * @param after the function to apply after this function is applied
     * @return a composed function that first applies this function and then
     * applies the {@code after} function
     * @throws NullPointerException if after is null
     */
    default <V> BiFunction<T, U, V> andThen(Function<? super R, ? extends V> after) {
        Objects.requireNonNull(after);
        return (T t, U u) -> after.apply(apply(t, u));
    }
}
```

而whenComplete()的参数是BiConsumer，accept()方法返回void。

```java
@FunctionalInterface
public interface BiConsumer<T, U> {

    /**
     * Performs this operation on the given arguments.
     *
     * @param t the first input argument
     * @param u the second input argument
     */
    void accept(T t, U u);

    /**
     * Returns a composed {@code BiConsumer} that performs, in sequence, this
     * operation followed by the {@code after} operation. If performing either
     * operation throws an exception, it is relayed to the caller of the
     * composed operation.  If performing this operation throws an exception,
     * the {@code after} operation will not be performed.
     *
     * @param after the operation to perform after this operation
     * @return a composed {@code BiConsumer} that performs in sequence this
     * operation followed by the {@code after} operation
     * @throws NullPointerException if {@code after} is null
     */
    default BiConsumer<T, U> andThen(BiConsumer<? super T, ? super U> after) {
        Objects.requireNonNull(after);

        return (l, r) -> {
            accept(l, r);
            after.accept(l, r);
        };
    }
}
```

>所以，handle()相当于whenComplete()+转换。

### 3.5.3 纯消费(执行Action)


thenAccept()是只会对计算结果进行消费而不会返回任何结果的方法。

```java
CompletableFuture.supplyAsync(() -> "Hello")
                .thenApply(s->s+" World")
                .thenApply(s->s+ "\nThis is CompletableFuture demo")
                .thenApply(String::toLowerCase)
                .thenAccept(System.out::print);
```

执行结果：

```java
hello world
this is completablefuture demo
```

&nbsp;

