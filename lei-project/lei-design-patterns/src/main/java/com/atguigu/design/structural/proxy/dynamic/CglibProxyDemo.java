package com.atguigu.design.structural.proxy.dynamic;

import java.lang.reflect.Method;
import net.sf.cglib.proxy.Enhancer;
import net.sf.cglib.proxy.MethodInterceptor;
import net.sf.cglib.proxy.MethodProxy;

/***
 *@author wanglei
 *@Date 2022/2/18 14:46
 ***/


public class CglibProxyDemo {

    static <T> T getProxy(T t) {
        //1、创建一个增强器
        Enhancer enhancer = new Enhancer();
        //2、设置要增强哪个个类的功能。增强器为这个类动态创建一个子类
        enhancer.setSuperclass(t.getClass());
        //3、设置回调
        enhancer.setCallback(new MethodInterceptor() {
            @Override
            public Object intercept(Object o, Method method, Object[] objects, MethodProxy methodProxy)
                    throws Throwable {
                System.out.println("CGLIB XXX");
                Object invokeSuper = methodProxy.invokeSuper(o, objects);
                return invokeSuper;
            }
        });
        return (T) enhancer.create();
    }


}
