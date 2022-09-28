package com.atguigu.design.structural.proxy.cglib;

import java.lang.reflect.Method;
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

/***
 *@author wanglei
 *@Date 2022/2/18 15:05
 ***/


public class Demo {

    static <T> T createProxy(T target) {
        Enhancer enhancer = new Enhancer();
        enhancer.setSuperclass(target.getClass());
        enhancer.setCallback(new MethodInterceptor() {
            @Override
            public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy)
                    throws Throwable {
                // xxxx
                System.err.println("xxxxxxxxxxxxxxxxx");
                Object invokeSuper = methodProxy.invokeSuper(o, objects);
                // ???
                return invokeSuper;
            }
        });
        Object proxy = enhancer.create();
        return (T) proxy;
    }
}
