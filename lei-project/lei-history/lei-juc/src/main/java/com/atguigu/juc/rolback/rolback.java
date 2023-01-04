package com.atguigu.juc.rolback;

/***
 *@author wanglei
 *@Date 2022/5/31 17:20
 ***/

import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.FutureTask;
import java.util.stream.Collectors;

/**
 * 复写FutureTask,来获取任务中的callable
 *
 * @author fpp
 * @version 1.0
 * @date 2020/8/18 15:48
 */
class MyFutureTask<T> extends FutureTask<T> {

    public Callable<T> callable;

    public MyFutureTask(Callable<T> callable) {
        super(callable);
        this.callable = callable;
    }

    public MyFutureTask(Runnable runnable, T result) {
        super(runnable, result);
    }

    public Callable<T> getCallable() {
        return callable;
    }
}

class TaskManager {

    private List<MyFutureTask> taskList = new LinkedList<>();

    private boolean isSuccess = false;

    public TaskManager() {
    }

    public void addTask(Task task) {
        taskList.add(new MyFutureTask(task));
    }

    public void done() {
        CompletableFuture[] completableFutures =
            taskList.stream().map(task -> CompletableFuture.runAsync(task).whenCompleteAsync(this::done1)).collect(Collectors.toList())
                .toArray(new CompletableFuture[taskList.size()]);
        CompletableFuture.allOf(completableFutures).join();
    }

    private void done1(Void v, Throwable t) {
        if (!isSuccess) {
            isSuccess = true;
            try {
                for (MyFutureTask futureTask : taskList) {
                    futureTask.get();
                }
            } catch (Exception e) {
                System.out.println(e.getMessage());
                for (MyFutureTask futureTask : taskList) {
                    if (!futureTask.isCancelled()) {
                        futureTask.cancel(true);
                        Task task = (Task)futureTask.getCallable();
                        task.rollback();
                    }
                }
            }
        }
    }

}

class Test {
    public static void main(String[] args) throws InterruptedException {

        TaskManager transactionManager = new TaskManager();
        Task a = new Task() {
            @Override
            public Object call() throws InterruptedException {
                System.out.println("do1 start.......");
                Thread.sleep(2000);
                System.out.println("do1.......");
                Thread.sleep(2000);
                return null;
            }

            @Override
            public void rollback() {
                System.out.println("do1 rollback");
            }
        };

        Task c = new Task() {
            @Override
            public Object call() throws InterruptedException {
                System.out.println("doc start.......");
                Thread.sleep(5000);
                System.out.println("doc.......");
                Thread.sleep(1000);
                return null;
            }

            @Override
            public void rollback() {
                System.out.println("doc rollback");
            }
        };

        Task d = new Task() {
            @Override
            public Object call() throws InterruptedException {
                System.out.println("dod start.......");
                Thread.sleep(500);
                System.out.println("dod.......");
                Thread.sleep(1000);
                return null;
            }

            @Override
            public void rollback() {
                System.out.println("dod rollback");
            }
        };

        Task b = new Task() {
            @Override
            public Object call() throws InterruptedException {
                System.out.println("dob start.......");
                Thread.sleep(2000);
                int a = 1 / 0;
                System.out.println("dob.......");
                Thread.sleep(2000);
                return null;
            }

            @Override
            public void rollback() {
                System.out.println("dob rollback");
            }
        };

        transactionManager.addTask(a);
        transactionManager.addTask(b);
        transactionManager.addTask(c);
        transactionManager.addTask(d);
        transactionManager.done();
    }
}