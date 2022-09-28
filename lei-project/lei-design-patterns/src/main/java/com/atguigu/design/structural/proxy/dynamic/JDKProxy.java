package com.atguigu.design.structural.proxy.dynamic;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/***
 *@author wanglei
 *@Date 2022/2/18 14:29
 ***/


public class JDKProxy<K> implements InvocationHandler {

    private K target;

    public JDKProxy(K target) {
        this.target = target;
    }

    static <T> T getProxy(T t) {
        Object o = Proxy.newProxyInstance(t.getClass().getClassLoader(), t.getClass().getInterfaces(), new JDKProxy(t));
        return (T) o;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.out.println("start....");
        Object invoke = method.invoke(target, args);
        System.out.println("over。。。。");
        return invoke;
    }
}
