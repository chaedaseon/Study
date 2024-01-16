/*====================================
  ■■■ 자바의 개요 및 특징 ■■■
  - 변수와 자료형
  - 변수와 자료형 실습 및 테스트 : char
======================================*/

public class Test008
{
	public static void main(String[] args)
	{
		// 주요 변수 선언
		char ch1, ch2, ch3;

		int a;					// ~check~!!!!

		// 연산 및 처리
		ch1 = 'A';
		//ch2 = 'B';
		//ch2 = 'BB'; 
		ch2 = '대';
		ch3 = '\n';				// 개행 문자

		//a = 10;
		//a = ch1;				// ~check~!!!!
		a = (int)ch1;			// !check~!!!!
		// -- 명시적 형 변환(강제 형 변환)


		// 결과 출력
		System.out.println(" ch1 : " + ch1);
		System.out.println(" ch2 : " + ch2);
		System.out.println(" ch3 : " + ch3);


		System.out.println(" a : " + a);


		// 결과 출력 
		//System.out.println(" ○ ○ ○ ○%n" ,ch1, ch2,ch3,a);
		System.out.printf("%c %c %c %d%n" ,ch1, ch2,ch3,a);


	}
}

//실행결과
/*
 ch1 : A
 ch2 : 대
 ch3 :

 a : 65
A 대
 65
계속하려면 아무 키나 누르십시오 . . .

*/