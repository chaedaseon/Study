/*=================================
	CalculatorBeforeAdvice.java
	- Before Advice 구성
=================================*/

package com.test.spr;

import java.lang.reflect.Method;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.MethodBeforeAdvice;

public class CalculatorBeforeAdvice implements MethodBeforeAdvice
{
	@Override
	public void before(Method arg0, Object[] arg1, Object arg2) throws Throwable
	{
		Log log = LogFactory.getLog(this.getClass());
		log.info("Before Advice 수행 --------------------");
		log.info("주 업무 처리 전에 수행되어야 하는 업무!");
		log.info("-------------------- Before Advice 수행");
		
	}

}
