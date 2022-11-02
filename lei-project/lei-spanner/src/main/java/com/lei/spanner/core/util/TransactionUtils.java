package com.lei.spanner.core.util;

import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

@Slf4j
public class TransactionUtils {

    /**
     * 手动回滚事务
     */
    public static void rollback(String funcName){
        log.warn("{} 方法调用出错，手动回滚事务",funcName);
        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
    }
}
