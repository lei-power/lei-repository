package com.atguigu.juc.jichu.d3;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/**
 * @author mqx
 * @date 2021-4-7 09:19:11
 */
public class MyThreadPoolDemo {

    public static void main(String[] args) {
        //  可以自定义线程池
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

        //  银行处理业务 ： 10个顾客来办理业务！
        //  暂时处理6个顾客
        try {
            for (int i = 1; i <= 10; i++) {
                threadPoolExecutor.execute(() -> {
                    System.out.println(Thread.currentThread().getName() + "\t 处理业务");
                });
            }
        }
        finally {
            threadPoolExecutor.shutdown();
        }


    }
}
