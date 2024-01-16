/*===============================
 ■■■ 자바 기본 프로그램 ■■■
 - 변수와 자료형
 ===============================*/

public class Test003
{
	public static void main(String[] args)
	{
		//변수 선언
		int a;

		// 변수 a 에 10 대입(변수 초기화)
		a = 10;

		//변수 선언 및 초기화 (선언과 대입을 한번에 처리)
		int b = 20;

		//int a = 30; 선언 안됨 → 이름을 중복으로 사용 할 수 없음 

		// 변수 선언
		int c;
		
		//테스트
		//System.out.println(c);
		//--==>>에러 발생 (컴파일 에러)
		
		//System.out.println(b);
		//--==>> 20

		//System.out.println(a);
		//-==>> 10
		

		// 연산 및 처리
		c = a + b; 
		// -- c = 10 + b;
		// -- c = 10 + 20;
		// -- c = 30;
		// -- 변수 c에 30을 대입해라. 
		
		//결과 출력
		System.out.println(c);
		//--==>> 30

		//결과 출력
		//System.out.println(a b c);
		// --==>> 에러 발생 (컴파일 에러)

		//결과 출력
		//System.out.println(abc);
		// --==>> 에러 발생 (컴파일 에러)

		//※ 덧셈 연산자 (+)
		//	 피연산자 중 어느 하나라도 문자열 형태의 데이터가 존재한다면
		//	 산술연산자로서의 덧셈 연산의 기능을 수행하는 것이 아니라
		//	 문자열 결합 연산자로써의 기능을 수행하게 된다. 
		

		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
		//-==>> 10
		//	    20
		//      30


		System.out.println(a + " " + b + " " + c);
		//--==>> 10 20 30

		//결과 출력
		System.out.println("a의 값은 " + a + " 입니다.");
		System.out.println("b의 값은 " + b + " 입니다.");
		System.out.println("c의 값은 " + c + " 입니다.");
		// -- 『+』 연산자를 사용하는 과정에서 
		//	   피연산자 중 문자열이 포함되어 있을경우
		//	   문자열 결합 연산자로 활용되며
		//     처리의 최종 결과는 문자열의 형태로 반환된다. 
		// --==>> a의 값은 10 입니다.
		//		  b의 값은 20 입니다.
		//		  c의 값은 30 입니다.
		
		System.out.println(1+2);			//산술연산자 +
		System.out.println("1"+2);			//문자열 결합 연산자 +	
		System.out.println(1+"2");			//문자열 결합 연산자 +
		System.out.println("1"+"2");		//문자열 결합 연산자 +
		
		System.out.println("결과 확인 : " + 1+ 2);
		System.out.println("결과 확인 : " + (1+2));


	}
}

//실행 결과
/*
30
10
20
30
10 20 30
a의 값은 10 입니다.
b의 값은 20 입니다.
c의 값은 30 입니다.
3
12
12
12
결과 확인 : 12
결과 확인 : 3
계속하려면 아무 키나 누르십시오 . . .
*/