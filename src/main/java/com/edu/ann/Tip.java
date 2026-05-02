package com.edu.ann;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.FIELD)
@Retention(RetentionPolicy.RUNTIME)
public @interface Tip {//这个注解接口类就是为实体类中的字段加一个注释，后续如果需要用excel导出数据的话，可以用这个来进行标注字段的名字
    String value();
}