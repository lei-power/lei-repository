package com.atguigu.juc.jichu.d3;

import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;

/**
 * @author mqx
 * @date 2021-4-7 16:10:29
 */
public class CompletableFutureDemo {

    //    public void sayHello(){
    //        int i = 1;
    //        Integer ii = 11;
    //    }
    //  主入口
    public static void main(String[] args) throws ExecutionException, InterruptedException {
        //  可以自己创建一个对象
        //  CompletableFuture completableFuture = new CompletableFuture();
        //  runAsync 异步没有返回值！
        CompletableFuture<Void> completableFuture = CompletableFuture.runAsync(() -> {
            System.out.println("hello CompletableFuture!");
        });
        completableFuture.get();
        //  获取商品的价格数据  supplyAsync 有返回值！
        CompletableFuture<Integer> integerCompletableFuture = CompletableFuture.supplyAsync(() -> {
            // 有返回值
            System.out.println(Thread.currentThread().getName() + "\t返回价格!");

            int i = 1 / 0;

            return 1024;
        }).whenComplete((t, u) -> { // t表示接收上一个返回的结果！ u : 表示是否有异常发生！
            System.out.println("whenComplete t:\t " + t);
            System.out.println("whenComplete u:\t " + u);
        }).exceptionally((f) -> { //  如果有异常则会走这个方法
            //  获取里面的信息
            System.out.println(f.getMessage());
            return 404;
        });

        System.out.println(integerCompletableFuture.get());
        //  BiConsumer void accept(T t, U u)

    }
}
