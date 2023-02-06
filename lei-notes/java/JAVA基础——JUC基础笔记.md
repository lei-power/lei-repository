1. 多线程编程模板
   1.1 线程 操作 资源类（资源类内聚操作）
   1.2 线程间通信 具体操作
   1.2.1判断 干活 通知 多个线程防止虚假唤醒用while（）{}

2.1 集合的新增线程不安全，写时复制 copyOnWrite 写的时候复制一个容器，写完将指针指向新容器


JUC第一天:
回顾：JVM
1.	JVM 体系结构

		2.	能够解析每个结构的作用
				
		3.	如何调优
				堆：
					新生区：
						普通 GC 
					养老区：
						Full GC
					元空间：
						
		4.	GC	:	分代收集算法！
				新生区：复制算法！
				养老区：标记清除！标记整理！

重点：
1.	什么是JUC {java.util.concurrent在并发编程中使用的工具类}!

	2.	wait/sleep的区别!
			wait 释放资源锁！ Object
			sleep 不释放资源锁！Thread
			
	3.	并发，并行!
			
	4.	编写卖票的案例！
		
	5.	lock 接口 来代替synchronized：
			直接将synchronized lock.lock(); lock.unlock();
		
	6.	拉姆达表达式：
			操作符区分 ： ->  左边：方法的参数 ，右边： 方法的实现！
			
			基本语法：拷贝小括号（），写死右箭头->，落地大括号{...}
			
			函数式接口表示：@FunctionalInterface 这个接口中只能有一个方法{抽象方法}！
			
			函数式接口中能否有实现的方法？
			
	7.	线程间通信：
			一个线程对一个数+1 ，一个线程对一个数-1
			两个线程操作的时候，没问题！
			
			如果换成4个线程，则会出现2的情况！这种情况：虚假唤醒！
			解决方案：将if判断条件改成while！
			
			java8新版实现：
				lock 接口 来代替synchronized：
				lock.newCondition();
				await()			wait()
				signalAll()		notifyAll();
			
--------------------------------------------------------------------------------------------
总结：
上午：
1.	面试题！

		2.	lock 接口的使用！
				lock 接口 来代替synchronized
				
				lock 接口 来代替synchronized：
				lock.newCondition();
				await()			wait()
				signalAll()		notifyAll();

下午：
1.	线程定制化通信！
demo: AA打印5次，BB打印10次，CC打印15次
......来10轮

			a.	线程操作资源类
			
			b.	判断，干活，通知
			
			实现思路：
			1、有顺序通知，需要有标识位
			2、有一个锁Lock，3把钥匙Condition
			3、判断标志位
			4、输出线程名+第几次+第几轮
			5、修改标志位，通知下一个
			
				lock 接口 来代替synchronized：
				lock.newCondition();
				await()			wait()
				signalAll()		notifyAll();
				signal()		notify();
				
	2.	集合类是不安全的
			a.	Vector;
			b.	Collections.synchronizedList(new ArrayList<>());
			c.	CopyOnWriteArrayList;	写时复制！
				底层源码：原理
				public boolean add(E e) {
					final ReentrantLock lock = this.lock;
					lock.lock();
					try {
						Object[] elements = getArray();
						int len = elements.length;
						Object[] newElements = Arrays.copyOf(elements, len + 1);
						newElements[len] = e;
						setArray(newElements);
						return true;
					} finally {
						lock.unlock();
					}
				}
				
				//	有位置选择！
				public void add(int index, E element) {
					final ReentrantLock lock = this.lock;
					lock.lock();
					try {
						Object[] elements = getArray();
						int len = elements.length;
						if (index > len || index < 0)
							throw new IndexOutOfBoundsException("Index: "+index+
																", Size: "+len);
						Object[] newElements;
						int numMoved = len - index;
						if (numMoved == 0)
							newElements = Arrays.copyOf(elements, len + 1);
						else {
							newElements = new Object[len + 1];
							System.arraycopy(elements, 0, newElements, 0, index);
							System.arraycopy(elements, index, newElements, index + 1,
											 numMoved);
						}
						newElements[index] = element;
						setArray(newElements);
					} finally {
						lock.unlock();
					}
				}
				
			在多线程的情况下：如果要写入，修改数据！CopyOnWriteArrayList; 相对要比Collections.synchronizedList(); 速度快，性能提升！
			
			ArrayList ---> CopyOnWriteArrayList();
			HashSet ---> CopyOnWriteArraySet();
			HashMap ---> ConcurrentHashMap<>();



JUC 第二天：
回顾：
第一天：
面试题：
线程，进程
并发，并行
wait/sleep的区别!

			lock 接口：
				lock.lock();
				try {
					//	执行的代码块
				}finally{
					lock.unlock();
				}
				
			线程的通信：
				java8新版实现：
				lock 接口 来代替synchronized：
				Condition c1 = lock.newCondition();
				await()			wait()
				signal()		notify()
				signalAll()		notifyAll()
				
			集合安全类：
				ArrayList ---> CopyOnWriteArrayList();
				HashSet ---> CopyOnWriteArraySet();
				HashMap ---> ConcurrentHashMap<>();

1.	锁的八种情况： *****
      1 标准访问，先打印短信还是邮件
      2 停4秒在短信方法内，先打印短信还是邮件
      3 新增普通的hello方法，是先打短信还是hello
      4 现在有两部手机，先打印短信还是邮件
      5 两个静态同步方法，1部手机，先打印短信还是邮件
      6 两个静态同步方法，2部手机，先打印短信还是邮件
      7 1个静态同步方法,1个普通同步方法，1部手机，先打印短信还是邮件
      8 1个静态同步方法,1个普通同步方法，2部手机，先打印短信还是邮件

      a.	如果只有普通同步方法的时候！
      执行顺序：按照代码写的顺序去执行！ 当前锁的对象是 this！

      b.	如果有普通方法和同步方法的时候！
      正常情况下：按照代码顺序执行，如果同步方法中有睡眠，则先执行普通方法！

      c.	当不是同一个对象调用普通的同步方法时：
      本质：每次创建对象的时候，都会创建属于自己的锁！这个锁就是当前对象 this！

      d.	静态同步方法当前锁对象：Class.class

2.	Callable接口
      2.1	获得多线程的方法几种？ *****
      4种
      （1）继承Thread类
      （2）runnable接口
      （3）Callable接口
      （4）线程池
      Callable函数接口



		2.2	FutureTask 是Runable 一个实现类！通常用它来计算一个比较耗时的任务！ 计算未来任务！最终获取结果！******
			使用get();方法获取到计算结果！通常放在最后，并且只计算一次！
						
			找到中间人：Runnable！
			Thread 构造函数
			Thread(Runnable target, String name) 
		
			FutureTask(Callable<V> callable)！
			
			//	实现了Runnable 接口
			new Thread(()->{
				  phone.getHello();
			},"BB").start();
			
			FutureTask f = new FutureTask(()->{
				
			});
			
			new Thread(f,"FF").start();
		
		
		2.3 面试题:callable接口与runnable接口的区别？*****
		 
		 答：  （1）是否有返回值
						callable 有
			   （2）是否抛异常
						callable 有
			   （3）落地方法不一样，一个是run，一个是call
						callable -- call .
						
		
		2.4	如何使用！*****
			// 创建一个FutureTask 这个需要实现一个callable 函数式接口
			FutureTask<Integer> futureTask = new FutureTask<Integer>(()->{
				System.out.println(Thread.currentThread().getName()+"  come in callable");
				Thread.sleep(1000);
				//  设置返回值
				return 1024;
			});
			//  FutureTask 是Runnable 的实现类
			new Thread(futureTask,"AA").start();
			//  可以在调用结果之前判断当前任务是否已经完成！如果没用完成，则等待
			while (!futureTask.isDone()){
				System.out.println("等待.....");
			}
			System.out.println(futureTask.get());


3.	JUC强大的辅助类 - 【了解】
      3.1	CountDownLatch	减少计数 记录线程个数
      countDownLatch.countDown();	//	线程数 减一
      countDownLatch.await(); //	知道线程的个数为0 的时候，就不等待了。

      3.2	CyclicBarrier 循环栅栏
      cyclicBarrier.await(); //	如果没有满足初始化值的时候，那么就会等待！

      3.3	Semaphore 信号量
      semaphore.acquire();	//	获取到资源
      semaphore.release();	// 释放资源

-----------------------------------------------------------------------------------
JUC
下午：
1.ReentrantReadWriteLock 读写锁 -- 了解
readWriteLock.writeLock().lock();
readWriteLock.readLock().lock();

	2.BlockingQueue *****
		队列：先进先出
		阻塞队列：
		add(e):满时抛出IIIegalStableException：queue full
		remove()：空时移除抛出nosuchElementException
		element（）
		
		offer(e):成功ture 失败false
		poll（）：成功返回元素，失败返回null
		peek（）
		
		put（）：满时阻塞
		take（）：空时阻塞
		
		
			put: 添加元素
			take: 获取元素
			a.	当队列是空的，从队列中获取元素的操作将会被阻塞
			b.	当队列是满的，从队列中添加元素的操作将会被阻塞
			
		阻塞队列的应用场景：
			线程池！
			
		
		代码演示：
			put();
			take();
			
	3.线程池：
		简单定义：处理过程中将任务放入队列，如果线程数量超过了最大数量，超出数量的线程排队等候，等其他线程执行完毕，再从队列中取出任务来执行。
		
		线程池优势：
			线程复用;控制最大并发数;管理线程。***** 管理线程的生命周期
		
		线程池种类：
			第一种：Executors.newFixedThreadPool(10);	初始化线程池的大小.
					    public static ExecutorService newFixedThreadPool(int nThreads) {
							return new ThreadPoolExecutor(nThreads, nThreads,
														  0L, TimeUnit.MILLISECONDS,
														  new LinkedBlockingQueue<Runnable>());
						}
								
			第二种：Executors.newSingleThreadExecutor();	一池，一线程！
						public static ExecutorService newSingleThreadExecutor() {
							return new FinalizableDelegatedExecutorService
								(new ThreadPoolExecutor(1, 1,
														0L, TimeUnit.MILLISECONDS,
														new LinkedBlockingQueue<Runnable>()));
						}
			第三种：Executors.newCachedThreadPool();  执行异步短期任务，可扩容.
						public static ExecutorService newCachedThreadPool() {
							return new ThreadPoolExecutor(0, Integer.MAX_VALUE,
														  60L, TimeUnit.SECONDS,
														  new SynchronousQueue<Runnable>());
						}
						
			三种创建线程池的方式：底层都是new ThreadPoolExecutor();
			
			
			用线程池：使用哪一种？都不用！
				自定义线程池：
					new ThreadPoolExecutor(0, Integer.MAX_VALUE,
														  60L, TimeUnit.SECONDS,
														  new SynchronousQueue<Runnable>());



JUC 第三天：
回顾：
1.	锁的八种状态

		2.	Callable 函数式接口 {创建线程四种方式之一！}
				
		3.	阻塞队列：
				
		4.	线程池：
				
		5.	读写锁了解！

1.	继续完成线程池知识：
      1.1	深入了解ThreadPoolExecutor！它是一个class
      //  创建线程池：如何确定当前核心线程池个数：
      ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(
      2,  //  核心线程池
      5,  //  最大线程池
      3L, //  空闲线程的存活时间
      TimeUnit.SECONDS, //  空闲线程存活时间单位
      new ArrayBlockingQueue<>(3), //  阻塞队列个数
      Executors.defaultThreadFactory(),   //  使用默认的线程池工程
      new ThreadPoolExecutor.AbortPolicy() //  默认值：直接发生异常，阻止运行！
      //  new ThreadPoolExecutor.DiscardOldestPolicy() // 抛弃等待最久的任务，尝试加入新的任务！
      //  new ThreadPoolExecutor.CallerRunsPolicy() //    调用者执行任务！
      //  new ThreadPoolExecutor.DiscardPolicy()  //  丢弃任务，没有任何异常！
      );

	1.2	线程池底层工作原理：*****
			
	1.3	线程池的拒绝策略：
			条件：阻塞队列+最大核心线程池数已满！
			    new ThreadPoolExecutor.AbortPolicy() //  默认值：直接发生异常，阻止运行！
                //  new ThreadPoolExecutor.DiscardOldestPolicy() // 抛弃等待最久的任务，尝试加入新的任务！
                //  new ThreadPoolExecutor.CallerRunsPolicy() //    调用者执行任务！
                //  new ThreadPoolExecutor.DiscardPolicy()  //  丢弃任务，没有任何异常！
	FixedThredPool、SingleThreadPool 工作队列长度为Inter.max.value 导致oom
	CachedThreadPool、ScheduledThreadPool 最大线程数为Intrger.MAX_VALUE ,导致OOM



2.	java8回顾：*****
      2.1	四大函数式接口：
      //  消费型：没有返回值！
      //  复制小括号，写死右箭头，落地大括号！
      Consumer<String> consumer = (t)->{
      System.out.println(t);
      };
      consumer.accept("hello");

      //  供给型：没有参数！
      //  Supplier T get();
      Supplier<String> supplier = ()->{
      return UUID.randomUUID().toString();
      };
      System.out.println(supplier.get());

      //  函数式接口
      //  Function<T, R> R apply(T t)
      Function<Integer,Integer> function =(t)->{
      return t*2;
      };
      System.out.println(function.apply(6));

      //  断定型接口
      //  Predicate<T> boolean test(T t);
      Predicate<String> predicate = (t)->{
      return t.startsWith("f");
      };
      System.out.println(predicate.test("atguigu"));
      System.out.println(predicate.test("full outer join"));


	2.2	Stream 流操作！
			定义：对数据源的计算！
			特点：
				a.	不会存储元素
				b.	经过操作不会改变原有的数据，而会产生新的数据源
				c.	操作延迟的
				
			Stream 流演示！
				1.	创建一个User对象。
					java 中一个对象中应该有的 ：属性，get,set 方法，构造方法。。。

3.	分支合并框架： 了解
      3.1	ForkJoinPool:	分支合并池   fork(); join();
      3.2	ForkJoinTask:	完成某一项功能	get();
      3.3	RecursiveTask： 递归任务：继承后可以实现递归(自己调自己)调用的任务


4.	异步编排 *****
      CompletableFuture : 异步处理，与FutureTask 功能类似！
      异步无返回值：runAsync();
      异步有返回值：supplyAsync();
      接收上一个线程返回的结果集：whenComplete
      处理异常：exceptionally







































-----------------------------------------completableFuture------------------------------------------





### 常用方法

#### 获得结果和触发计算
##### 获得结果
1. get() 不见不散，会阻塞
2. get(long timeout,TimeUnit unit) 过时不候
3. getNow(T target) 立即获得*不阻塞*，算完了则返回结果，没算完返回替代品target
4. **join()**

##### 主动触发计算
1. public boolean complete(T value) get()没算完的话就打断返回value值*思考与getNow()的区别*
```java
    public static void main(String[] args) throws ExecutionException, InterruptedException{
        CompletableFuture<Integer> completableFuture = CompletableFuture.supplyAsync(() -> {
            try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); }
            return 533;
        });
        //注释掉暂停线程，get还没有算完只能返回complete方法设置的444；暂停2秒钟线程，异步线程能够计算完成返回get
        try { TimeUnit.SECONDS.sleep(2); } catch (InterruptedException e) { e.printStackTrace(); }
        //当调用CompletableFuture.get()被阻塞的时候,complete方法就是结束阻塞并get()获取设置的complete里面的值.
        System.out.println(completableFuture.complete(444)+"\t"+completableFuture.get()); 
    }
```
#### 对计算结果进行处理
1. thenApply 计算结果存在依赖关系，将2个线程串行化；由于存在依赖关系，当前步错不会走下一步，异常叫停  *whenComplete((v,e)->{}).exceptionally(e->{})* 出现异常捕获like try/catch
```java
    //当一个线程依赖另一个线程时用 handle 方法来把这两个线程串行化,
    CompletableFuture.supplyAsync(() -> {
        //暂停几秒钟线程
        try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); }
        System.out.println("111");
        return 1024;
    }).handle(f -> {
        System.out.println("222");
        return f + 1;
    }).handle(f -> {
        //int age = 10/0; // 异常情况：那步出错就停在那步。
        System.out.println("333");
        return f + 1;
    }).whenCompleteAsync((v,e) -> {
        System.out.println("*****v: "+v);
    }).exceptionally(e -> {
        e.printStackTrace();
        return null;
    });
    System.out.println("-----主线程结束，END");
    // 主线程不要立刻结束，否则CompletableFuture默认使用的线程池会立刻关闭:
    try { TimeUnit.SECONDS.sleep(2); } catch (InterruptedException e) { e.printStackTrace(); }
```
2. handle 有异常也可以往下走，根据异常参数进行进一步处理   异常不叫停  *whenComplete((v,e)->{}).exceptionally(e->{})* 出现异常捕获like try/finally
```java
        //当一个线程依赖另一个线程时用 handle 方法来把这两个线程串行化,
        // 异常情况：有异常也可以往下一步走，根据带的异常参数可以进一步处理
        CompletableFuture.supplyAsync(() -> {
            //暂停几秒钟线程
            try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); }
            System.out.println("111");
            return 1024;
        }).handle((f,e) -> {
            int age = 10/0;
            System.out.println("222");
            return f + 1;
        }).handle((f,e) -> {
            System.out.println("333");
            return f + 1;
        }).whenCompleteAsync((v,e) -> {
            System.out.println("*****v: "+v);
        }).exceptionally(e -> {
            e.printStackTrace();
            return null;
        });
        System.out.println("-----主线程结束，END");

        // 主线程不要立刻结束，否则CompletableFuture默认使用的线程池会立刻关闭:
        try { TimeUnit.SECONDS.sleep(2); } catch (InterruptedException e) { e.printStackTrace(); }
```

**whenComplete():执行当前任务的线程继续执行whenComplete()**
**whenCompleteAsync():把whenCompleteAsync()提交给线程池来运行**

#### 对计算结果进行消费 （串行化执行）
1. thenAccept
2. thenRun
3. handle

#### 对计算速度进行选用
applyToEither 2个Completablefuture 哪个快用哪个,2个线程都执行的·
```java
completableFuture1 = new completableFuture();
completableFuture2 = new completableFuture();
CompletableFuture<Integer> thenCombineResult = completableFuture1.applyToEither(completableFuture2, f -> {return f + 1;});
```

#### 对计算结果进行合并
1. thenCombine 先完成的等着其他分支完成任务
```java
 CompletableFuture<Integer> thenCombineResult = CompletableFuture.supplyAsync(() -> 10).thenCombine(CompletableFuture.supplyAsync(() -> 20), (x, y) -> x + y).thenCombine(CompletableFuture.supplyAsync(() -> 30), (a, b) -> a + b);
```


