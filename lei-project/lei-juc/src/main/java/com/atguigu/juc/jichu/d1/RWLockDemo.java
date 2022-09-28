package com.atguigu.juc.jichu.d1;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/***
 *@author wanglei
 *@Date 2022/5/26 10:07
 ***/

public class RWLockDemo {

    private Map map = new ConcurrentHashMap<Integer, Integer>();
    private ReentrantReadWriteLock rwLock = new ReentrantReadWriteLock();

    public void put(Integer key, Integer value) {
        rwLock.writeLock().lock();
        try {
            System.err.println(Thread.currentThread().getName() + "----------" + "开始写入");
            map.put(key, value);
            TimeUnit.SECONDS.sleep(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.err.println(Thread.currentThread().getName() + "----------" + "key:" + key + "value:" + value + "写入结束");
            rwLock.writeLock().unlock();
        }
    }

    public void get(Integer key) {
        rwLock.readLock().lock();
        try {
            System.err.println(Thread.currentThread().getName() + "----------" + "开始读取");
            map.get(key);
            TimeUnit.SECONDS.sleep(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.err.println(Thread.currentThread().getName() + "value" + map.get(key) + "\"----------\" 读取结束");
            rwLock.readLock().unlock();
        }
    }

    public static void main(String[] args) {
        RWLockDemo rwLockDemo = new RWLockDemo();
        for (int i = 0; i < 5; i++) {
            int finalI = i;
            new Thread(() -> rwLockDemo.put(finalI, finalI * 2)).start();
        }
        for (int i = 0; i < 5; i++) {
            int finalI = i;
            new Thread(() -> rwLockDemo.get(finalI)).start();
        }
    }

}
