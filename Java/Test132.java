/*============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - BigInteger 클래스
==============================================*/


import java.math.BigInteger;

public class Test132
{
	public static void main(String[] args)
	{
		//불가능
		//int a1 = 123456789123456789;
		//System.out.println(a1);
		// integer number too large: 123456789123456789
		
		//불가능
		//long b1 = 123456789123456789;
		//System.out.println(b1);

		//가능
		//long c1 = 123456789123456789L;
		//System.out.println(c1);
		//--==>> 123456789123456789
		
		//불가능
		//long d1 = 123456789123456789123456789L;
		//System.out.println(d1);

		BigInteger a = new BigInteger("123456789123456789");
		BigInteger b = new BigInteger("123456789123456789");

		// 1, long형을 넘겨야한다. 2. import문 구성 해야한다 3. 정수형을 넘기기 때문에 문자열로 쓴다!

		//BigInteger c = a + b;
		//System.out.println(c);

		// BigInteger 메소드를 찾아봐야한다!

		//더하기
		BigInteger c = a.add(b);
		System.out.println("덧셈 결과 : " + c);
		//--==>> 덧셈 결과 : 246913578246913578

		// 빼기
		BigInteger d = a.subtract(b);
		System.out.println("뺄셈 결과 : " + d);
		//--==>> 뺄셈 결과 : 0

		//곱셈 
		BigInteger e = a.multiply(b);
		System.out.println("곱셈 결과  : " + e);
		//--==>> 곱셈 결과  : 15241578780673678515622620750190521

		//나누기
		BigInteger f = a.divide(b);
		System.out.println("나눗셈 결과 : " + f);
		//--==>> 나눗셈 결과 : 1

		BigInteger g = new BigInteger("2");
		System.out.println("2의 3승 : " + g.pow(3));
		//--==>> 2의 3승 : 8

	}
}

//실행결과 
/*

덧셈 결과 : 246913578246913578
뺄셈 결과 : 0
곱셈 결과  : 15241578780673678515622620750190521
나눗셈 결과 : 1
2의 3승 : 8
계속하려면 아무 키나 누르십시오 . . .

*/