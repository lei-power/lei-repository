package com.atguigu.juc.jichu.d1;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/**
 * @author mqx
 * @date 2021-4-2 14:08:40
 */
/*
    demo: AA打印5次，BB打印10次，CC打印15次
        ......来10轮
    a.	线程操作资源类
    b.	判断，干活，通知
    实现思路：
    1、有顺序通知，需要有标识位
    2、有一个锁Lock，3把钥匙Condition
    3、判断标志位
    4、输出线程名+第几次+第几轮
    5、修改标志位，通知下一个
 */
class ShareResource {

    //  获取锁
    private final Lock lock = new ReentrantLock();
    //  需要有标识位
    private int flag = 1;   //  默认值为1
    //  3把钥匙Condition
    private Condition c1 = lock.newCondition();
    private Condition c2 = lock.newCondition();
    private Condition c3 = lock.newCondition();

    //  编写方法：打印5次
    public void print5(int totalLoopNumber) {
        lock.lock();
        try {
            //  判断
            while (flag != 1) {
                try {
                    c1.await();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            //  干活
            for (int i = 1; i <= 5; i++) {
                System.out.println(Thread.currentThread().getName() + "第" + i + "次" + "第" + totalLoopNumber + "轮");
            }
            //  通知
            flag = 2;
            c2.signal();
        }
        finally {
            lock.unlock();
        }
    }

    //  编写方法：打印10次
    public void print10(int totalLoopNumber) {
        lock.lock();
        try {
            //  判断
            while (flag != 2) {
                try {
                    c2.await();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            //  干活
            for (int i = 1; i <= 10; i++) {
                System.out.println(Thread.currentThread().getName() + "第" + i + "次" + "第" + totalLoopNumber + "轮");
            }
            //  通知
            flag = 3;
            c3.signal();
        }
        finally {
            lock.unlock();
        }
    }

    //  编写方法：打印5次
    public void print15(int totalLoopNumber) {
        lock.lock();
        try {
            //  判断
            while (flag != 3) {
                try {
                    c3.await();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            //  干活
            for (int i = 1; i <= 15; i++) {
                System.out.println(Thread.currentThread().getName() + "第" + i + "次" + "第" + totalLoopNumber + "轮");
            }
            //  通知
            flag = 1;
            c1.signal();
        }
        finally {
            lock.unlock();
        }
    }
}

public class ThreadOrderAccess {

    //  入口
    public static void main(String[] args) {
        //  创建资源类
        ShareResource shareResource = new ShareResource();
        //  创建线程：AA
        new Thread(() -> {
            for (int i = 1; i <= 10; i++) {
                shareResource.print5(i);
            }
        }, "AA").start();
        //  创建线程：BB
        new Thread(() -> {
            for (int i = 1; i <= 10; i++) {
                shareResource.print10(i);
            }
        }, "BB").start();
        //  创建线程：CC
        new Thread(() -> {
            for (int i = 1; i <= 10; i++) {
                shareResource.print15(i);
            }
        }, "CC").start();
    }
}
