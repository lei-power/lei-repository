package com.atguigu.juc.jichu.d2;

import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

/**
 * @author mqx
 * @date 2021-4-6 11:29:26
 */
public class CyclicBarrierDemo {

    //  集齐7颗龙珠，召唤神龙！
    public static void main(String[] args) {
        CyclicBarrier cyclicBarrier = new CyclicBarrier(10, () -> System.err.println("放学铃声响起！！"));
        for (int i = 0; i < 10; i++) {
            new Thread(() -> {
                System.err.println(Thread.currentThread().getName() + "号家长到校门！");
                try {
                    cyclicBarrier.await();
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
                catch (BrokenBarrierException e) {
                    e.printStackTrace();
                }
                System.err.println(Thread.currentThread().getName() + "号家长接到孩子回家了");
            }).start();
        }
    }
}
