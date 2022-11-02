package com.lei.spanner.core.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 该注解作用：
 * 多租户系统，属于租户内的数据接口都需要增加该注解用于判定。
 * 例如：在神农口袋项目中，企业作为一个租户，所有企业内部的接口都需要增加该注解，比如，修改企业名称接口，删除企业接口，增加企业内农场接口等。
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface HasPermFarm {

    String value() default "";
}
