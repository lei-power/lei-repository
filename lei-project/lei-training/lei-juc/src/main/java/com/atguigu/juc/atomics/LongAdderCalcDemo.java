package com.atguigu.juc.atomics;


import java.util.concurrent.CountDownLatch;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.LongAccumulator;
import java.util.concurrent.atomic.LongAdder;

class ClickNumber {

    int number = 0;
    AtomicInteger atomicInteger = new AtomicInteger();
    AtomicLong atomicLong = new AtomicLong();
    LongAdder longAdder = new LongAdder();
    LongAccumulator longAccumulator = new LongAccumulator((x, y) -> x + y, 0);

    public synchronized void add_Synchronized() {
        number++;
    }

    public void add_AtomicInteger() {
        atomicInteger.incrementAndGet();
    }

    public void add_AtomicLong() {
        atomicLong.incrementAndGet();
    }

    public void add_LongAdder() {
        longAdder.increment();
        //longAdder.sum();
    }

    public void add_LongAccumulator() {
        longAccumulator.accumulate(1);
    }

}


/**
 * @auther zzyy
 * @create 2021-03-19 16:08
 * <p>
 * 50个线程，每个线程100W次，总点赞数出来
 */
public class LongAdderCalcDemo {

    public static final int SIZE_THREAD = 50;
    public static final int _1W = 10000;

    public static void main(String[] args) throws InterruptedException {
        ClickNumber clickNumber = new ClickNumber();
        long startTime;
        long endTime;

        CountDownLatch countDownLatch1 = new CountDownLatch(SIZE_THREAD);
        CountDownLatch countDownLatch2 = new CountDownLatch(SIZE_THREAD);
        CountDownLatch countDownLatch3 = new CountDownLatch(SIZE_THREAD);
        CountDownLatch countDownLatch4 = new CountDownLatch(SIZE_THREAD);
        CountDownLatch countDownLatch5 = new CountDownLatch(SIZE_THREAD);
        //========================

        startTime = System.currentTimeMillis();
        for (int i = 1; i <= SIZE_THREAD; i++) {
            new Thread(() -> {
                try {
                    for (int j = 1; j <= 100 * _1W; j++) {
                        clickNumber.add_Synchronized();
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally {
                    countDownLatch1.countDown();
                }
            }, String.valueOf(i)).start();
        }
        countDownLatch1.await();
        endTime = System.currentTimeMillis();
        System.out.println(
                "----costTime: " + (endTime - startTime) + " 毫秒" + "\t add_Synchronized" + "\t" + clickNumber.number);

        startTime = System.currentTimeMillis();
        for (int i = 1; i <= SIZE_THREAD; i++) {
            new Thread(() -> {
                try {
                    for (int j = 1; j <= 100 * _1W; j++) {
                        clickNumber.add_AtomicInteger();
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally {
                    countDownLatch2.countDown();
                }
            }, String.valueOf(i)).start();
        }
        countDownLatch2.await();
        endTime = System.currentTimeMillis();
        System.out.println("----costTime: " + (endTime - startTime) + " 毫秒" + "\t add_AtomicInteger" + "\t"
                + clickNumber.atomicInteger.get());

        startTime = System.currentTimeMillis();
        for (int i = 1; i <= SIZE_THREAD; i++) {
            new Thread(() -> {
                try {
                    for (int j = 1; j <= 100 * _1W; j++) {
                        clickNumber.add_AtomicLong();
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally {
                    countDownLatch3.countDown();
                }
            }, String.valueOf(i)).start();
        }
        countDownLatch3.await();
        endTime = System.currentTimeMillis();
        System.out.println(
                "----costTime: " + (endTime - startTime) + " 毫秒" + "\t add_AtomicLong" + "\t" + clickNumber.atomicLong
                        .get());

        startTime = System.currentTimeMillis();
        for (int i = 1; i <= SIZE_THREAD; i++) {
            new Thread(() -> {
                try {
                    for (int j = 1; j <= 100 * _1W; j++) {
                        clickNumber.add_LongAdder();
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally {
                    countDownLatch4.countDown();
                }
            }, String.valueOf(i)).start();
        }
        countDownLatch4.await();
        endTime = System.currentTimeMillis();
        System.out.println(
                "----costTime: " + (endTime - startTime) + " 毫秒" + "\t add_LongAdder" + "\t" + clickNumber.longAdder
                        .longValue());

        startTime = System.currentTimeMillis();
        for (int i = 1; i <= SIZE_THREAD; i++) {
            new Thread(() -> {
                try {
                    for (int j = 1; j <= 100 * _1W; j++) {
                        clickNumber.add_LongAccumulator();
                    }
                }
                catch (Exception e) {
                    e.printStackTrace();
                }
                finally {
                    countDownLatch5.countDown();
                }
            }, String.valueOf(i)).start();
        }
        countDownLatch5.await();
        endTime = System.currentTimeMillis();
        System.out.println("----costTime: " + (endTime - startTime) + " 毫秒" + "\t add_LongAccumulator" + "\t"
                + clickNumber.longAccumulator.longValue());
    }
}
