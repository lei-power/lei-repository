package com.atguigu.design.behavioral.chain.demo;

/***
 *@author wanglei
 *@Date 2022/2/18 16:04
 ***/


public class MaxFilter implements Filter {

    @Override

    public void doFilter(Chain chain) {
        System.err.println("maxxxx...之前...");
        chain.doFilter(chain);
        System.err.println("maxxxx...之后...");
    }
}

