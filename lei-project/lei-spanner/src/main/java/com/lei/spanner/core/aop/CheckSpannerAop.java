package com.lei.spanner.core.aop;

import com.lei.spanner.core.util.DateTimeUtils;
import java.util.Date;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/***
 *@author wanglei
 *@Date 2022/11/7 9:53
 ***/

@Component
@Aspect
@Order(5)
@Slf4j
public class CheckSpannerAop {

    private ThreadLocal<Long> startTime = new ThreadLocal<>();

    @Pointcut("execution(public * com.lei.spanner.controller..*.*(..))")
    public void controller() {}

    @Around(value = "controller()")
    public Object logAround(ProceedingJoinPoint joinPoint) throws Throwable {
        long strart = System.currentTimeMillis();
        log.info("接口开始执行，当前时间{}", DateTimeUtils.convertDate2String(new Date(), DateTimeUtils.DEFAULT_DATE_FORMAT));
        Object result = joinPoint.proceed();
        long end = System.currentTimeMillis();
        log.warn("接口执行完毕，共耗时：{}分{}秒", (end - strart) / 1000 / 60, (end - strart) / 1000 % 60);
        return result;

    }

}
