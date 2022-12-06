---
layout:  post
title:   CompletableFuture 多线程下操作数据库的事务问题
date:   1-12-08 12:28:12 发布
author:  'zhangtao'
header-img: 'img/post-bg-2015.jpg'
catalog:   false
tags:
-database
-java

---

数据库事务是与线程绑定的, 故而在多线程操作数据库下, 事务难免会失效, 所以在某些特定业务或效率的需求下, 必须在多线程操作数据库时, 开启与数据库等量的隔离事务,
继而解决事务问题.&nbsp;

思维逻辑: 每一个线程开启一个事务, 每一个线程在执行后开启事务, 然后在数据库io后悬停线程,等待其他线程全部执行完, 若任一一个线程存在异常(has a),
则需要调度全部线程进行事务回滚.否则则提交全部线程的事务.&nbsp;

技术: 并没有用到Object的wait和notify等方法调度, 而是用到了LockSupport的park和unpark来实现调度.

```java

@Service
@Slf4j
public class TestTxService {

    @Resource
    private MockMapper mockMapper;

    /**
     * 装配mybatis-springboot 的事务管理器,
     * 也可以替代成springboot-jdbc开启,
     * 也可以替代成sqlsessionfactorybean开启
     */
    @Resource
    private DataSourceTransactionManager txManager;

    /**
     * 测试多线程下的事务回滚
     */
    public void testTx() {
        // 定义开启的线程数
        AtomicInteger totalThreadCount = new AtomicInteger(3);
        // 事务定义
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        // 每次都开启一个新事务
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRES_NEW);
        // 所有开启事务的线程中, 是否存在异常
        AtomicBoolean isException = new AtomicBoolean(Boolean.FALSE);
        // 模拟多线程访问
        List<CompletableFuture<Void>> list = new ArrayList<>();
        // 定义没有执行结束的线程集合
        List<Thread> unFinishedThread = Collections.synchronizedList(new ArrayList<>());
        IntStream.range(0, totalThreadCount.get()).forEach(value -> list.add(CompletableFuture.runAsync(() -> {
            // 获得事务状态
            TransactionStatus status = txManager.getTransaction(def);
            try {
                // 业务
                this.mockMapper.insertTest(new Date());
                if (value == 1) {
                    // 模拟插入数据库时或者, 其他业务逻辑时抛出的异常
                    // throw new RuntimeException("手动异常");
                }
                // 添加到没有执行结束的线程集合
                unFinishedThread.add(Thread.currentThread());
                // 每个线程都在悬停前开启唤醒检查
                log.info("即将开启调用:{},{}", unFinishedThread.size(), totalThreadCount.get());
                this.notifyAllThread(unFinishedThread, totalThreadCount, false);
                log.info("即将悬停线程{}", Thread.currentThread());
                LockSupport.park();
                // 根据结果, 令设定各个线程的行为
                if (isException.get()) {
                    txManager.rollback(status);
                } else {
                    txManager.commit(status);
                }
            } catch (Exception e) {
                e.printStackTrace();
                // 本线程回滚
                txManager.rollback(status);
                // 设定线程中存在异常信息
                isException.set(Boolean.TRUE);
                this.notifyAllThread(unFinishedThread, totalThreadCount, true);
            }
        })));
        CompletableFuture<Void> result = CompletableFuture.allOf(list.toArray(new CompletableFuture[0]));
        try {
            // 调用Future的阻塞接口, 等待全部future实例异步执行结束
            result.get();
        } catch (Exception e) {
            throw new RuntimeException("子线程中抛出异常");
        }
    }

    /**
     * 唤醒全部悬停的线程
     *
     * @param unFinishedThread 手动悬停的线程
     * @param totalThreadCount 全部开启的线程数
     * @param isForce          是否强行操作集合中全部线程
     */
    private void notifyAllThread(List<Thread> unFinishedThread, AtomicInteger totalThreadCount, boolean isForce) {
        // 当手动悬停的线程与开启的线程数相同时, 证明全部线程都已经开启并手动悬停, 故而可以唤醒全部手动悬停的线程, 并处理提交与回滚逻辑
        if (isForce || unFinishedThread.size() == totalThreadCount.get()) {
            for (Thread thread : unFinishedThread) {
                log.info("唤醒线程{}", thread);
                LockSupport.unpark(thread);
            }
        }
    }
}
```

