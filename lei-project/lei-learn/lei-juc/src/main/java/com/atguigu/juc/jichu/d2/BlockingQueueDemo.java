package com.atguigu.juc.jichu.d2;

import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.TimeUnit;

/**
 * @author mqx
 * @date 2021-4-6 14:36:50
 */

public class BlockingQueueDemo {

    //  主入口
    public static void main(String[] args) throws InterruptedException {
        //  声明一个阻塞队列
        BlockingQueue<String> blockingQueue = new ArrayBlockingQueue<>(3);
        //  添加
//        blockingQueue.add("a");
//        blockingQueue.add("b");
//        blockingQueue.add("c");
        //  移除：System.out.println(blockingQueue.remove("c"));
        //        //  blockingQueue.add("d");
        //        System.out.println(blockingQueue.remove("b"));
        //        System.out.println(blockingQueue.remove("a"));
        //        System.out.println(blockingQueue.remove("f"));
        //
        //  System.out.println(blockingQueue.remove());
        System.out.println(blockingQueue.offer("a"));
        System.out.println(blockingQueue.offer("b"));
        System.out.println(blockingQueue.offer("c"));
        System.out.println(blockingQueue.offer("d", 3, TimeUnit.SECONDS));
//
        System.out.println(blockingQueue.poll());
        System.out.println(blockingQueue.poll());
        System.out.println(blockingQueue.poll());
        System.out.println(blockingQueue.poll(3, TimeUnit.SECONDS));

        blockingQueue.put("a");
        blockingQueue.put("b");
        blockingQueue.put("c");
        blockingQueue.take();  //  移除数据
        blockingQueue.take();  //  移除数据
        blockingQueue.take();  //  移除数据
        blockingQueue.add("f");
        blockingQueue.take();  //  移除数据

        // blockingQueue.put("d");    //  当队列是满的，从队列中添加元素的操作将会被阻塞

    }
}
