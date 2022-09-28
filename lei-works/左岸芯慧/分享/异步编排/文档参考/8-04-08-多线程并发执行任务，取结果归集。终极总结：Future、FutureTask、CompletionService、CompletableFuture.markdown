---
layout:  post
title:   多线程并发执行任务，取结果归集。终极总结：Future、FutureTask、CompletionService、CompletableFuture
date:   8-04-08 18:36:33 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-Java并发-多线程专栏
-Java并发-原理解析
-Java并发-CompletableFuture

---

 [https://www.cnblogs.com/dennyzhangdd/p/7010972.html](https://www.cnblogs.com/dennyzhangdd/p/7010972.html)

**正文**

开启线程执行任务，不管是使用Runnable（无返回值不支持上报异常）还是Callable（有返回值支持上报异常）接口，都可以轻松实现。那么如果**是开启线程池并需要获取结果归集**的情况下，如何实现，以及优劣，老司机直接看总结即可。

任务执行完，结果归集时，几种方式： []()

## 1.Futrue

 []()

### 原理:

如下图，Future接口封装了取消，获取线程结果，以及状态判断是否取消，是否完成这几个方法，都很有用。


![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTYwNzU2MjcxODEtMTE0NTYzNTUwMi5wbmc?x-oss-process=image/format,png)

 []()

### demo:

使用线程池提交Callable接口任务，返回Future接口，添加进list,最后遍历FutureList且内部使用while轮询,并发获取结果


下面我会根据线程池的线程数量+配合每个线程设定不同的耗时时间，来看一下咱们的线程执行细节。（不关心的可以直接跳过~）

1.开启定长为10的线程池，ExecutorService exs = Executors.newFixedThreadPool(10);+任务1耗时3秒，任务5耗时5秒，其他1秒。控制台打印如下：


2.开启定长为5的线程池，ExecutorService exs = Executors.newFixedThreadPool(5);+任务1耗时3秒，任务5耗时5秒，其他1秒。控制台打印如下：


3.开启定长为5的线程池且把线程sleep时间全部设定为1秒，即ExecutorService exs = Executors.newFixedThreadPool(5);Thread.sleep(1000);控制台打印如下：


4.如果开启定长为10的线程池且每个任务耗时一秒，即ExecutorService exs = Executors.newFixedThreadPool(10);Thread.sleep(1000);控制台打印如下：


 []()

### 建议：此种方法可实现基本目标，任务并行且按照提交顺序获取结果。使用很普遍，老少皆宜，就是CPU有消耗，可以使用！

## 2.FutureTask

 []()

### 原理:

是接口RunnableFuture的唯一实现类。类图如下（网上截取来的。。。我的eclipse类图插件还没装好）：


&nbsp;![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTYwOTM5MTAwMDktMTU1NDMxMDY2Ny5wbmc?x-oss-process=image/format,png)

如上图，可见RunnableFuture接口继承自Future&lt;V&gt;+Runnable:

1.Runnable接口，可开启单个线程执行。

2.Future<v>接口，可接受Callable接口的返回值，futureTask.get()阻塞获取结果。

FutureTask的构造方法有两种，其实最终都是赋值callable。如下图：


![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTYwOTQ3MzE1ODctMjEzMTcxNzQ0MS5wbmc?x-oss-process=image/format,png)

 []()

### demo:

demo1:两个步骤：1.开启单个线程执行任务，2.阻塞等待执行结果，分离这两步骤，可在这两步中间穿插别的相关业务逻辑。


执行结果如下：


如上图，分离之后，futureTaskThread耗时10秒期间，主线程还穿插的执行了耗时5秒的操作，大大减小总耗时。且可根据业务逻辑实时判断是否需要继续执行futureTask。

demo2：当然FutureTask一样可以并发执行任务并获取结果，如下：


运行结果就不打印了，和Future一样的。因为结果归集用了Future&lt;v&gt;特性。

 []()

### 建议：demo1在特定场合例如有十分耗时的业务但有依赖于其他业务不一定非要执行的，可以尝试使用。demo2多线程并发执行并结果归集，这里多套一层FutureTask比较鸡肋（直接返回Future简单明了）不建议使用。

## 3.CompletionService：

原理:内部通过阻塞队列+FutureTask，实现了**任务先完成可优先获取到，即结果按照完成先后顺序排序。**

demo:


打印结果如下：


&nbsp;

建议：使用率也挺高，而且能按照完成先后排序，建议**如果有排序需求的优先使用**。只是多线程并发执行任务结果归集，也可以使用。

&nbsp;

## 4.CompletableFuture

 []()

### 原理：

4.1.从注释看：

JDK1.8才新加入的一个实现类，实现了Future&lt;T&gt;, CompletionStage&lt;T&gt;2个接口，JDK注释如下图：


![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTYxMjU5NTY3NDMtODk4NDgzMDk1LnBuZw?x-oss-process=image/format,png)

译文（没兴趣的可以跳过）：

当一个Future可能需要显示地完成时，使用CompletionStage接口去支持完成时触发的函数和操作。当2个以上线程同时尝试完成、异常完成、取消一个CompletableFuture时，只有一个能成功。

CompletableFuture实现了CompletionStage接口的如下策略：

1.为了完成当前的CompletableFuture接口或者其他完成方法的回调函数的线程，提供了非异步的完成操作。

2.没有显式入参Executor的所有async方法都使用ForkJoinPool.commonPool()为了简化监视、调试和跟踪，所有生成的异步任务都是标记接口AsynchronousCompletionTask的实例。

3.所有的CompletionStage方法都是独立于其他共有方法实现的，因此一个方法的行为不会受到子类中其他方法的覆盖。

CompletableFuture实现了Futurre接口的如下策略：

1.CompletableFuture无法直接控制完成，所以cancel操作被视为是另一种异常完成形式。方法isCompletedExceptionally可以用来确定一个CompletableFuture是否以任何异常的方式完成。

2.以一个CompletionException为例，方法get()和get(long,TimeUnit)抛出一个ExecutionException，对应CompletionException。为了在大多数上下文中简化用法，这个类还定义了方法join()和getNow，而不是直接在这些情况中直接抛出CompletionException。

&nbsp;

4.2.CompletionStage接口实现流式编程：

JDK8新增接口，此接口包含38个方法...是的，你没看错，就是38个方法。这些方法主要是为了支持函数式编程中流式处理。

&nbsp;

**4.3.CompletableFuture中4个异步执行任务静态方法：**


![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTkxMDA2MjM0NzYtMTU4NTIyMDkzLnBuZw?x-oss-process=image/format,png)

如上图，其中supplyAsync用于有返回值的任务，runAsync则用于没有返回值的任务。Executor参数可以手动指定线程池，否则默认ForkJoinPool.commonPool()系统级公共线程池，注意：这些线程都是Daemon线程，主线程结束Daemon线程不结束，只有JVM关闭时，生命周期终止。

4.4.组合CompletableFuture：

thenCombine()：**先完成当前CompletionStage和other 2个CompletionStage任务，然后把结果传参给BiFunction进行结果合并操作。**

&nbsp;

**thenCompose()：第一个CompletableFuture执行完毕后，传递给下一个CompletionStage作为入参进行操作。**


![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTkxMDQ0Mjg4NjYtMTQ2OTAxNjUxMS5wbmc?x-oss-process=image/format,png)

demo:

JDK&nbsp;CompletableFuture自带多任务组合方法allOf和anyOf

**allOf**是等待所有任务完成，构造后CompletableFuture完成

**anyOf**是只要有一个任务完成，构造后CompletableFuture就完成


![img](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9pbWFnZXMyMDE1LmNuYmxvZ3MuY29tL2Jsb2cvNTg0ODY2LzIwMTcwNi81ODQ4NjYtMjAxNzA2MTkxODMwNTkwODUtNDU5MDA5NzE3LnBuZw?x-oss-process=image/format,png)

方式一：循环创建CompletableFuture list,调用sequence()组装返回一个有返回值的CompletableFuture，返回结果get()获取

方式二：全流式处理转换成CompletableFuture[]+allOf组装成一个无返回值CompletableFuture，join等待执行完毕。返回结果whenComplete获取。---》推荐


方式二返回结果：


&nbsp;

建议：CompletableFuture满足并发执行，顺序完成先手顺序获取的目标。而且支持每个任务的异常返回，配合流式编程，用起来速度飞起。JDK源生支持，API丰富，推荐使用。

## 5.总结：

本文从原理、demo、建议三个方向分析了常用多线程并发，取结果归集的几种实现方案，希望对大家有所启发，整理表格如下：


&nbsp;

&nbsp;

