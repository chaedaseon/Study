/*================================================
	CalculatorImpl.java
	- 클래스.
	- Calculator 인터페이스를 구현하는 클래스
	- 주 업무만 적용되어 있는 형태.
=================================================*/

package com.test.spr;

public class CalculatorImpl implements Calculator
{
	// 주 업무(core concern) 진행을 위한 메소드 구현
	
	@Override
	public int add(int x, int y)
	{
		int result = 0;
		
		// ※ 주 업무(core concern)를 수행하는 과정에서 예외 상황을 만들기 위해
		//    예외 객체 생성
		//    - try ~ catch ~ finally : 예외 발생 시 자체적으로 처리
		//    - throws                : 예외 발생 시 자신을 호출한 객체에 예외 넘기는 처리
		//    - throw                 : 예외를 인위적으로 발생시키는 처리
		
		// 두 개의 매개변수 중 100보다 큰 수가 존재할 경우
		if (x>100 || y>100)
		{
			// 예외를 인위적으로 발생~!!!
			throw new IllegalArgumentException("100 보다 큰 인자를 전달한 예외 발생~!!!");
		}
		
		// 주 업무(core concern) 실행 내용
		result = x + y;		
		System.out.printf("%d + %d = %d%n", x, y, result);
		
		return result;
	}

	@Override
	public int sub(int x, int y)
	{
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x - y;		
		System.out.printf("%d - %d = %d%n", x, y, result);		
		
		return result;
	}

	@Override
	public int mul(int x, int y)
	{
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x * y;		
		System.out.printf("%d * %d = %d%n", x, y, result);
		
		return result;
	}

	@Override
	public int div(int x, int y)
	{
		int result = 0;
		
		// 주 업무(core concern) 실행 내용
		result = x / y;		
		System.out.printf("%d / %d = %d%n", x, y, result);
		
		return result;
	}

}
