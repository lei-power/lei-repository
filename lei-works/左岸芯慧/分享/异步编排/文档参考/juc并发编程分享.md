### 1.基础回顾（5-10分钟）
1.并发编程和高并发场景区别
2.我们日常工作中何时会用到并发，怎么用
3.并发编程常用套路 1.线程 操作 资源类 （高内聚低耦合）2.线程间通信 判断（防止虚假唤醒用while） 干活 通知 3.volatile标志位flag修饰
4.简单来说就是：
  充分利用多核CPU的计算能力；
  方便进行业务拆分，提升应用性能
5.多线程 安全性问题 原子性，可见性，有序性
        活跃性问题 死锁，活锁，饥饿问题
        性能问题 前面讲到了线程安全和死锁、活锁这些问题会影响多线程执行过程，如果这些都没有发生，多线程并发一定比单线程串行执行快吗，答案是不一定，因为多线程有`创建线程`和`线程上下文切换`的开销。
             
 创建线程是直接向系统申请资源的，对操作系统来说创建一个线程的代价是十分昂贵的，需要给它分配内存、列入调度等。
             
 线程创建完之后，还会遇到线程`上下文切换`。 

       
  如果一个线程无其他异常却迟迟不能继续运行，那基本是处于饥饿状态了。
        
死锁是两个线程都在等待对方释放锁导致阻塞。而`活锁`的意思是线程没有阻塞，还活着呢。

当多个线程都在运行并且修改各自的状态，而其他线程彼此依赖这个状态，导致任何一个线程都无法继续执行，只能重复着自身的动作和修改自身的状态，这种场景就是发生了活锁。如果大家还有疑惑，那我再举一个生活中的例子，大家平时在走路的时候，迎面走来一个人，两个人互相让路，但是又同时走到了一个方向，如果一直这样重复着避让，这俩人就是发生了活锁，学到了吧，嘿嘿。

如果一个线程无其他异常却迟迟不能继续运行，那基本是处于饥饿状态了。

CPU是很宝贵的资源速度也非常快，为了保证雨露均沾，通常为给不同的线程分配`时间片`，当CPU从执行一个线程切换到执行另一个线程时，CPU 需要保存当前线程的本地数据，程序指针等状态，并加载下一个要执行的线程的本地数据，程序指针等，这个开关被称为『上下文切换』。

一般减少上下文切换的方法有：`无锁并发编程`、`CAS 算法`、`使用协程`等。

IO密集型，主要操作磁盘或者远程调用接口 ，配置为2N
CPU密集型，主要进行一些循环，递归计算等功能，配置为N+1

解决方案
在使用CompletableFuture时线程池拒绝策略最好使用AbortPolicy。直接中断主线程，达到快速失败的效果。
耗时的异步线程和CompletableFuture的线程做线程池隔离，让耗时操作不影响主线程的执行

虽然 Future 以及相关使用方法提供了异步执行任务的能力，但是对于结果的获取却是很不方便，只能通过阻塞或者轮询的方式得到任务的结果。阻塞的方式显然和我们的异步编程的初衷相违背，轮询的方式又会耗费无谓的 CPU 资源，而且也不能及时地得到计算结果。

总结
在使用CompletableFuture的时候线程池拒绝策略最好使用AbortPolicy，如果线程池满了直接抛出异常中断主线程，达到快速失败的效果
耗时的异步线程和CompletableFuture的线程做线程池隔离，让耗时操作不影响主线程的执行
不建议直接使用CompletableFuture的get()方法，而是使用future.get(5, TimeUnit.SECONDS);方法指定超时时间
直接中断主线程，要慎用
### 2.CompletableFuture异步编排（30分钟）
1.实际案例，现有代码，优化该怎么写，优化后的接口实际测试对比
 异步与回调
 future callable
 
FutureTask局限性
1. 无法并发执行多个任务: 由于get方法是阻塞的, 因此只能等待所有任务执行完成.
2. 无法组合多个任务: 如果需要对多个任务的执行结果进行操作, 只能一个一个的来.
3. 没有异常处理: Future接口中没有对异常进行处理的方法.
4. 使用不够优雅: 如果在执行完任务想做一些事情, 就必须在调用get()方法的这个方法里面去写.

前面介绍的FutureTask和CompletionService, 都只是在处理简单的任务的时候, 表现比较好, 但是涉及到多任务合并, 多任务互相依赖, 多任务串行等任务复杂编排的情况, 这样就只能手动控制了. 而CompletableFuture则就是为了解决这个问题而出现的.
CompletableFuture是Future接口的拓展, CompletableFuture实现了Future接口, 并在此基础上完善了Future的不足之处, 实现了对任务的编排能力, 借助CompletableFuture, 我们可以轻松的进行对任务的编排, 而不需要像在使用CountDownLatch等工具类那样还要进行大量的其它操作.

思维逻辑: 每一个线程开启一个新事务, 每一个线程在执行后开启事务, 然后在数据库io后悬停线程,等待其他线程全部执行完, 若任一一个线程存在异常(has a), 则需要调度全部线程进行事务回滚.否则则提交全部线程的事务. 
### 3.ThreadLocal日常使用踩坑与总结（30分钟）


试想下这个场景：要执行一个任务逻辑（交给另一个线程处理），并针对任务结果转换，最后执行打印操作，那么该如完成呢？一种是使用Future.get获取任务结果并执行转换逻辑，最后执行打印操作，有没有像stream那样的处理方式呢？借助CompletableFuture的话，实现代码如下

CompletableFuture.supplyAsync(() -> "000")
        .thenApply(s -> s.length()) // Function
        .whenComplete((integer, throwable) -> System.out.println(integer));


Future 以及相关使用方法提供了异步执行任务的能力，但是对于结果的获取却是很不方便，只能通过阻塞或者轮询的方式得到任务的结果。阻塞的方式显然和我们的异步编程的初衷相违背，轮询的方式又会耗费无谓的 CPU 资源，而且也不能及时地得到计算结果

Future 接口的局限性
Future接口可以构建异步应用，但依然有其局限性。它很难直接表述多个Future 结果之间的依赖性。实际开发中，我们经常需要达成以下目的：

将多个异步计算的结果合并成一个

等待Future集合中的所有任务都完成

Future完成事件（即，任务完成以后触发执行动作）

1、进行变换

public <U> CompletionStage<U> thenApply(Function<? super T,? extends U> fn);
public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn);
public <U> CompletionStage<U> thenApplyAsync(Function<? super T,? extends U> fn,Executor executor);
首先说明一下已Async结尾的方法都是可以异步执行的，如果指定了线程池，会在指定的线程池中执行，如果没有指定，默认会在ForkJoinPool.commonPool()



当运行时出现了异常，可以通过exceptionally进行补偿
 public void exceptionally() {
        String result = CompletableFuture.supplyAsync(() -> {
            try {
                Thread.sleep(3000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            if (1 == 1) {
                throw new RuntimeException("测试一下异常情况");
            }
            return "s1";
        }).exceptionally(e -> {
            System.out.println(e.getMessage());
            return "hello world";
        }).join();
        System.out.println(result);
    }
    
       @Test
        public void whenComplete() {
            String result = CompletableFuture.supplyAsync(() -> {
                try {
                    Thread.sleep(3000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (1 == 1) {
                    throw new RuntimeException("测试一下异常情况");
                }
                return "s1";
            }).whenComplete((s, t) -> {
                System.out.println(s);
                System.out.println(t.getMessage());
            }).exceptionally(e -> {
                System.out.println(e.getMessage());
                return "hello world";
            }).join();
            System.out.println(result);
        }
    结果为：
    
    null
    java.lang.RuntimeException: 测试一下异常情况
    java.lang.RuntimeException: 测试一下异常情况

    这里也可以看出，如果使用了exceptionally，就会对最终的结果产生影响，它没有口子返回如果没有异常时的正确的值，这也就引出下面我们要介绍的handle。
    
    
    
    Future是Java5添加的类，用来描述一个异步计算的结果。可以用isDone方法来检查计算是否完成，或者使用get阻塞住调用线程，直至计算完成返回结果，也可以用cancel方法来停止任务的执行。
    
    Future以及相关使用方法提供了异步执行任务的能力，但对于结果的获取却是不方便，只能通过阻塞或轮询的方式得到任务结果。阻塞的方式与我们理解的异步编程其实是相违背的，而轮询又会耗无谓的CPU资源。而且还不能及时得到计算结果，为什么不能用观察者设计模式当计算结果完成及时通知监听者呢？
    
    Java8里面新增加了一个包含50个方法左右的类：CompletableFuture. 提供了非常强大的Future的扩展功能，可以帮助简化异步编程的复杂性，提供了函数式编程能力，可以通过回调的方式计算处理结果，并且提供了转换和组织CompletableFuture的方法。
    
    
    CompletableFuture 类实现了CompletionStage和Future接口，所以还是可以像以前一样通过阻塞或轮询的方式获得结果。尽管这种方式不推荐使用。
    
    public T get()
    public T get(long timeout, TimeUnit unit)
    public T getNow(T valueIfAbsent)
    public T join()
    其中的getNow有点特殊，如果结果已经计算完则返回结果或抛异常，否则返回给定的valueIfAbsent的值。
    
    join返回计算的结果或抛出一个uncheckd异常。
    
    
    以下四个静态方法用来为一段异步执行的代码创建CompletableFuture对象：
    
    public static CompletableFuture<Void> runAsync(Runnable runnable)
     
    public static CompletableFuture<Void> runAsync(Runnable runnable, Executor executor)
     
    public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier)
     
    public static <U> CompletableFuture<U> supplyAsync(Supplier<U> supplier, Executor executor)
    
    异步计算
    所谓异步调用其实就是实现一个可无需等待被调用函数的返回值而让操作继续运行的方法。在 Java 语言中，简单的讲就是另启一个线程来完成调用中的部分计算，使调用继续运行或返回，而不需要等待计算结果。但调用者仍需要取线程的计算结果。
    
    
    在Java8中，CompletableFuture提供了非常强大的Future的扩展功能，可以帮助我们简化异步编程的复杂性，并且提供了函数式编程的能力，可以通过回调的方式处理计算结果，也提供了转换和组合 CompletableFuture 的方法。
    它可能代表一个明确完成的Future，也有可能代表一个完成阶段（ CompletionStage ），它支持在计算完成以后触发一些函数或执行某些动作。
    它实现了Future和CompletionStage接口
    
可以看到，thenAccept和thenRun都是无返回值的。如果说thenApply是不停的输入输出的进行生产，那么thenAccept和thenRun就是在进行消耗。它们是整个计算的最后两个阶段。
 
 
 
事实上，如果每个操作都很简单的话（比如：上面的例子中按照id去查）没有必要用这种多线程异步的方式，因为创建线程还需要时间，还不如直接同步执行来得快。

事实证明，只有当每个操作很复杂需要花费相对很长的时间（比如，调用多个其它的系统的接口；比如，商品详情页面这种需要从多个系统中查数据显示的）的时候用CompletableFuture才合适，不然区别真的不大，还不如顺序同步执行。  

CompletableFuture 类声明了 CompletionStage 接口，CompletionStage 接口实际上提供了同步或异步运行计算的舞台，所以我们可以通过实现多个 CompletionStage 命令，并且将这些命令串联在一起的方式实现多个命令之间的触发。 
    




  下面的例子引用了第一个例子中已经完成的CompletableFuture，它将引用生成的字符串结果并将该字符串大写。
  
  static void thenApplyExample() {
      CompletableFuture cf = CompletableFuture.completedFuture("message").thenApply(s -> {
          assertFalse(Thread.currentThread().isDaemon());
          return s.toUpperCase();
      });
      assertEquals("MESSAGE", cf.getNow(null));
  }
  这里的关键词是thenApply：
  
  then是指在当前阶段正常执行完成后（正常执行是指没有抛出异常）进行的操作。在本例中，当前阶段已经完成并得到值message。
  Apply是指将一个Function作用于之前阶段得出的结果
  Function是阻塞的，这意味着只有当大写操作执行完成之后才会执行getNow()方法。
  
  
  	
Futrue
FutureTask
CompletionService
CompletableFuture
原理	
Futrue接口

接口RunnableFuture的唯一实现类，RunnableFuture接口继承自Future<V>+Runnable:	内部通过阻塞队列+FutureTask接口	JDK8实现了Future<T>, CompletionStage<T>2个接口
多任务并发执行	支持	支持	支持	支持
获取任务结果的顺序	
按照提交顺序获取结果

 未知	 支持任务完成的先后顺序	支持任务完成的先后顺序
异常捕捉	 自己捕捉	 自己捕捉	 自己捕捉	源生API支持，返回每个任务的异常
建议	CPU高速轮询，耗资源，可以使用，但不推荐	 功能不对口，并发任务这一块多套一层，不推荐使用。	 推荐使用，没有JDK8CompletableFuture之前最好的方案，没有质疑	
  API极端丰富，配合流式编程，速度飞起，推荐使用！
  
  
  
  CompletableFuture能够将回调放到与任务不同的线程中执行，也能将回调作为继续执行的同步函数，在与任务相同的线程中执行。它避免了传统回调最大的问题，那就是能够将控制流分离到不同的事件处理器中
  
  
CompletableFuture的静态工厂方法

方法名	描述
runAsync(Runnable runnable)	使用ForkJoinPool.commonPool()作为它的线程池执行异步代码。
runAsync(Runnable runnable, Executor executor)	使用指定的thread pool执行异步代码。
supplyAsync(Supplier<U> supplier)	使用ForkJoinPool.commonPool()作为它的线程池执行异步代码，异步操作有返回值
supplyAsync(Supplier<U> supplier, Executor executor)	使用指定的thread pool执行异步代码，异步操作有返回值


可以看到future调用complete(T t)会立即执行。但是complete(T t)只能调用一次，后续的重复调用会失效。

如果future已经执行完毕能够返回结果，此时再调用complete(T t)则会无效。


CompletableFuture同时是一个组合和一个框架，具有大约50种不同的构成，结合，执行异步计算步骤和处理错误。

如此庞大的API可能会令人难以招架，下文将调一些重要的做重点介绍。



两个方法都接收一个CompletableFuture并将其应用于计算结果，但thenCompose（flatMap）方法接收一个函数，该函数返回相同类型的另一个CompletableFuture对象。此功能结构允许将这些类的实例继续进行组合计算。

更简单的情况是，当你想要使用两个Future结果时，但不需要将任何结果值进行返回时，可以用thenAcceptBoth，它表示后续的处理不需要返回值，而 thenCombine 表示需要返回值：


thenApply()
此方法用于处理先前调用的结果。但是，要记住的一个关键点是返回类型是转换泛型中的类型，是同一个CompletableFuture。

因此，当我们想要转换CompletableFuture 调用的结果时，效果是这样的 ：

 
CompletableFuture<Integer> finalResult = compute().thenApply(s-> s + 1);
 
 请注意，CompletableFuture.allOf()的返回类型是CompletableFuture 。这种方法的局限性在于它不会返回所有任务的综合结果。相反，你必须手动从Futures获取结果。幸运的是，CompletableFuture.join()方法和Java 8 Streams API可以解决：
 
  
 String combined = Stream.of(future1, future2, future3)
   .map(CompletableFuture::join)
   .collect(Collectors.joining(" "));
  
 assertEquals("Hello Beautiful World", combined);
  

