package com.atguigu.juc.locks;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

/***
 *@author wanglei
 *@Date 2022/5/25 14:19
 ***/


class ShareResource {

    private int number = 1;//1:A 2:B 3:C
    private Lock lock = new ReentrantLock();
    private Condition c1 = lock.newCondition();
    private Condition c2 = lock.newCondition();
    private Condition c3 = lock.newCondition();

    public void print5(int totalLoopNumber) {

        lock.lock();
        try {
            //1 判断
            while (number != 1) {
                //A 就要停止
                c1.await();
            }
            //2 干活
            for (int i = 1; i <= 5; i++) {
                System.out.println(Thread.currentThread().getName() + "\t" + i + "\t totalLoopNumber: " + totalLoopNumber);
            }
            //3 通知
            number = 2;
            c2.signal();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            lock.unlock();
        }

    }

    public void print10(int totalLoopNumber) {
        lock.lock();
        try {
            //1 判断
            while (number != 2) {
                //A 就要停止
                c2.await();
            }
            //2 干活
            for (int i = 1; i <= 10; i++) {
                System.out.println(Thread.currentThread().getName() + "\t" + i + "\t totalLoopNumber: " + totalLoopNumber);
            }
            //3 通知
            number = 3;
            c3.signal();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            lock.unlock();
        }

    }


    public void print15(int totalLoopNumber) {
        lock.lock();

        try {
            //1 判断
            while (number != 3) {
                //A 就要停止
                c3.await();
            }

            //2 干活
            for (int i = 1; i <= 15; i++) {
                System.out.println(Thread.currentThread().getName() + "\t" + i + "\t totalLoopNumber: " + totalLoopNumber);
            }
            //3 通知
            number = 1;
            c1.signal();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            lock.unlock();
        }

    }

}


/**
 * @Description: 多线程之间按顺序调用，实现A->B->C
 * <p>
 * 三个线程启动，要求如下：
 * <p>
 * <p>
 * <p>
 * AA打印5次，BB打印10次，CC打印15次
 * <p>
 * 接着
 * <p>
 * AA打印5次，BB打印10次，CC打印15次
 * <p>
 * ......来10轮
 */

class ThreadOrderAccess {

    public static void main(String[] args) {

        ShareResource sr = new ShareResource();

        new Thread(() -> {
            for (int i = 1; i <= 10; i++) {
                sr.print5(i);
            }
        }, "AA").start();

        new Thread(() -> {
            for (int i = 1; i <= 10; i++) {
                sr.print10(i);
            }
        }, "BB").start();

        new Thread(() -> {
            for (int i = 1; i <= 10; i++) {
                sr.print15(i);
            }
        }, "CC").start();
    }
}