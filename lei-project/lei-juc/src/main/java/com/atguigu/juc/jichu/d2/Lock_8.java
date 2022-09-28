package com.atguigu.juc.jichu.d2;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;

/**
 * @author mqx
 * @date 2021-4-6 09:15:51
 */
//  资源类： 线程操作资源类    判断，干活，通知
//  线程Thread01
class Thread01 implements Runnable {

    @Override
    public void run() {

    }
}

//  线程Thread02
class Thread02 implements Callable {

    @Override
    public Object call() throws Exception {
        return null;
    }
}

class Phone {

    //  发送短信
    public static synchronized void SendSMS() throws InterruptedException {
        //  Thread.sleep(4000);
        System.out.println("发送短信-----");
    }

    //  发送邮件
    public synchronized void sendEmail() {
        System.out.println("发送邮件-----");
    }

    //  普通方法
    public void getHello() {
        System.out.println(" hello ");
    }

}
/*
 1 标准访问，先打印短信还是邮件
    先短信： 跟main 方法中写代码的顺序有关系！
 2 停4秒在短信方法内，先打印短信还是邮件
    先短信：
    两个同步方法：使用的是同一把锁！
 3 新增普通的hello方法，是先打短信还是hello
    先打印hello方法。

 4 现在有两部手机，先打印短信还是邮件
    Phone phone = new Phone();
    Phone phone2 = new Phone();
    第一个对象调用短信方法
    第二个对象调用邮件方法
    结果：先打印邮件，后打印短信！ 则说明两个同步方法使用的不是同一把锁！ {结合案例2得出结论}
    这个锁应该指的是谁！
    phone.sendSMS(); {锁对象 是谁 this phone}
    phone2.sendEmail(); {锁对象 是谁 this phone2}

 5 两个静态同步方法，1部手机，先打印短信还是邮件
    先打印短信：
    后打印邮件：

 6 两个静态同步方法，2部手机，先打印短信还是邮件
    先打印短信：
    后打印邮件：
    结合案例4：{案例4：先打印邮件，因为是非静态的同步方法！ 案例4得出的结论，使用的不是同一把锁！  本案例静态的同步方法！}

    结论：这两个静态同步方法使用的是同一把锁！ 这个锁是谁呢？ Phone.class

 7 1个静态同步方法,1个普通同步方法，1部手机，先打印短信还是邮件
    先邮件再短信！
    跟睡眠的时间有关系! 如果没有睡眠，则按照执行的顺序!

 8 1个静态同步方法,1个普通同步方法，2部手机，先打印短信还是邮件
    先邮件再短信！
    跟睡眠的时间有关系! 如果没有睡眠，则按照执行的顺序!
 */


public class Lock_8 {

    public static void main(String[] args) throws ExecutionException, InterruptedException {

        // 创建一个FutureTask 这个需要实现一个callable 函数式接口
        FutureTask<Integer> futureTask = new FutureTask<Integer>(() -> {
            System.out.println(Thread.currentThread().getName() + "  come in callable");
            Thread.sleep(1000);
            //  设置返回值
            return 1024;
        });
        //  FutureTask 是Runnable 的实现类
        new Thread(futureTask, "AA").start();
        //  可以在调用结果之前判断当前任务是否已经完成！如果没用完成，则等待
        while (!futureTask.isDone()) {
            System.out.println("等待.....");
        }
        System.out.println(futureTask.get());

        //        //  创建一个资源类
        //        Phone phone = new Phone();
        //        Phone phone2 = new Phone();
        //        //  创建线程 复制小括号，写死右箭头，落地大括号
        //        //  线程AA
        //        new Thread(()->{
        //            try {
        //                //  静态同步方法
        //                phone.SendSMS();
        //            } catch (InterruptedException e) {
        //                e.printStackTrace();
        //            }
        //        },"AA").start();
        //        //  线程BB
        //        new Thread(()->{
        //            //  phone.sendEmail();
        //            // phone2.sendEmail();
        //              phone.getHello();
        //        },"BB").start();

    }
}
