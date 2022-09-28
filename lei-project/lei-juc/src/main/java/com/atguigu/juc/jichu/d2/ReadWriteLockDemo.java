package com.atguigu.juc.jichu.d2;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.locks.ReentrantReadWriteLock;

/**
 * @author mqx
 * @date 2021-4-6 14:02:59
 */
//  资源类:用map 模拟缓存读写数据
class MyCache {

    //  使用map 模拟缓存
    //  volatile ： 最好加上！
    //  private volatile HashMap<String,Object> hashMap = new HashMap<>();  //  线程不安全
    private Map<String, Object> hashMap = new ConcurrentHashMap<String, Object>();    //  线程安全！
    //  声明一个对写锁对象
    private ReentrantReadWriteLock readWriteLock = new ReentrantReadWriteLock();

    //  编写一个读写方法
    public void put(String key, Object value) {
        //  声明锁对象
        readWriteLock.writeLock().lock();
        try {
            //  信息提示谁在写入数据！
            System.out.println(Thread.currentThread().getName() + "\t 正在写" + key);
            try {
                Thread.sleep(300);
            }
            catch (InterruptedException e) {
                e.printStackTrace();
            }
            hashMap.put(key, value);
            //  信息提示写入完成！
            System.out.println(Thread.currentThread().getName() + "\t 写入完成" + key);
        }
        finally {
            readWriteLock.writeLock().unlock();
        }
    }

    //  获取数据
    public Object get(String key) throws InterruptedException {
        readWriteLock.readLock().lock();
        Object object;
        try {
            //  信息提示谁在写入数据！
            System.out.println(Thread.currentThread().getName() + "\t 正在读" + key);
            Thread.sleep(300);
            object = hashMap.get(key);
            //  信息提示写入完成！
            System.out.println(Thread.currentThread().getName() + "\t 读取完成" + object);
        }
        finally {
            readWriteLock.readLock().unlock();
        }
        //  返回数据
        return object;
    }
}

public class ReadWriteLockDemo {

    //  主入口
    public static void main(String[] args) {
        //  线程操作资源类
        MyCache myCache = new MyCache();
        //  调用写，读方法
        //  myCache.put();   myCache.get();

        //  使用循环来模拟多个线程去读写数据
        for (int i = 1; i <= 5; i++) {
            int temp = i;
            new Thread(() -> {
                myCache.put(temp + "", temp + "");
            }, String.valueOf(i)).start();
        }

        //  读取数据
        for (int i = 1; i <= 5; i++) {
            int temp = i;
            new Thread(() -> {
                try {
                    myCache.get(temp + "");
                }
                catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }, String.valueOf(i)).start();
        }


    }
}
