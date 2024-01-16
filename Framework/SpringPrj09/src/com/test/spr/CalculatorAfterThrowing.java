/*===================================
	CalculatorAfterThrowing.java
	- After Throwing Advice 구성
===================================*/

package com.test.spr;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.aop.ThrowsAdvice;

public class CalculatorAfterThrowing implements ThrowsAdvice
{
	public void afterThrowing(IllegalArgumentException e) throws Throwable
	{
		/*
		try
		{
		} catch (Exception e)
		{
		}
		*/
		
		Log log = LogFactory.getLog(this.getClass());
		log.info("After Throwing Advice ------------------------------");
		log.info("주 업무 처리과정에서 예외 발생 시 실행되는 사후 업무");
		log.info("------------------------------ After Throwing Advice");
		
	}

}
