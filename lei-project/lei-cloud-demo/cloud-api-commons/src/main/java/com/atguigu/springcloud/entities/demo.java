package com.atguigu.springcloud.entities;

import cn.hutool.core.util.RuntimeUtil;

/***
 *@author wanglei
 *@Date 2022/1/24 15:05
 ***/


public class demo {

    public static void main(String[] args) {
        System.err.println(RuntimeUtil.execForStr("ipconfig"));
//        System.err.println(RuntimeUtil.exec("ipconfig"));
    }
}
