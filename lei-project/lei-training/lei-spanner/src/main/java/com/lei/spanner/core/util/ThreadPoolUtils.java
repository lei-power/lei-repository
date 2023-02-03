package com.lei.spanner.core.util;

import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/**
 * @author wangkai
 * @date 2021/7/21 16:29
 */
public class ThreadPoolUtils {

    private static int corePoolSize = 200;

    private static int taskPoolSize = 20;

    private static int maxPoolSize = 2000;

    private static long keepAliveTime = 1;

    private static TimeUnit timeUnit = TimeUnit.MINUTES;

    private static BlockingQueue<Runnable> queue = new SynchronousQueue<>();

    private static ExecutorService executorService;

    private static ScheduledExecutorService scheduledExecutorService;

    private static ThreadPoolTaskScheduler threadPoolTaskScheduler;

    private ThreadPoolUtils() {
        throw new IllegalStateException("Utility class");
    }

    public static ExecutorService getThread() {
        if (executorService == null) {
            executorService = new ThreadPoolExecutor(corePoolSize, maxPoolSize, keepAliveTime, timeUnit, queue);
        }
        return executorService;
    }

    public static ScheduledExecutorService getSchedule() {
        if (scheduledExecutorService == null) {
            scheduledExecutorService = new ScheduledThreadPoolExecutor(corePoolSize);
        }
        return scheduledExecutorService;
    }

    public static ThreadPoolTaskScheduler getTaskSchedule() {
        if (threadPoolTaskScheduler == null) {
            threadPoolTaskScheduler = new ThreadPoolTaskScheduler();
            threadPoolTaskScheduler.setPoolSize(taskPoolSize);
            threadPoolTaskScheduler.initialize();
        }
        return threadPoolTaskScheduler;
    }

}
