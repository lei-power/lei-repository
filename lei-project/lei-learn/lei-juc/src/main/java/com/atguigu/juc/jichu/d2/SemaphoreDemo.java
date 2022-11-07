package com.atguigu.juc.jichu.d2;

import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

/**
 * @author mqx
 * @date 2021-4-6 11:42:22
 */
public class SemaphoreDemo {

    //  三个停车场，停6辆汽车！
    public static void main(String[] args) {
        Semaphore semaphore = new Semaphore(3, false);
        for (int i = 0; i < 100; i++) {
            new Thread(() -> {
                try {
                    semaphore.acquire();
                    System.err.println("鸿蒙老祖的蒲团人人做，今天轮到我" + Thread.currentThread().getName());
                    TimeUnit.MILLISECONDS.sleep(10);
                    System.err.println("不好坐啊，溜了" + Thread.currentThread().getName());
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
                finally {

                    semaphore.release();
                }
            }).start();
        }
    }
}
