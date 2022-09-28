package com.atguigu.juc.jichu.d2;

import java.util.concurrent.CountDownLatch;

/**
 * @author mqx
 * @date 2021-4-6 11:17:24
 */
public class CountDownLatchDemo {

    public static void main(String[] args) throws InterruptedException {
        CountDownLatch countDownLatch = new CountDownLatch(5);
        for (int i = 0; i < 5; i++) {
            new Thread(() -> {
                System.err.println(Thread.currentThread().getName() + "线程------执行结束");
                countDownLatch.countDown();
            }).start();
        }
        countDownLatch.await();
        System.err.println(Thread.currentThread().getName() + "线程------执行结束");
    }
}
