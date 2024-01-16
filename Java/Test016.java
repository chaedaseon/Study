/*=============================================
  ■■■ 자바의 기본 프로그래밍 ■■■
  - 변수와 자료형
  - 자바의 기본 입출력 : System.out.printf()
==============================================*/


public class Test016
{
	public static void main(String[] args)
	{
		System.out.print("AAA");
		System.out.print("BBB");
		System.out.print("CCC\n");		// -- 『\n』 개행

		System.out.println();			// -- 개행 
		//System.out.print();
		// -- 에러 발생 (컴파일 에러)

		System.out.printf("123456789");
		System.out.printf("123456789\n");	// -- 『\n』 개행
		System.out.printf("123456789%n");	// -- 『%n』 개행

		//System.out.printf();
		//에러 발생 컴파일 에러
		
		System.out.printf("%d + %d = %d\n" , 10 ,20 ,30);
		//--==>>10+20+=30

		System.out.printf("%d\n" , 123);
		System.out.printf("%10d\n" , 123);  //10만큼 자리를 확보!! 숫자는 우측정렬, 글자는 좌측정렬
		System.out.printf("%8d\n" , 1234);
		System.out.printf("%010d\n" , 123); 
		// --==>>
		/*
		123
		      123
		   1234
		0000000123
		*/

		System.out.printf("%+d\n", 365);
		//--==>> +365
		System.out.printf("+%d\n", 365);
		//--==>> +365

		System.out.printf("%d\n" , +365);
		//--==>> 365

		//System.out.printf("%-d\n", 365);
		// --==>> 에러 발생 (런타임 에러)

		System.out.printf("-%d\n",365);
		//--==>> -365
		System.out.printf("%d\n" , -365);
		//--==>> -365

		//System.out.printf("%d\n" , 'A');
		//--==>> 에러 발생(런타임 에러)
		System.out.printf("%c\n" , 'A');
		//--==>> A
		
		//System.out.printf("%c\n" , "ABCD");
		// --==>> 에러 발생(런타임 에러)
		System.out.printf("%s\n" , "ABCD");
		// --==>> ABCD


		System.out.printf("%h\n",365);
		//--==>> 16d 16진수 형태

		System.out.printf("%o\n" , 24);
		//--==>> 30  8진수 형태

		System.out.printf("%b\n", true);
		System.out.printf("%b\n", false);
		//--==>> true
		//       false

		System.out.printf("%f\n" , 123.23);
		//--==>> 123.230000
		System.out.printf("%.2f\n" , 123.23);		//소수점 이하 두 번째 자리까지 표현
		//--==>> 123.23
		
		System.out.printf("%.2f\n", 123.231);
		//--==>> 123.23
		//-- 소수점 이하 두 번째 자리까지 표현
		//	 (소수점 이하 세 번째 자리 절삭)
		System.out.printf("%.2f\n" , 123.235);
		//--==>> 123.24
		//-- 소수점 이하 두 번째 자리까지 표현
		//	 (소수점 이하 세 번째 자리 반올림)

		System.out.printf("%8.2f\n", 123.236);		//소수점 이하 두번째 자리까지 표현 +전체 자리 수 8자리 해라~
		//--==>>   123.24
		
		System.out.printf("%2.2f\n", 123.236);		//전체 자리 수보다 표현하라고 한 자리수가 작으면 무시된다
		//--==>> 123.24 
	}
}

//실행 결과
/*
AAABBBCCC

123456789123456789
123456789
10 + 20 = 30
123
       123
    1234
0000000123
+365
+365
365
-365
-365
A
ABCD
16d
30
true
false
123.230000
123.23
123.23
123.24
  123.24
123.24
계속하려면 아무 키나 누르십시오 . . .

*/