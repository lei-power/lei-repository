package com.lei.spanner.core.annotation;

import java.lang.annotation.*;

/**
 * 该注解作用：
 * 方法接口上加此注解可跳过sql注入检测
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SqlParamCheckout {
}
