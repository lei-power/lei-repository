package com.atguigu.design.structural.proxy.dynamic;

import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;

/***
 *@author wanglei
 *@Date 2022/2/18 14:11
 ***/


public class ProxyDemo<T> implements InvocationHandler {

    private T target;

    public ProxyDemo(T target) {
        this.target = target;
    }

    public static <T> T getProxy(T t) {
        Object proxy = Proxy
                .newProxyInstance(t.getClass().getClassLoader(), t.getClass().getInterfaces(), new ProxyDemo(t));
        return (T) proxy;
    }

    @Override
    public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
        System.err.println("jdk动态代理增强");
        Object invoke = method.invoke(target, args);
        System.err.println("jdk动态代理增强结束MAX");
        return invoke;
    }
}
