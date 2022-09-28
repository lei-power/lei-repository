package com.atguigu.juc.rolback;

/***
 *@author wanglei
 *@Date 2022/5/31 17:23
 ***/

import java.util.concurrent.Callable;

/**
 * @author fpp
 * @version 1.0
 * @date 2020/8/17 19:16
 */
public interface Task<T> extends Callable<T> {
    /**
     * 任务回滚方法
     */
    void rollback();
}
