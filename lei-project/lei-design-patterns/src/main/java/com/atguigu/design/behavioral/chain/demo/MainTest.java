package com.atguigu.design.behavioral.chain.demo;

/***
 *@author wanglei
 *@Date 2022/2/18 16:16
 ***/


public class MainTest {

    public static void main(String[] args) {
        Chain filterChain = new Chain();
        filterChain.setTarget(new TargetMethod());
        filterChain
                .addFilter(new CharsetFilter())
                .addFilter(new MaxFilter())
                .addFilter(new GohomeFilter())
                .addFilter(new CharsetFilter())
                .addFilter(new GohomeFilter())
                .addFilter(new MaxFilter())
                .doFilter(filterChain);


    }

}
