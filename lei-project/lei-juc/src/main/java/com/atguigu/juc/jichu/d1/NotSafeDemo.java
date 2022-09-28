package com.atguigu.juc.jichu.d1;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * @author mqx
 * @date 2021-4-2 14:26:50
 */
public class NotSafeDemo {

    public static void main(String[] args) {
        //  创建集合
        //  List<String> list = new ArrayList<>();
        //  List<String> list = new Vector<>(); //  太慢！
        //  List<String> list = Collections.synchronizedList(new ArrayList<>());
        List<String> list = new CopyOnWriteArrayList();
        //  创建线程
        //          一个线程添加数据没有任何问题！
        //        new Thread(()->{
        //            for (int i = 1; i <= 30; i++) {
        //                list.add(UUID.randomUUID().toString());
        //                System.out.println(list);
        //            }
        //        },"AA").start();

        Set<String> set = new HashSet<>();
        set.add("abc");
        //  Map<String,String> map = new HashMap<>();
        //  map.put();
        Map<String, String> map = new ConcurrentHashMap<>(); //  线程安全！   电商秒杀会用！
        //  map.put()
        //  创建多个线程执行！
        for (int i = 1; i <= 30; i++) {
            new Thread(() -> {
                //  线程不安全！
                list.add(UUID.randomUUID().toString());
                System.out.println(list);
            }, String.valueOf(i)).start();
        }

        /*
            public boolean add(E e) {
                ensureCapacityInternal(size + 1);  // Increments modCount!!
                elementData[size++] = e;
                return true;
            }
         */
        //  以后不适用 ArrayList ?

    }
}
