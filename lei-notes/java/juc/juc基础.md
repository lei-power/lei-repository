1. ���̱߳��ģ��
1.1 �߳� ���� ��Դ�ࣨ��Դ���ھ۲�����
1.2 �̼߳�ͨ�� �������
1.2.1�ж� �ɻ� ֪ͨ ����̷߳�ֹ��ٻ�����while����{}

2.1 ���ϵ������̲߳���ȫ��дʱ���� copyOnWrite д��ʱ����һ��������д�꽫ָ��ָ��������


JUC��һ��:
	�عˣ�JVM
		1.	JVM ��ϵ�ṹ
				
		2.	�ܹ�����ÿ���ṹ������
				
		3.	��ε���
				�ѣ�
					��������
						��ͨ GC 
					��������
						Full GC
					Ԫ�ռ䣺
						
		4.	GC	:	�ִ��ռ��㷨��
				�������������㷨��
				�����������������������
		
�ص㣺
	1.	ʲô��JUC {java.util.concurrent�ڲ��������ʹ�õĹ�����}!
	
	2.	wait/sleep������!
			wait �ͷ���Դ���� Object
			sleep ���ͷ���Դ����Thread
			
	3.	����������!
			
	4.	��д��Ʊ�İ�����
		
	5.	lock �ӿ� ������synchronized��
			ֱ�ӽ�synchronized lock.lock(); lock.unlock();
		
	6.	��ķ����ʽ��
			���������� �� ->  ��ߣ������Ĳ��� ���ұߣ� ������ʵ�֣�
			
			�����﷨������С���ţ�����д���Ҽ�ͷ->����ش�����{...}
			
			����ʽ�ӿڱ�ʾ��@FunctionalInterface ����ӿ���ֻ����һ������{���󷽷�}��
			
			����ʽ�ӿ����ܷ���ʵ�ֵķ�����
			
	7.	�̼߳�ͨ�ţ�
			һ���̶߳�һ����+1 ��һ���̶߳�һ����-1
			�����̲߳�����ʱ��û���⣡
			
			�������4���̣߳�������2������������������ٻ��ѣ�
			�����������if�ж������ĳ�while��
			
			java8�°�ʵ�֣�
				lock �ӿ� ������synchronized��
				lock.newCondition();
				await()			wait()
				signalAll()		notifyAll();
			
--------------------------------------------------------------------------------------------
�ܽ᣺
	���磺
		1.	�����⣡
			
		2.	lock �ӿڵ�ʹ�ã�
				lock �ӿ� ������synchronized
				
				lock �ӿ� ������synchronized��
				lock.newCondition();
				await()			wait()
				signalAll()		notifyAll();
		
���磺
	1.	�̶߳��ƻ�ͨ�ţ�
			demo: AA��ӡ5�Σ�BB��ӡ10�Σ�CC��ӡ15��
				......��10�� 
			
			a.	�̲߳�����Դ��
			
			b.	�жϣ��ɻ֪ͨ
			
			ʵ��˼·��
			1����˳��֪ͨ����Ҫ�б�ʶλ
			2����һ����Lock��3��Կ��Condition
			3���жϱ�־λ
			4������߳���+�ڼ���+�ڼ���
			5���޸ı�־λ��֪ͨ��һ��
			
				lock �ӿ� ������synchronized��
				lock.newCondition();
				await()			wait()
				signalAll()		notifyAll();
				signal()		notify();
				
	2.	�������ǲ���ȫ��
			a.	Vector;
			b.	Collections.synchronizedList(new ArrayList<>());
			c.	CopyOnWriteArrayList;	дʱ���ƣ�
				�ײ�Դ�룺ԭ��
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
				
				//	��λ��ѡ��
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
				
			�ڶ��̵߳�����£����Ҫд�룬�޸����ݣ�CopyOnWriteArrayList; ���Ҫ��Collections.synchronizedList(); �ٶȿ죬����������
			
			ArrayList ---> CopyOnWriteArrayList();
			HashSet ---> CopyOnWriteArraySet();
			HashMap ---> ConcurrentHashMap<>();
			


JUC �ڶ��죺
	�عˣ�
		��һ�죺
			�����⣺
				�̣߳�����
				����������
				wait/sleep������!
				
			lock �ӿڣ�
				lock.lock();
				try {
					//	ִ�еĴ����
				}finally{
					lock.unlock();
				}
				
			�̵߳�ͨ�ţ�
				java8�°�ʵ�֣�
				lock �ӿ� ������synchronized��
				Condition c1 = lock.newCondition();
				await()			wait()
				signal()		notify()
				signalAll()		notifyAll()
				
			���ϰ�ȫ�ࣺ
				ArrayList ---> CopyOnWriteArrayList();
				HashSet ---> CopyOnWriteArraySet();
				HashMap ---> ConcurrentHashMap<>();

1.	���İ�������� *****
		 1 ��׼���ʣ��ȴ�ӡ���Ż����ʼ�
		 2 ͣ4���ڶ��ŷ����ڣ��ȴ�ӡ���Ż����ʼ�
		 3 ������ͨ��hello���������ȴ���Ż���hello
		 4 �����������ֻ����ȴ�ӡ���Ż����ʼ�
		 5 ������̬ͬ��������1���ֻ����ȴ�ӡ���Ż����ʼ�
		 6 ������̬ͬ��������2���ֻ����ȴ�ӡ���Ż����ʼ�
		 7 1����̬ͬ������,1����ͨͬ��������1���ֻ����ȴ�ӡ���Ż����ʼ�
		 8 1����̬ͬ������,1����ͨͬ��������2���ֻ����ȴ�ӡ���Ż����ʼ�
				
		a.	���ֻ����ͨͬ��������ʱ��
				ִ��˳�򣺰��մ���д��˳��ȥִ�У� ��ǰ���Ķ����� this��
		
		b.	�������ͨ������ͬ��������ʱ��
				��������£����մ���˳��ִ�У����ͬ����������˯�ߣ�����ִ����ͨ������
				
		c.	������ͬһ�����������ͨ��ͬ������ʱ��
				���ʣ�ÿ�δ��������ʱ�򣬶��ᴴ�������Լ���������������ǵ�ǰ���� this��
				
		d.	��̬ͬ��������ǰ������Class.class
		
2.	Callable�ӿ�
		2.1	��ö��̵߳ķ������֣� *****
			4��
			��1���̳�Thread��
			��2��runnable�ӿ�
			��3��Callable�ӿ�
			��4���̳߳�
		Callable�����ӿ�	
		
		
		
		2.2	FutureTask ��Runable һ��ʵ���࣡ͨ������������һ���ȽϺ�ʱ������ ����δ���������ջ�ȡ�����******
			ʹ��get();������ȡ����������ͨ��������󣬲���ֻ����һ�Σ�
						
			�ҵ��м��ˣ�Runnable��
			Thread ���캯��
			Thread(Runnable target, String name) 
		
			FutureTask(Callable<V> callable)��
			
			//	ʵ����Runnable �ӿ�
			new Thread(()->{
				  phone.getHello();
			},"BB").start();
			
			FutureTask f = new FutureTask(()->{
				
			});
			
			new Thread(f,"FF").start();
		
		
		2.3 ������:callable�ӿ���runnable�ӿڵ�����*****
		 
		 ��  ��1���Ƿ��з���ֵ
						callable ��
			   ��2���Ƿ����쳣
						callable ��
			   ��3����ط�����һ����һ����run��һ����call
						callable -- call .
						
		
		2.4	���ʹ�ã�*****
			// ����һ��FutureTask �����Ҫʵ��һ��callable ����ʽ�ӿ�
			FutureTask<Integer> futureTask = new FutureTask<Integer>(()->{
				System.out.println(Thread.currentThread().getName()+"  come in callable");
				Thread.sleep(1000);
				//  ���÷���ֵ
				return 1024;
			});
			//  FutureTask ��Runnable ��ʵ����
			new Thread(futureTask,"AA").start();
			//  �����ڵ��ý��֮ǰ�жϵ�ǰ�����Ƿ��Ѿ���ɣ����û����ɣ���ȴ�
			while (!futureTask.isDone()){
				System.out.println("�ȴ�.....");
			}
			System.out.println(futureTask.get());
			
			
3.	JUCǿ��ĸ����� - ���˽⡿
		3.1	CountDownLatch	���ټ��� ��¼�̸߳���
			countDownLatch.countDown();	//	�߳��� ��һ
			countDownLatch.await(); //	֪���̵߳ĸ���Ϊ0 ��ʱ�򣬾Ͳ��ȴ��ˡ�
			
		3.2	CyclicBarrier ѭ��դ��
			cyclicBarrier.await(); //	���û�������ʼ��ֵ��ʱ����ô�ͻ�ȴ���
			
		3.3	Semaphore �ź���
			semaphore.acquire();	//	��ȡ����Դ
			semaphore.release();	// �ͷ���Դ
		
-----------------------------------------------------------------------------------
JUC 
���磺
	1.ReentrantReadWriteLock ��д�� -- �˽�
		readWriteLock.writeLock().lock();
		readWriteLock.readLock().lock();
		
	2.BlockingQueue *****
		���У��Ƚ��ȳ�
		�������У�
		add(e):��ʱ�׳�IIIegalStableException��queue full
		remove()����ʱ�Ƴ��׳�nosuchElementException
		element����
		
		offer(e):�ɹ�ture ʧ��false
		poll�������ɹ�����Ԫ�أ�ʧ�ܷ���null
		peek����
		
		put��������ʱ����
		take��������ʱ����
		
		
			put: ���Ԫ��
			take: ��ȡԪ��
			a.	�������ǿյģ��Ӷ����л�ȡԪ�صĲ������ᱻ����
			b.	�����������ģ��Ӷ��������Ԫ�صĲ������ᱻ����
			
		�������е�Ӧ�ó�����
			�̳߳أ�
			
		
		������ʾ��
			put();
			take();
			
	3.�̳߳أ�
		�򵥶��壺��������н����������У�����߳�������������������������������߳��ŶӵȺ򣬵������߳�ִ����ϣ��ٴӶ�����ȡ��������ִ�С�
		
		�̳߳����ƣ�
			�̸߳���;������󲢷���;�����̡߳�***** �����̵߳���������
		
		�̳߳����ࣺ
			��һ�֣�Executors.newFixedThreadPool(10);	��ʼ���̳߳صĴ�С.
					    public static ExecutorService newFixedThreadPool(int nThreads) {
							return new ThreadPoolExecutor(nThreads, nThreads,
														  0L, TimeUnit.MILLISECONDS,
														  new LinkedBlockingQueue<Runnable>());
						}
								
			�ڶ��֣�Executors.newSingleThreadExecutor();	һ�أ�һ�̣߳�
						public static ExecutorService newSingleThreadExecutor() {
							return new FinalizableDelegatedExecutorService
								(new ThreadPoolExecutor(1, 1,
														0L, TimeUnit.MILLISECONDS,
														new LinkedBlockingQueue<Runnable>()));
						}
			�����֣�Executors.newCachedThreadPool();  ִ���첽�������񣬿�����.
						public static ExecutorService newCachedThreadPool() {
							return new ThreadPoolExecutor(0, Integer.MAX_VALUE,
														  60L, TimeUnit.SECONDS,
														  new SynchronousQueue<Runnable>());
						}
						
			���ִ����̳߳صķ�ʽ���ײ㶼��new ThreadPoolExecutor();
			
			
			���̳߳أ�ʹ����һ�֣������ã�
				�Զ����̳߳أ�
					new ThreadPoolExecutor(0, Integer.MAX_VALUE,
														  60L, TimeUnit.SECONDS,
														  new SynchronousQueue<Runnable>());
				
			
			
JUC �����죺
	�عˣ�
		1.	���İ���״̬
				
		2.	Callable ����ʽ�ӿ� {�����߳����ַ�ʽ֮һ��}
				
		3.	�������У�
				
		4.	�̳߳أ�
				
		5.	��д���˽⣡
				
1.	��������̳߳�֪ʶ��
	1.1	�����˽�ThreadPoolExecutor������һ��class
			//  �����̳߳أ����ȷ����ǰ�����̳߳ظ�����
			ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(
					2,  //  �����̳߳�
					5,  //  ����̳߳�
					3L, //  �����̵߳Ĵ��ʱ��
					TimeUnit.SECONDS, //  �����̴߳��ʱ�䵥λ
					new ArrayBlockingQueue<>(3), //  �������и���
					Executors.defaultThreadFactory(),   //  ʹ��Ĭ�ϵ��̳߳ع���
					new ThreadPoolExecutor.AbortPolicy() //  Ĭ��ֵ��ֱ�ӷ����쳣����ֹ���У�
					//  new ThreadPoolExecutor.DiscardOldestPolicy() // �����ȴ���õ����񣬳��Լ����µ�����
					//  new ThreadPoolExecutor.CallerRunsPolicy() //    ������ִ������
					//  new ThreadPoolExecutor.DiscardPolicy()  //  ��������û���κ��쳣��
			);
				
	1.2	�̳߳صײ㹤��ԭ��*****
			
	1.3	�̳߳صľܾ����ԣ�
			��������������+�������̳߳���������
			    new ThreadPoolExecutor.AbortPolicy() //  Ĭ��ֵ��ֱ�ӷ����쳣����ֹ���У�
                //  new ThreadPoolExecutor.DiscardOldestPolicy() // �����ȴ���õ����񣬳��Լ����µ�����
                //  new ThreadPoolExecutor.CallerRunsPolicy() //    ������ִ������
                //  new ThreadPoolExecutor.DiscardPolicy()  //  ��������û���κ��쳣��
	FixedThredPool��SingleThreadPool �������г���ΪInter.max.value ����oom
	CachedThreadPool��ScheduledThreadPool ����߳���ΪIntrger.MAX_VALUE ,����OOM
	
			
			
2.	java8�عˣ�*****
	2.1	�Ĵ���ʽ�ӿڣ�
		//  �����ͣ�û�з���ֵ��
        //  ����С���ţ�д���Ҽ�ͷ����ش����ţ�
        Consumer<String> consumer = (t)->{
            System.out.println(t);
        };
        consumer.accept("hello");

        //  �����ͣ�û�в�����
        //  Supplier T get();
        Supplier<String> supplier = ()->{
            return UUID.randomUUID().toString();
        };
        System.out.println(supplier.get());

        //  ����ʽ�ӿ�
        //  Function<T, R> R apply(T t)
        Function<Integer,Integer> function =(t)->{
            return t*2;
        };
        System.out.println(function.apply(6));

        //  �϶��ͽӿ�
        //  Predicate<T> boolean test(T t);
        Predicate<String> predicate = (t)->{
            return t.startsWith("f");
        };
        System.out.println(predicate.test("atguigu"));
        System.out.println(predicate.test("full outer join"));
		
		
	2.2	Stream ��������
			���壺������Դ�ļ��㣡
			�ص㣺
				a.	����洢Ԫ��
				b.	������������ı�ԭ�е����ݣ���������µ�����Դ
				c.	�����ӳٵ�
				
			Stream ����ʾ��
				1.	����һ��User����
					java ��һ��������Ӧ���е� �����ԣ�get,set ���������췽��������
			
3.	��֧�ϲ���ܣ� �˽�
		3.1	ForkJoinPool:	��֧�ϲ���   fork(); join();
		3.2	ForkJoinTask:	���ĳһ���	get();
		3.3	RecursiveTask�� �ݹ����񣺼̳к����ʵ�ֵݹ�(�Լ����Լ�)���õ�����
		

4.	�첽���� *****
		CompletableFuture : �첽������FutureTask �������ƣ�
		�첽�޷���ֵ��runAsync();
		�첽�з���ֵ��supplyAsync();
		������һ���̷߳��صĽ������whenComplete
		�����쳣��exceptionally
	
		
		
				
			
			

		
	

	
	
	

			
			
			
			
		
		
		
		
		
			
			
		
		
		
		
		
		
		
				
			
			
			
			
		
		
			