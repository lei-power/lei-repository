
### 线程中断
1. void interrupt()
2. static boolean interrupted() 判断是否中断再重置中断标识
3. boolean isInterrupted()
####如何实现
1.*通过volatile变量设置中断标志* 利用了其可见性
2. 通过AtomicBoolean设置中断标志
3. 通过Thread类自带的interrupt相关API来实现线程中断
4. *sleep 调用void interrupt（） 会失效*
```java
try {Thread.sleep(500);} catch (InterruptedException e) {
// Thread.currentThread().interrupt();//???????  //线程的中断标志位为false,无法停下，需要再次掉interrupt()设置true
    e.printStackTrace();
}
``` 

### 线程等待唤醒
#### 三种让线程等待唤醒的方法
1. 使用object中的wait()和notify()
2. Condition 中的 await() 和 signal()
````java
    private Lock lock = new ReentrantLock(true); //默认用的是非公平锁，分配的平均一点，=--》公平一点
    Condition key = lock.newCondition();
        key.await();
        key.signal();
````
3.  LockSupport类中的LockSupport.park()、LockSupport.unpark();
    LockSupport类使用了一种名为Permit（许可）的概念来做到阻塞和唤醒线程的功能， 每个线程都有一个许可(permit)，
    permit只有两个值1和零，默认是零。
    可以把许可看成是一种(0,1)信号量（Semaphore），但与 Semaphore 不同的是，许可的累加上限是1。
    **其他2个方法必须先持有锁，然后先等待后唤醒，而LockSupport都不需要**

###java内存模型JMM
#### 三大特性
1. 可见性
2. 原子性
3. 有序性 （指令重排必须满足*数据依赖性*）

#### 多线程先行发生原则之happens-before
**（包含可见性和有序性的约束）**
一个操作**执行结果**对另一个操作可见 或者 指令重排 必须存在happens-before关系
1. 次序规则：一个线程内，写在前的先行发生于写在后面的操作；
2. 锁定规则：unLock先行发生lock（时间上）
3. volatile变量规则：写发生于读前，可见性保证（时间上）
4. 传递规则：A先于B,B先于C，-->A先C
   5.线程启动规则：Thread对象的start（）方法先行发生于线程的每一个动作
   6.线程中断规则：线程的interrupt（）先行发生于中断事件的检测Thread.interrupted()；
   7.线程终止规则：线程的所有操作都先发生于对此线程的终止检测？Thread：：join(),Thread::isAlive()的返回值等检测线程是否已经终止执行；
   8.对象终结规则：对象没有完成初始化前不能调用finallized()方法；

#### volatile
1. 内存语义： 写一个volatile变量，JMM会把该线程本地内存**立即刷新会主内存**；读一个volatile变量，JMM会把本地内存设置无效，直接从**主内存里读取共享变量**；
2. Java内存模型中定义的8种工作内存与主内存之间的原子操作
   {read(读取)→load(加载)→use(使用)} **时间间隔不保证原子性** →{assign(赋值)→store(存储)→write(写入)→lock(锁定)→unlock(解锁)}
3. volatile变量不适合参与到依赖当前值的运算，如i = i + 1; i++;
   通常volatile用做保存某个状态的boolean值or int值

##### volatile 使用场景
1. 单一赋值 volatile int a = 10; volatile boolean flag=false;
2. 状态标识，判断业务是否结束
   3.开销较低的读写锁策略
```java
        /**
         * 使用：当读远多于写，结合使用内部锁和 volatile 变量来减少同步的开销
         * 理由：利用volatile保证读取操作的可见性；利用synchronized保证复合操作的原子性
         */
 public class Counter {
     private volatile int value;

     public int getValue() {
         return value;   //利用volatile保证读取操作的可见性
     }

     public synchronized int increment() {
         return value++; //利用synchronized保证复合操作的原子性
     }
 }
```
4. **DCL双端锁的发布**
````java
    private static SafeDoubleCheckSingleton singleton;
    //私有化构造方法
    private ***volatile*** SafeDoubleCheckSingleton() {}
    //双重锁设计
    public static SafeDoubleCheckSingleton getInstance() {
        if (singleton == null) {
            //1.多线程并发创建对象时，会通过加锁保证只有一个线程能创建对象
            synchronized (SafeDoubleCheckSingleton.class) {
                if (singleton == null) {
                    //隐患：多线程环境下，由于重排序，该对象可能还未完成初始化就被其他线程读取
                    singleton = new SafeDoubleCheckSingleton();
                }
            }
        }
        //2.对象创建完毕，执行getInstance()将不需要获取锁，直接返回创建对象
        return singleton;
    }
//-------------------------------------------------------------------------------------------
//现在比较好的做法就是采用静态内部内的方式实现单例模式
public class SingletonDemo {
    private SingletonDemo() { }

    public static SingletonDemo getInstance() {
        return SingletonDemoHandler.instance;
    }

    private static class SingletonDemoHandler {
        private static SingletonDemo instance = new SingletonDemo();
    }
}
````

#### 内存屏障（内存栅栏，内存栅障，屏障指令）
1. 内存屏障之前的所有**写操作都要回写到主内存**，
2. 内存屏障之后的所有**读操作都能获得内存屏障之前的所有写操作的最新结果**(实现了可见性)。
   StoreLoad 禁止重排序&&**强制把写缓存区数据刷回主内存，让高速内存/工作内存的数据失效，重新读取主内存数据**
   **StoreStore-->volatile写-->StoreLoad**
   **volatile读-->LoadLoad-->LoadStore**
   *变量本来就被Volatile修饰怎么会有普通读写？？？？？？*--> 一个方法内2个变量操作

### CAS
```java
    volatile int number = 0;
    //读取
    public int getNumber() {return number;}
    //写入加锁保证原子性
    public synchronized void setNumber() {number++;}
//=================================

    AtomicInteger atomicInteger = new AtomicInteger();
    public int getAtomicInteger() {return atomicInteger.get();}
    public void setAtomicInteger() {atomicInteger.getAndIncrement();}
```
自旋锁（spinlock）

### 原子操作类
1. 基本类型原子类
    1. AtomicInteger
    2. AtomicBoolean
    3. AtomicLong
       常用方法：get() getAndSet() getAndDecrement() getAndAdd() compareAndSet()
```java
        MyNumber myNumber = new MyNumber();
        CountDownLatch countDownLatch = new CountDownLatch(SIEZ_);
        for (int i = 1; i <= SIEZ_; i++) {
            new Thread(() -> {
                try {
                    for (int j = 1; j <= 1000; j++) {
                        myNumber.addPlusPlus();
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    countDownLatch.countDown(); //todo try()catch()finally(countDownLatch.countDown())套路写法
                }
            }, String.valueOf(i)).start();
        }
     //try { TimeUnit.SECONDS.sleep(1); } catch (InterruptedException e) { e.printStackTrace(); } 
        countDownLatch.await(); //todo main 线程阻塞直到其他线程完成任务 或者睡一秒让其他线程完成任务
```
2. 数组类型原子类
    1. AtomicIntegerArray
    2. AtomicLongArray
    3. AtomicReferenceArray
3. 引用类型原子类
    1. AtomicReference
    2. AtomicStampedReference
    3. AtomicMarkableReference
4. 对象的属性修改原子类
    1. AtomicIntegerFieldUpdater
    2. AtomicLongFieldUpdater
    3. AtomicReferenceFieldUpdater
       **更新对象中的某些字段，更新的属性必须有public volatile 修饰符**
5. 原子操作增强类
    1. DoubleAccumulator
    2. DoubleAdder
    3. LongAccumulator
    4. LongAdder
#### LongAdder源码
![Longadder流程](../../../lei-warehouse2/lei-warehouse/lei-notebook/imgs/Longadder流程.png)
LongAdder extends Striped64
Striped64:
1. base
2. collide: 扩容意向 false一定不扩容 true可能扩容
3. cellsBusy :初始化cells或者扩容时需要获取锁，0无锁状态，1表示其他线程已经持有锁了
4. casCellsBusy():cas修改cellsBuys的值，cas成功表示获取锁，返回true
5. NCPU:
6. getProbe():获取当前线程的hash值
7. advanceProbe()：重置当前线程hash值
````java
Longadder:add()方法
    public void add(long x) {
        Striped64.Cell[] as;
        long b, v;
        int m;
        Striped64.Cell a;
        if ((as = cells) != null  || !casBase(b = base, b + x)) {//todo 1.操作cells数组不为null：null -->base原子更新不成功-->
            boolean uncontended = true;
            if (as == null || (m = as.length - 1) < 0 || (a = as[getProbe() & m]) == null || !(uncontended = a.cas(v = a.value, v + x))) {
            //todo as == null || (m = as.length - 1) < 0 判断是否初始化 ：已初始化--> hash一下看cell【x】是否初始化 ：不为null--> 没有就原子更新这个cell
                longAccumulate(x, null, uncontended);//todo 1.只有cell【】为null未初始化，2.hash到的某个cell元素未初始化，3.原子累加失败，进入这个方法
            }
        }
    }
````
Striped64:longAccumulate(x, null, uncontended)方法
```java
    final void longAccumulate(long x, LongBinaryOperator fn, boolean wasUncontended//初始 false) {
        int h;
        if ((h = getProbe()) == 0) {
            ThreadLocalRandom.current(); // force initialization 强制初始化
            h = getProbe();
            wasUncontended = true;
        }
        boolean collide = false;                // True if last slot nonempty 扩容意向 false一定不扩容 true可能扩容
        for (; ; ) {
            Cell[] as;
            Cell a;
            int n;
            long v;
            //todo 1.cells数组已经初始化的情况 ----- volatile Cell[] cells volatile变量，父类定义，直接用了  
            if ((as = cells) != null && (n = as.length) > 0) {
                if ((a = as[(n - 1) & h]) == null) { //1.cell元素a为null情况
                    if (cellsBusy == 0) {       // Try to attach new Cell
                        Cell r = new Cell(x);   // Optimistically create
                        if (cellsBusy == 0 && casCellsBusy()) {
                            boolean created = false;
                            try {               // Recheck under lock
                                Cell[] rs;
                                int m, j;
                                if ((rs = cells) != null && (m = rs.length) > 0 && rs[j = (m - 1) & h] == null) {
                                    rs[j] = r;
                                    created = true;
                                }
                            } finally {
                                cellsBusy = 0;
                            }
                            if (created) { break; }
                            continue;           // Slot is now non-empty
                        }
                    }
                    collide = false; //todo 该cells还是为null 只是没抢到锁，先不扩容
                }
                else if (!wasUncontended)       // CAS already known to fail
                {
                    wasUncontended = true;      // Continue after rehash
                }
                else if (a.cas(v = a.value, ((fn == null)// todo cells 不为null 试图累加
                                             ? v + x
                                             : fn.applyAsLong(v, x)))) { break; }
                else if (n >= NCPU || cells != as) {// todo cells !=as 啥意思？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
                    collide = false;            // At max size or stale
                }
                else if (!collide) { collide = true; }
                else if (cellsBusy == 0 && casCellsBusy()) {// todo 终于开始扩容了
                    try {
                        if (cells == as) {      //todo Expand table unless stale 扩容前都要判断下当前cells 和公用as是不是同一个，防止后进来线程再次修改
                            Cell[] rs = new Cell[n << 1];
                            for (int i = 0; i < n; ++i)
                                rs[i] = as[i];
                            cells = rs;
                        }
                    } finally {
                        cellsBusy = 0;
                    }
                    collide = false;
                    continue;                   // Retry with expanded table
                }
                h = advanceProbe(h);// todo 上面所有的判断都不走，这是重启hashcode重启人生
            }
            //todo 2.cells数组未始化的情况 ----- 看是否在锁定中，没有就试图加锁----初始化cells或者扩容时需要获取锁，cellsBusy，0无锁状态，1表示其他线程已经持有锁了
            else if (cellsBusy == 0 && cells == as && casCellsBusy()) {
                boolean init = false;
                try {                           // Initialize table
                    if (cells == as) {//todo 双重检查 上一个线程可能停在这里&& casCellsBusy()自旋，进来后不判断会再创建一个cell[]来初始化
                        Cell[] rs = new Cell[2];
                        rs[h & 1] = new Cell(x);
                        cells = rs;
                        init = true;
                    }
                } finally {
                    cellsBusy = 0;
                }
                if (init) { break; }//todo 初始化cell[]并给一个cell赋值x完成，跳出循环
            }
            else if (casBase(v = base, ((fn == null) //todo 兜底，第二步正在初始化，~~cas更新a这个不为null的cell失败?~~，就更新base 成功就跳出，失败就循环
                                        ? v + x
                                        : fn.applyAsLong(v, x)))) {
                break;                          // Fall back on using base
            }
        }
    }
```

### ThreadLocal
1. ThreadLocal实例通常是类中的私有静态字段
2. api: get(),initValue(),remove(),set(),withInital(Supplier<>)
3. ThreadLocalMap从字面上就可以看出这是一个保存ThreadLocal对象的map(其实是以它为Key)，不过是经过了两层包装的ThreadLocal对象：
   （1）第一层包装是使用 WeakReference<ThreadLocal<?>> 将ThreadLocal对象变成一个弱引用的对象；
   （2）第二层包装是定义了一个专门的类 Entry 来扩展 WeakReference<ThreadLocal<?>>：
#### 强、软、弱、虚 引用
1. 强引用是造成Java内存泄漏的主要原因之一，处于可达状态； Reference
2. 软引用 高速缓存就有用到软引用，内存够用的时候就保留，不够用就回收 SoftReference
3. 弱引用 GC一动就挂了，不管JVM内存 WeakReference
4. 虚引用 PhantomReference 需要引用队列保存 对象仅持有虚引用，那么它就和没有任何引用一样，在任何时候都可能被垃圾回收器回收，虚引用的主要作用是跟踪对象被垃圾回收的状态。
   仅仅是提供了一种确保对象被 finalize以后，做某些事情的机制。 PhantomReference的get方法总是返回null，因此无法访问对应的引用对象；**回收前做个通知**
5. ！[Threadlocal造成内存泄漏.png](../../../lei-warehouse2/lei-warehouse/lei-notebook/imgs/Threadlocal造成内存泄漏.png)

### java内存布局和对象头
1. 对象实例 对象头（Header）   实例数据（Instance Data）**-->按四字节对齐**   对齐填充（Padding）
2. 对象头-->Mark Word 对象标记 Class Pointer --> 类型指针 Klass pointer
3. Mark Word 的存储是非固定的数据结构，为了极小空间存存储更多的数据，动态信息，随着对象的状态进行变化
   ![jvm栈.png](../../../lei-warehouse2/lei-warehouse/lei-notebook/imgs/jvm栈.png)
   ![hot](../imgs/下载(6).jpg)
   |锁状态|25bit|31bit|1bit|4bit 分代年龄|1bit 偏向锁位|2bit 锁标志位|
   |-|-|-|-|-|-|-|
   |无锁|-|hashcode|-|分代年龄|0|0，1|
   |偏向锁|54bit 当前线程指针JavaThred*|Epoch|-|分代年龄|1|0，1|
   |轻量级锁，自旋锁，无锁?|62bit 指向线程栈中LockRecord指针|-|-|-|-|0，0|
   |重量级锁|62bit 指向互斥量（重量级锁）的指针|-|-|-|-|1，0|
   |GC标志信息|62bit CMS过程用到的标记信息|-|-|-|-|1，0|

### Synchronized与锁升级
1. java 1.5以前用户态和内核态的切换 synchronized属于重量级锁，效率低下，因为监视器锁（monitor）是依赖于底层的操作系统的Mutex Lock来实现的
   Java 1.6之后，为了减少获得锁和释放锁所带来的性能消耗，引入了轻量级锁和偏向锁
   Java对象是天生的Monitor，每一个Java对象都有成为Monitor的潜质，因为在Java的设计中 ，每一个Java对象自打娘胎里出来就带了一把看不见的锁，它叫做***内部锁或者Monitor锁***。
#### 偏向锁
锁总是被第一个占用他的线程拥有，这个线程就是锁的偏向线程。
偏向锁只有遇到其他线程尝试竞争偏向锁时，持有偏向锁的线程才会释放锁，线程是不会主动释放偏向锁的。
* 实际上偏向锁在JDK1.6之后是默认开启的，但是启动时间有延迟，
* 所以需要添加参数-XX:BiasedLockingStartupDelay=0，让其在程序启动时立刻启动。
* 开启偏向锁：
* -XX:+UseBiasedLocking -XX:BiasedLockingStartupDelay=0
* 关闭偏向锁：关闭之后程序默认会直接进入------------------------------------------>>>>>>>>   轻量级锁状态。
* -XX:-UseBiasedLocking
  ![px](../imgs/偏向锁.jpg)
1. 锁升级的整个流程
   ![px](../imgs/图像.png)
#### JIT
just in time compiler 即时编译器
锁消除
从JIT角度看相当于无视它，synchronized (o)不存在了,这个锁对象并没有被共用扩散到其它线程使用，
极端的说就是根本没有加这个锁对象的底层机器码，消除了锁的使用
```java
static Object objectLock = new Object();//正常的
    public void m1(){
        //锁消除,JIT会无视它，synchronized(对象锁)不存在了。不正常的
        Object o = new Object();
        synchronized (o)
        {
            System.out.println("-----hello LockClearUPDemo"+"\t"+o.hashCode()+"\t"+objectLock.hashCode());
        }
    }
```
锁粗化
假如方法中首尾相接，前后相邻的都是同一个锁对象，那JIT编译器就会把这几个synchronized块合并成一个大块，
加粗加大范围，一次申请锁使用即可，避免次次的申请和释放锁，提升了性能
````java
new Thread(() -> {
    synchronized (objectLock) {
        System.out.println("11111");
    }
    synchronized (objectLock) {
        System.out.println("22222");
    }
    synchronized (objectLock) {
        System.out.println("33333");
    }
}, "a").start();
````
#### ***AbstractQueuedSynchronizer之AQS***
1. 通过内置的FIFO队列完成资源获取的排队，并通过一个int类变量表示持有锁的状态
   CLH：Craig、Landin and Hagersten 队列，是一个单向链表，AQS中的队列是CLH变体的虚拟双向队列FIFO
   如果共享资源被占用，就需要一定的阻塞等待唤醒机制来保证锁分配。这个机制主要用的是CLH队列的变体实现的，将暂时获取不到锁的线程加入到队列中，这个队列就是AQS的抽象表现。它将请求共享资源的线程封装成队列的结点（Node），通过CAS、自旋以及LockSupport.park()的方式，维护state变量的状态，使并发达到同步的效果
2. 同步器和锁的关系
   1.锁面向的是使用者，同步器面向的是实现者

3. AQS：
   aqs使用一个volatile修饰的int成员变量表示同步状态，fifo队列完成资源获取排队，将线程封装成Node节点，cas完成对state修改；
4. node节点：
   ![node节点：](../imgs/下载(6)2.jpg)
5. ![](../imgs/aa.jpg)
   AQS内部维护一个同步队列，元素就是包装了线程的Node。
   同步队列中首节点是获取到锁的节点，它在释放锁的时会唤醒后继节点，后继节点获取到锁的时候，会把自己设为首节点。
   线程会先尝试获取锁，失败则封装成Node，CAS加入同步队列的尾部。在加入同步队列的尾部时，会判断前驱节点是否是head结点，并尝试加锁(可能前驱节点刚好释放锁)，否则线程进入阻塞等待。

### 读写锁、邮戳锁
读锁全完，写锁有望；写锁独占，读写全堵；
**读写锁容易出现锁饥饿，一直在读，抢不到写锁**
调用tryAcquire()
```java
        final boolean nonfairTryAcquire(int acquires) {
            final Thread current = Thread.currentThread();
            int c = getState();
            if (c == 0) {
                if (compareAndSetState(0, acquires)) {
                    setExclusiveOwnerThread(current);
                    return true;
                }
            }
            else if (current == getExclusiveOwnerThread()) {
                int nextc = c + acquires;
                if (nextc < 0) // overflow
                    throw new Error("Maximum lock count exceeded");
                setState(nextc);
                return true;
            }
            return false;
        }
```