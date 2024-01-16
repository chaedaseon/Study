/*============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - Wrapper 클래스
==============================================*/

		//toXxxx → 대부분 뭔갈 변환 해주는 메소드 
		//isXxxx → 대부분 뭐가를 맞는지 아닌지  메소드

public class Test135
{
	public static void main(String[] args)
	{
		System.out.println(Integer.MAX_VALUE);		//static final 인거 확인 가능
		System.out.println(Integer.MIN_VALUE);
		//--==>> 2147483647
		//		 -2147483648

		System.out.println(Long.MAX_VALUE);
		System.out.println(Long.MIN_VALUE);
		//--==>> 9223372036854775807
		//		 -9223372036854775808

		System.out.println(Double.MAX_VALUE);
		System.out.println(Double.MIN_VALUE);
		//--==>> 1.7976931348623157E308
		//		 4.9E-324
		//		 ※ e 표기법

		System.out.println();		//개행

		//실수 기반의 나눗셈 연산
		System.out.println("1 : " + 3.0/0);
		System.out.println("2 : " + -3.0/0);
		//--==>> 1 : Infinity
		//		 2 : -Infinity

		System.out.println("3: " +(3.0/0 == 3.0/0));
		System.out.println("4: " + (3.0/0 == -3.0/0));
		//--==>> 3: true
		//		 4: false

		// 『Double.isInfinite()』 값이 무한대인지 아닌지 확인
		System.out.println("5 : "+Double.isInfinite(3.0/0));
		System.out.println("6 : "+Double.isInfinite(-3.0/0));
		//--==>> 5 : true
		//		 6 : true

		System.out.println("7: "+ (3.0/0 + -3.0/0));
		System.out.println("8: "+(0.0/0));
		//--==>> 7: NaN (→ Not a Number) 숫자가 아닙니다. 
		//		 8: NaN

		System.out.println("9: " +(0.0/0 == 0.0/0));
		System.out.println("10: "+(0.0/0 != 0.0/0));
		//--==>> 9: false
		//		10: true

		//※ NaN(→Not a Number)값과 임의의 값을
		//	 크기 비교를 수행하는 『==』연산자를 통해 비교 연산을 수행하게 되면
		//	 결과는 언제나 『false』를 반환한다
		//	 즉, 둘은 비교 할 수가 없다는 뜻

		//『Double.isNaN()』
		System.out.println("11: "+Double.isNaN(0.0/0));
		System.out.println("12: "+Double.isNaN(1.1+2.2));
		//--==>> 11: true
		//		 12: false

		



	}
}