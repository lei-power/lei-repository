package com.atguigu.juc.jichu.d1;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author mqx
 * @date 2021-4-2 11:16:54
 */
//  一个线程对一个数+1 ，一个线程对一个数-1
//  上：线程操作资源类，中： 判断，干活，通知  定义一个资源类
//  线程间的通信方法有哪些？
class ShareDataOne { //资源类

    //  获取lock对象
    final Lock lock = new ReentrantLock();
    //  获取钥匙
    final Condition condition = lock.newCondition();

    //  资源
    private int num = 1;

    //  编写加方法
    public void increment() throws InterruptedException {
        lock.lock();
        try {
            //  判断
            while (num != 0) {
                //  不需要做加法
                //  C,A
                //  this.wait();
                condition.await();
            }
            //  干活
            num++;
            System.out.println(Thread.currentThread().getName() + "\t" + num);
            //  通知
            //  this.notifyAll();
            condition.signalAll();
        }
        finally {
            lock.unlock();
        }
    }

    //  编写减方法 当num == 0，等待，num！=0 减
    public void decrement() throws InterruptedException {
        lock.lock();
        try {
            //  判断
            while (num == 0) {
                //  不需要做加法
                //  this.wait();
                condition.await();
            }
            //  干活
            num--;
            System.out.println(Thread.currentThread().getName() + "\t" + num);
            //  通知
            //  this.notifyAll();
            condition.signalAll();
        }
        finally {
            lock.unlock();
        }
    }

}

public class NotifyWaitDemo {

    public static void main(String[] args) {
        //  创建资源类
        ShareDataOne shareDataOne = new ShareDataOne();
        //  编写一个线程！ 执行加
        new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    shareDataOne.increment();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }, "A").start();
        //  编写一个线程！执行减
        new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    shareDataOne.decrement();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }, "B").start();
        //  编写一个线程！ 执行加
        new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    shareDataOne.increment();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }, "C").start();
        //  编写一个线程！执行减
        new Thread(() -> {
            for (int i = 0; i < 5; i++) {
                try {
                    shareDataOne.decrement();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }, "D").start();
    }
}
