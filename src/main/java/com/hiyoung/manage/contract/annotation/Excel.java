package com.hiyoung.manage.contract.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface Excel {
    //Excel列名称
    String name() default "";

    //Excel列数
    int orderNum() default 0;
}

