package com.atguigu.design.behavioral.chain.demo;

/***
 *@author wanglei
 *@Date 2022/2/18 16:01
 ***/


public class CharsetFilter implements Filter {

    @Override
    public void doFilter(Chain chain) {
        System.err.println("charset...之前...");
        chain.doFilter(chain);
        System.err.println("charset...之后...");
    }
}
