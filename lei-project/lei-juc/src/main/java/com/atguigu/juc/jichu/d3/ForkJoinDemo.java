package com.atguigu.juc.jichu.d3;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.ForkJoinPool;
import java.util.concurrent.ForkJoinTask;
import java.util.concurrent.RecursiveTask;

/**
 * @author mqx
 * @date 2021-4-7 15:18:44
 */

//  计算0，100 的总和=5050
class MyTask extends RecursiveTask<Integer> {

    //  声明一些变量：
    //  以10为界限区分！
    private static final Integer ADJUST_VALUE = 10;
    private int beign;
    private int end;
    private int result;

    //  创建一个构造方法
    public MyTask(int beign, int end) {
        this.beign = beign;
        this.end = end;
    }

    //  递归调用
    @Override
    protected Integer compute() {
        //  编写业务逻辑  2,8 相差 6
        if ((end - beign) <= ADJUST_VALUE) {
            for (int i = beign; i <= end; i++) {
                result = result + i;
            }
        }
        else {
            //  0，100  相差100 找个中间值  100/2 = 50;  0,50 加法 51，100;
            int mid = (beign + end) / 2;
            MyTask myTask01 = new MyTask(beign, mid);
            MyTask myTask02 = new MyTask(mid + 1, end);
            //  计算
            myTask01.fork();
            myTask02.fork();

            //  最终计算结果：
            result = myTask01.join() + myTask02.join();
        }

        //  返回数据
        return result;
    }
}


public class ForkJoinDemo {

    //  主入口
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        //  线程操作资源类
        MyTask myTask = new MyTask(0, 100);
        //  分支合并池！
        ForkJoinPool forkJoinPool = new ForkJoinPool();
        //  需要将ForkJoinTask 扔进去
        ForkJoinTask<Integer> forkJoinTask = forkJoinPool.submit(myTask);
        //  获取计算结果
        System.out.println(forkJoinTask.get());
        //  关闭分支合并池
        forkJoinPool.shutdown();

    }
}
