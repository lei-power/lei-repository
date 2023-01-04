package com.atguigu.juc.jichu.d3;

import java.util.concurrent.Executor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

/***
 *@author wanglei
 *@Date 2022/5/26 11:14
 ***/

public class ThreadPoolTest {

    private static Executor threadPool =
        new ThreadPoolExecutor(5, 20, 1, TimeUnit.SECONDS, new LinkedBlockingQueue<>(), new ThreadPoolExecutor.DiscardOldestPolicy());

    public static void main(String[] args) {
        for (int i = 0; i < 10000000; i++) {
            int finalI = i;
            threadPool.execute(() -> {
                Long maxValue = Long.MAX_VALUE;
                System.err.println(maxValue);

            });
        }
    }

}
