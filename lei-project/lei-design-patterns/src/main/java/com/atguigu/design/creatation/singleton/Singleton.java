package com.atguigu.design.creatation.singleton;

/***
 *@author wanglei
 *@Date 2022/2/16 10:16
 ***/


public class Singleton {

    //
//    /**
//     * 私有构造
//     */
//    private Singleton() {}
//
//    /**
//     * 静态内部类
//     */
//    private static class InnerObject {
//
//        private static Singleton single = new Singleton();
//    }
//
//    public static Singleton getInstance() {
//        return InnerObject.single;
//    }
    private long age;
    private boolean full;

    public Singleton() { }

    public static Singleton getInstance() {
        return InnerSingleton.insteance;
    }

    private static class InnerSingleton {

        private static Singleton insteance = new Singleton();
    }
}


