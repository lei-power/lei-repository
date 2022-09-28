package com.atguigu.design.behavioral.chain.demo;

/***
 *@author wanglei
 *@Date 2022/2/18 16:05
 ***/


public class GohomeFilter implements Filter {

    @Override
    public void doFilter(Chain chain) {
        System.err.println("Gohome...之前...");
        chain.doFilter(chain);
        System.err.println("Gohome...之后...");
    }
}

