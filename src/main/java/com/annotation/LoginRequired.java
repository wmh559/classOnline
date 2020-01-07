package com.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author Atom
 * @date 2020/1/7
 * @time 17:31
 */
@Target(ElementType.METHOD)  //拦截被注解的方法
@Retention(RetentionPolicy.RUNTIME)  //在jvm构建时候运行
public @interface LoginRequired {
    boolean needLogin() default true;
}
