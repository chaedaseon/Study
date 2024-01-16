/*===============================
  ■■■ 연산자(Operator) ■■■
  - 조건 연산자 == 삼항 연산자 
=================================*/

// 사용자로부터 임의의 연도를 입력받아
// 입력받은 연도가 윤년인지 평년인지 판별하여
// 그 결과를 출력하는 프로그램을 구현한다.
// 단, 입력은  BufferedReader 를 활용하고
// 조건연산자를 활용하여 연산을 수행할 수 있도록 한다

// 실행 예)
// 임의의 연도 입력 : 2000
// 2000 → 윤년
// 계속하려면 아무 키나 누르세요....

// 임의의 연도 입력 : 2012
// 2012 → 윤년
// 계속하려면 아무 키나 누르세요....

// 임의의 연도 입력 : 2023
// 2023 → 평년
// 계속하려면 아무 키나 누르세요....

// ※ 2월이 28일까지 있는 해 → 평년
//		    29일까지 있는 해 → 윤년

// ※ 윤년 판별 조건
//	  연도가 4의 배수이면서 100의 배수가 아니거나
//	  400의 배수이면 윤년 ~! 
//    그렇지 않으면 평년! 

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test030
{
	public static void main(String[] args) throws IOException
	{
		
		//주요 변수 선언
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		/*
		int a;					//사용자가 입력한 임의의 연도
		String strResult;		//판별 한 값을 넣을 변수			

		//연산 및 처리
		//사용자에게 안내 메세지 출력
		System.out.print("임의의 연도 입력 : ");
		a = Integer.parseInt(br.readLine());

		// 400의 배수인가? : 그렇다면 윤년 : (100의 배수인가 ? 맞다면 평년 : (4의 배수인가 ? 맞으면 윤년 : 아니면 평년));
		
		//strResult = ( a % 400 == 0)  ? "윤년" :  ( a % 100 == 0) ? : "평년" :  ((a % 4 == 0 ? "윤년" : "평년")); 
		//strResult = ( a % 400 == 0 && a % 4 == 0) ? "윤년" : ( a % 100 !=0 && a % 4 == 0  ) ? "평년" : ()
		strResult = ( a % 4 == 0 && a % 100 !=0) ? "평년 " : ( a % 4 == 0 && a % 400 == 0) ? "윤년" : "평년";  //제대로 다시 정리해보기!

		//결과 출력

		System.out.println( a + " → " + strResult);
		
		*/

		// 수업하며 풀어볼 내용 ----------------------------------------------------------------------------------------------------------
		
		int year;					//사용자가 입력한 연도를 담아낼 변수
		String strResult;			//윤년인지 평년인지 판별 결과를 담아낼 변수

		System.out.print("임의의 연도 입력 : ");
		year = Integer.parseInt(br.readLine());

		//연도가 4의 배수				연도가 100의 배수				연도가 400의 배수
		// year%4==0					year%100!=0						year%400==0


		// → year%4==0 이면서 year%100!=0 또는 year%400==0
		// → year%4==0 && year%100!=0 || year%400==0

		strResult = year%4==0 && year%100!=0 || year%400==0 ? "윤년" : "평년";

		System.out.printf("%d년 → %s\n" ,year,strResult);
			
		

		//--------------------------------------------------------------------------------------------------------------------------------
	}

}

//실행결과 
/*
임의의 연도 입력 : 2000
2000년 → 윤년
계속하려면 아무 키나 누르십시오 . . .

임의의 연도 입력 : 2012
2012년 → 윤년
계속하려면 아무 키나 누르십시오 . . .

임의의 연도 입력 : 2023
2023년 → 평년
계속하려면 아무 키나 누르십시오 . . .

*/