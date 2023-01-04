package com.atguigu.juc.jichu.d1;

import java.util.concurrent.locks.ReentrantLock;

/**
 * @author mqx
 * @date 2021-4-2 09:33:52
 */
class Th extends Thread {

    @Override
    public void run() {
        //  要执行的方法体
    }
}

class Th1 implements Runnable {

    @Override
    public void run() {
        //  要执行的方法体
    }
}

//  1、线程 操作 资源类
class SaleTicket {

    /*
         class X {
       private final ReentrantLock lock = new ReentrantLock();
       // ...

       public void m() {
         lock.lock();  // block until condition holds
         try {
           // ... method body
         } finally {
           lock.unlock()
         }
       }
     }
     */
    private final ReentrantLock lock = new ReentrantLock();
    //  声明一些票数
    private int number = 300;

    //  编写一个卖票的方法
    //    public synchronized void saleTicket(){    同步方法
    public void saleTicket() {
        //  判断当前是否可以卖出票
        //        synchronized (this){    //  同步代码块！
        //            if (number>0){
        //                System.out.println(Thread.currentThread().getName()+"卖出："+(number--)+"还剩下："+number);
        //            }
        //        }
        lock.lock();
        try {
            if (number > 0) {
                System.out.println(Thread.currentThread().getName() + "卖出：" + (number--) + "还剩下：" + number);
            }
        }
        finally {
            lock.unlock();
        }
    }
}

public class TestSaleTicket {

    //  主方法
    public static void main(String[] args) {
        //  Thread
        //        Th th = new Th();
        //        th.start();
        //  Thread()
        Th1 th1 = new Th1();

        //  Thread(Runnable target)
        Thread thread = new Thread(th1);
        //  run() 直接运行线程的主体！start();启动线程
        thread.start();

        //  线程 操作 资源类
        SaleTicket saleTicket = new SaleTicket();

        //  创建线程
        //  Thread thread = new Thread();
        //  拉姆达表达式
        //  Runnable runnable = new Runnable();
        //  复制小括号，写死右箭头，落地大括号
        //        new Runnable(()->{
        //            saleTicket.saleTicket();
        //        });
        //  Thread 这个才叫线程！
        new Thread(() -> {
            try {
                Thread.sleep(300);
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
            for (int i = 0; i < 200; i++) {
                saleTicket.saleTicket();
            }

        }, "AA").start();

        //  Thread(Runnable target, String name)
        new Thread(() -> {
            try {
                Thread.sleep(300);
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
            for (int i = 0; i < 200; i++) {
                saleTicket.saleTicket();
            }
        }, "BB").start();

        new Thread(() -> {
            try {
                Thread.sleep(300);
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
            for (int i = 0; i < 200; i++) {
                saleTicket.saleTicket();
            }
        }, "CC").start();
    }
}
