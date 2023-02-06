---
layout:  post
title:   项目开发之Spring多线程事务如何一起提交一起回滚(附代码)，并发处理批量数据，实现多线程事务回滚，事务补偿
date:   0-11-16 18:58:15 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-多线程

---

**目录**

[前言](#%E5%89%8D%E8%A8%80)

[基于CountDownLatch](#%E5%9F%BA%E4%BA%8ECountDownLatch)

[基于回调函数](#%E5%9F%BA%E4%BA%8E%E5%9B%9E%E8%B0%83%E5%87%BD%E6%95%B0)

[基于spring上下文中获取事务管理器](#%E5%9F%BA%E4%BA%8Espring%E4%B8%8A%E4%B8%8B%E6%96%87%E4%B8%AD%E8%8E%B7%E5%8F%96%E4%BA%8B%E5%8A%A1%E7%AE%A1%E7%90%86%E5%99%A8)

[封装的工具类](#%E5%B0%81%E8%A3%85%E7%9A%84%E5%B7%A5%E5%85%B7%E7%B1%BB)

[使用的核心代码](#%E4%BD%BF%E7%94%A8%E7%9A%84%E6%A0%B8%E5%BF%83%E4%BB%A3%E7%A0%81)

[测试代码](#%E6%B5%8B%E8%AF%95%E4%BB%A3%E7%A0%81)

[结果](#%E7%BB%93%E6%9E%9C%EF%BC%9A)

[测试成功的情况](#%E6%B5%8B%E8%AF%95%E6%88%90%E5%8A%9F%E7%9A%84%E6%83%85%E5%86%B5)

### 前言

利用线程池和CountDownLatch,多线程并发处理批量数据，实现多线程事务回滚，事务补偿。

多线程事务封装的工具类必须是通过**new关键字** 获取实例，不应该是单例模式(维护成bean,自动注入的方式)。如果是单例模式，在多线程并发下获取多线程事务封装类的情况下，实例变成了共享资源，存在线程不安全。

因此必须通过new 关键字获取实例。否则多个请求下，事务之间也会存在影响。

**PS:测试已通过，若拆分后的部分数据操作抛错，则全部数据回滚，即多线程事务回滚，检查数据库无数据插入。**

###  

### 基于CountDownLatch

```java
//定义两计数器
private CountDownLatch begin,end;
```

begin设置为1，用于发布开始命令，如果需要开始，则begin.countdown

end用于记录任务的执行情况。begin.countdown后，需end.await，等待任务都执行完。

当begin.countdown开始执行任务后，在最后需end.countdown

当end.countdown减到为0后，则切换到主线程，继续开始往下执行

&nbsp;

### 基于回调函数

实现更灵活的去配置各业务数据操作场景,即：暴露excute方法执行线程任务，执行的具体执行任务交给回调函数实现。

&nbsp;

### 基于spring上下文中获取事务管理器

封装获取spring上下文工具类

```java
ApplicationContextProvider
```

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Component;

/**
 * @Author by mocar小师兄
 * @DESC: 从已有的spring上下文取得已实例化的bean
 */
@Component
public class ApplicationContextProvider implements ApplicationContextAware {

    private static final Logger log = LoggerFactory.getLogger(ApplicationContextProvider.class);

    private static ApplicationContext applicationContext;

    /**
     * 设置spring上下文
     * @param applicationContext spring上下文
     * @throws BeansException
     */
    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        log.info("spring上下文applicationContext正在初始化,application:{}", applicationContext);
        ApplicationContextProvider.applicationContext = applicationContext;
        log.info("spring上下文applicationContext初始化完成!");
    }

    public static ApplicationContext getApplicationContext() {
        return applicationContext;

    }

    public static Object getBean(String name) {
        if (applicationContext == null) {
            log.warn("applicationContext是空的");
            return null;
        }
        return getApplicationContext().getBean(name);

    }

    public static <T> T getBean(Class<T> clazz) {
        return getApplicationContext().getBean(clazz);

    }


}
```

&nbsp;

### 封装的工具类

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.util.CollectionUtils;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.atomic.AtomicReference;

/**
 * @Description
 * @Author by mocar小师兄
 * @Date 2020/11/16 12:29
 **/
//@Component 不能交给spring管理
public class TransactionMultipartExecutor<T> {

    private static final Logger log = LoggerFactory.getLogger(TransactionMultipartExecutor.class);

    /**
     * 单个线程处理的数据量
     */
    private int singleCount;

    /**
     * 处理的总数据量
     */
    private int listSize;

    /**
     * 开启的线程数
     */
    private int runSize;

    /**
     * 操作的数据集
     */
    private List<T> list;

    /**
     * 计数器(拦截器)
     */
    private CountDownLatch begin, end;

    /**
     * 线程池
     */
    private ExecutorService executorService;

    /**
     * 是否存在异常
     */
    private AtomicReference<Boolean> isError = new AtomicReference<>(false);

    /**
     * 回调函数
     */
    private CallBack callBack;

    /**
     * 概率模拟报错
     */
    private Random random = new Random();

    /**
     * 事务管理器
     */
    private PlatformTransactionManager transactionManager;


    public void setCallBack(CallBack callBack) {
        this.callBack = callBack;
    }

    public TransactionMultipartExecutor(int singleCount, List<T> list) {
        if (singleCount <= 0 || CollectionUtils.isEmpty(list)) {
            throw new RuntimeException("Illegal parameter");
        }
        //transactionManager = ContextLoader.getCurrentWebApplicationContext().getBean(PlatformTransactionManager.class);
        transactionManager = ApplicationContextProvider.getBean(PlatformTransactionManager.class);
        this.singleCount = singleCount;
        this.list = list;
        this.listSize = list.size();
        this.runSize = (this.listSize % this.singleCount) == 0 ? this.listSize / this.singleCount : this.listSize / this.singleCount + 1;
    }

    public void excute() throws InterruptedException {
        // 创建固定线程数量的线程池
        executorService = Executors.newFixedThreadPool(runSize);
        begin = new CountDownLatch(1);
        end = new CountDownLatch(runSize);
        //创建线程
        int startIndex = 0;
        int endIndex = 0;
        List<T> newList = null;
        for (int i = 0; i < runSize; i++) {
            //计算每个线程对应的数据
            if (i < (runSize - 1)) {
                startIndex = i * singleCount;
                endIndex = (i + 1) * singleCount;
                newList = list.subList(startIndex, endIndex);
            } else {
                startIndex = i * singleCount;
                endIndex = listSize;
                newList = list.subList(startIndex, endIndex);
            }
            //创建线程类处理数据
            MyThread<T> myThread = new MyThread(newList, begin, end) {
                @Override
                public void method(List list) {
                    DefaultTransactionDefinition def = new DefaultTransactionDefinition();
                    def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
                    TransactionStatus status = transactionManager.getTransaction(def);
                    //具体执行逻辑交给回调函数
                    try {
                        callBack.method(list);
                        /*if (random.nextInt(2) == 1) {
                            throw new RuntimeException("模拟异常抛出错误回滚");
                        }*/
                        log.warn("多线程事务批量操作执行成功,线程名:{},操作成功数量:{}", Thread.currentThread().getName(), list.size());
                    } catch (Exception e) {
                        // 接收异常,处理异常
                        isError.set(true);
                        //e.printStackTrace();
                        log.error("多线程事务批量操作抛错,线程名:{},操作失败数量:{},报错信息:{},{}", Thread.currentThread().getName(), list.size(), e.toString(), e);
                    }
                    //计数器减一
                    end.countDown();
                    try {
                        //等待所有线程任务完成，监控是否有异常，有则统一回滚
                        //log.warn("等待所有任务执行完成,当前时间:{},当前end计数:{}", LocalDateTime.now(), end.getCount());
                        end.await();
                        //log.warn("完成所有任务,当前时间:{},当前end计数:{}", LocalDateTime.now(), end.getCount());
                        if (isError.get()) {
                            // 事务回滚
                            transactionManager.rollback(status);
                        } else {
                            //事务提交
                            transactionManager.commit(status);
                        }
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            };
            //执行线程
            executorService.execute(myThread);
        }
        //计数器减一，开始执行任务  begin此时为0
        begin.countDown();//
        //等待任务全部执行完毕，变为0则任务全部完成
        end.await();
        //关闭线程池
        executorService.shutdown();
        //不抛错也是可以回滚的
        /*if (isError.get()) {
            // 主线程抛出自定义的异常
            throw new RuntimeException("主线程抛出模拟异常");
        }*/
    }

    //抽象线程类
    public abstract class MyThread<T> implements Runnable {

        //list:总数据分割后某线程负责执行的数据
        private List<T> list;
        private CountDownLatch begin, end;

        public MyThread(List<T> list, CountDownLatch begin, CountDownLatch end) {
            this.list = list;
            this.begin = begin;
            this.end = end;
        }

        @Override
        public void run() {
            try {
                begin.await();
                //执行程序
                method(list);
            } catch (InterruptedException e) {
                e.printStackTrace();
            } finally {
                //计数器减一
                //end.countDown();
            }
        }

        public abstract void method(List<T> list);
    }

    //回调接口定义
    public interface CallBack<T> {

        void method(List<T> list);
    }


    public static void main(String[] agrs) {
        List<String> list = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            list.add("hello" + i);
        }
        TransactionMultipartExecutor<String> tool = new TransactionMultipartExecutor(3, list);
        tool.setCallBack(new CallBack<String>() {
            @Override
            public void method(List<String> list) {
                //总数据分割后某线程负责执行的数据
                for (int i = 0; i < list.size(); i++) {
                    System.out.print(Thread.currentThread().getId() + ":" + list.get(i) + " ");
                }
                System.out.println();
            }
        });
        try {
            tool.excute();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }


}
```

&nbsp;

### 使用的核心代码

```java
TransactionMultipartExecutor<Plant> executor=new TransactionMultipartExecutor<>(2,plants);
        executor.setCallBack(new TransactionMultipartExecutor.CallBack<Plant>(){
@Override public void method(List<Plant> list){
        plantService.insertPlantBatch(list);
        }

        });
        try{
        executor.excute();
        }catch(Exception e){
        e.printStackTrace();
        }
```

&nbsp;

### 测试代码

```java
@Test public void testTransactionExecutorRollback(){
        //监控耗时
        StopWatch sw=new StopWatch();
        sw.start();
        List<Plant> plants=new ArrayList<>();
        for(int i=0;i< 5;i++){
        Plant plant=getTestData("mocar00"+i);
        plants.add(plant);
        }
        TransactionMultipartExecutor<Plant> executor=new TransactionMultipartExecutor<>(2,plants);
        executor.setCallBack(new TransactionMultipartExecutor.CallBack<Plant>(){
@Override public void method(List<Plant> list){
        plantService.insertPlantBatch(list);
        }

        });
        try{
        executor.excute();
        }catch(Exception e){
        e.printStackTrace();
        }
        System.out.println("总耗时:"+sw.getTime()+" 毫秒");
        }

private Plant getTestData(String plantId){
        Plant plant=new Plant();
        plant.setId(SnowFlakeGenerateIDUtils.getSnowId());
        plant.setPlantId(plantId);
        plant.setPlantName(plantId);
        plant.setPlantType(new Byte("2"));
        plant.setCompanyId(plantId);
        plant.setCompanyName(plantId);
        plant.setStatus(GlobalStatusEnum.ENABLE.getValue());
        plant.setIsDeleted(GlobalDeleteStatusEnum.NOT_DELETE.getValue());
        plant.setCreateUser("mocar");
        plant.setModifyUser("mocar");
        return plant;
        }
```

###  

### 结果：

![img](https://img-blog.csdnimg.cn/2020111817392456.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1NldmVuNzExMTE=,size_16,color_FFFFFF,t_70)

查看数据库数据，成功回滚。

&nbsp;

### 测试成功的情况

![img](https://img-blog.csdnimg.cn/20201118174412172.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L1NldmVuNzExMTE=,size_16,color_FFFFFF,t_70)

查看数据库数据，全部成功写入。

&nbsp;

&nbsp;

&nbsp;

