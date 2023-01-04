package com.atguigu.juc.jichu.d3;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.RecursiveTask;

/***
 *@author wanglei
 *@Date 2022/5/26 13:52
 ***/

public class ForkJoinTest {

    public static void main(String[] args) throws ExecutionException, InterruptedException {
        Recursive recursive = new Recursive(1, 100);
        ForkJoinPool forkJoinPool = new ForkJoinPool();
        ForkJoinTask<Integer> submit = forkJoinPool.submit(recursive);
        System.err.println(submit.get());
        forkJoinPool.shutdown();
    }

}

class Recursive extends RecursiveTask<Integer> {

    private static final int interval = 10;
    private int begin;
    private int end;
    private int result;

    public Recursive(int begin, int end) {
        this.begin = begin;
        this.end = end;
    }

    @Override
    protected Integer compute() {
        if (end - begin <= interval) {
            for (int i = begin; i <= end; i++) {
                result = result + i;
            }
        } else {
            int mid = (begin + end) / 2;
            Recursive forkjoin1 = new Recursive(begin, mid);
            Recursive forkjoin2 = new Recursive(mid + 1, end);
            forkjoin1.fork();
            forkjoin2.fork();
            result = forkjoin1.join() + forkjoin2.join();
        }
        return result;
    }
}
