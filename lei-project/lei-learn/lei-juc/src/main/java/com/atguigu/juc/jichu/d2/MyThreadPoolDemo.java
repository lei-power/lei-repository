package com.atguigu.juc.jichu.d2;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * @author mqx
 * @date 2021-4-6 15:31:23
 */
public class MyThreadPoolDemo {

    public static void main(String[] args) {

        //  银行3个窗口
//        ExecutorService threadPool  = Executors.newFixedThreadPool(3);

        //  ExecutorService threadPool  = Executors.newSingleThreadExecutor();

        ExecutorService threadPool = Executors.newCachedThreadPool();

//        for (int i = 1; i <= 10; i++) {
//            new Thread(()->{
//                System.out.println(Thread.currentThread().getName()+"\t 办理业务");
//            },String.valueOf(i)).start();
//        }

        //  十个顾客
        for (int i = 1; i <= 100; i++) {
            threadPool.execute(() -> {
                System.out.println(Thread.currentThread().getName() + "\t 办理业务");
            });
        }

    }
}
