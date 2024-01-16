/*=============================================
  ■■■ 자바의 기본 프로그래밍 ■■■
  - 산술 연산자
  - BufferedReader
  - printf()
==============================================*/

// 사용자로부터 임의의 정수를 두번 입력받아
// 사칙연산 및 나머지 연산을 수행하여
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 입력받는 과정은 bufferedReader 를 활용 할 수 있도록 하고
// 출력 하는 과정은 printf() 메소드를 활용할 수 있도록 한다
// 또한, 나눗셈 연산은 편의상 정수 기반으로 처리한다.

// 실행 예)
// 첫 번째 정수 입력 : 10
// 두 번째 정수 입력 : 2
//
// =====[결과]=====
// 10 + 2 = 12
// 10 - 2 = 8
// 10 * 2 = 20
// 10 / 2 = 5
// 10 % 2 = 0 

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test021
{
	public static void main (String[] args) throws IOException
	{


		// 내가 풀어본 내용 ------------------------------------------------------------------
		/*
		//주요 변수 선언
		//키보드 장착 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int a, b;		//사용자가 입력한 두개의 정수
		int c, d, e, f, g; // 사칙연산 값을 저장

		//연산 및 처리
		//사용자에게 안내 메세지 출력
		System.out.print("첫 번째 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		c = a + b;			// 덧셈 연산
		d = a - b;			// 뺄셈 연산
		e = a * b;			// 곱셈 연산 
		f = a / b;			// 나누기 연산
		g = a % b;			// 나머지 연산

		//결과 출력
		System.out.printf("\n=====[결과]=====\n");
		System.out.printf("%d + %d = %d\n", a, b, c);   //덧셈 결과 출력
		System.out.printf("%d - %d = %d\n", a, b, d);	//뺄셈 결과 출력
		System.out.printf("%d * %d = %d\n", a, b, e);	//곱셈 결과 출력
		System.out.printf("%d / %d = %d\n", a, b, f);	//나누기 결과 출력
		System.out.printf("%d %% %d = %d\n", a, b, g);	//나머지 결과 출력
		System.out.printf("================\n");
		*/
		
		//실행결과
		/*
		첫 번째 정수 입력 : 10
		두 번째 정수 입력 : 3

		=====[결과]=====
		10 + 3 = 13
		10 - 3 = 7
		10 * 3 = 30
		10 / 3 = 3
		10 % 3 = 1
		================
		계속하려면 아무 키나 누르십시오 . . .

		*/
		//------------------------------------------------------------------------------------

		//내 짝꿍이 풀어본 내용 --------------------------------------------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		// 주요 변수 선언
		int num1, num2;
		int a, b, c, d, e;
      

		// 연산 및 처리
		System.out.print("첫 번째 정수 입력 : ");
		num1 = Integer.parseInt(br.readLine());
	
		System.out.print("두 번째 정수 입력 : ");
		num2 = Integer.parseInt(br.readLine());

		a = num1 + num2;      // 덧셈
		b = num1 - num2;      // 뺄셈
	    c = num1 * num2;      // 곱셈
		d = num1 / num2;      // 나눗셈
		e = num1 % num2;      // 나머지


        // 결과 출력
        System.out.printf("\n====[결과]====");
        System.out.printf("\n%d + %d = %d", num1, num2, a);
        System.out.printf("\n%d - %d = %d", num1, num2, b);
        System.out.printf("\n%d * %d = %d", num1, num2, c);
        System.out.printf("\n%d / %d = %d", num1, num2, d);
        System.out.printf("\n%d %% %d = %d", num1, num2, e);
        System.out.printf("\n==============\n");
        */

		//------------------------------------------------------------------------------------

		// 수업 하며 같이 풀어 본 내용 -------------------------------------------------------
		
		//주요 변수 선언
		int num1 , num2;					// 사용자 입력 값을 담을 변수
		int res1, res2, res3, res4, res5;	// 각각의 연산 결과를 담을 변수

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		//연산 및 처리
		System.out.print("첫 번째 정수 입력 : ");
		num1 = Integer.parseInt(br.readLine());
		
		System.out.print("두 번째 정수 입력 : ");
		num2 = Integer.parseInt(br.readLine());

		res1 = num1 + num2;
		res2 = num1 - num2;
		res3 = num1 * num2;
		res4 = num1 / num2;
		res5 = num1 % num2;

		//결과 출력
		System.out.printf("\n=====결과=====\n");
		System.out.printf("%d + %d = %d\n", num1, num2, res1);
		System.out.printf("%d - %d = %d\n", num1, num2, res2);
		System.out.printf("%d * %d = %d\n", num1, num2, res3);
		System.out.printf("%d / %d = %d\n", num1, num2, res4);
		System.out.printf("%d %% %d = %d\n", num1, num2, res5); // --==>> %% → %
		System.out.printf("================\n");
	

		

		//------------------------------------------------------------------------------------
					

	}

}

//실행결과
/*
첫 번째 정수 입력 : 10
두 번째 정수 입력 : 3

=====결과=====
10 + 3 = 13
10 - 3 = 7
10 * 3 = 30
10 / 3 = 3
10 % 3 = 1
================
계속하려면 아무 키나 누르십시오 . . .
*/