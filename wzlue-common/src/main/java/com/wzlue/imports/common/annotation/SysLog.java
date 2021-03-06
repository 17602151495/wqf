package com.wzlue.imports.common.annotation;

import com.wzlue.imports.common.base.LogSource;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 系统日志注解
 * 
 * @author chenshun
 * @email sunlightcs@gmail.com
 * @date 2017年3月8日 上午10:19:56
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SysLog {

	/**
	 * 描述
	 * @return
	 */
	String value() default "";

	/**
	 * 来源 默认PC
	 * @return
	 */
	LogSource source() default LogSource.PC;
}



