package com.xeasywork.tinyflow.common.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 自定义注解，用于AI工作流节点扫描
 */
@Retention(RetentionPolicy.RUNTIME) // 运行时可见
@Target(ElementType.METHOD)           // 作用于类
public @interface MethodName {
}
