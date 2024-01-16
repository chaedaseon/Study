/*======================================
  ■■■ 자바의 기본 프로그래밍 ■■■
=======================================*/

// ○ 퀴즈 
//	  삼각형의 밑변의 길이와 높이를 사용자로부터 입력받아
//	  이 삼각형의 넓이를 구하는 프로그램을 구현한다.

// 실행 예)
// ■ 삼각형 넓이 구하는 프로그램 ■
// - 삼각형의 밑변 입력 : 
// - 삼각형의 높이 입력 :
// 
// >> 밑변이 5, 높이가 3인 삼각형의 넓이 : XXX 
// 계속하려면 아무키나 누르세요...

// ※ 문제 인식 및 분석
//    삼각형의 넓이 = 밑변 * 높이 / 2
//	  사용자로부터 데이터 입력받아 처리 → BufferedReader 활용
//    BufferedReader 를 여러개 사용?? 한개 사용?
//									  -----------!

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


public class Test013
{
	public static void main(String[] args) throws IOException 
	{
		//내가 풀이한 코드 -------------------------------------------------------------------
		/*
		// 키보드 장착 (생성)
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		//주요 변수 선언 
		int r;				//삼각형의 밑변
		int h;				//삼각형의 높이
		double a;			    //삼각형의 넓이

		//연산 및 처리 
		System.out.println("■ 삼각형 넓이 구하는 프로그램 ■");
		//①사용자에게 입력을 알려주고 값을 받아옴
		System.out.print("삼각형의 밑변 입력 : ");
		r = Integer.parseInt(br.readLine());
		System.out.print("삼각형의 높이 입력 : " );
		h = Integer.parseInt(br.readLine());

		// ② 계산하기
		a = (double)r * h /2;					//형 변환 하기~~~!!!!!!!

		//결과 출력

		System.out.printf(" \n>> 밑변이 %d , 높이가 %d 인 삼각형의 넓이 : %.2f\n" , r, h, a);
	
		*/
		// 실행 결과
		/*
		■ 삼각형 넓이 구하는 프로그램 ■
		삼각형의 밑변 입력 : 40
		삼각형의 높이 입력 : 5

		>> 밑변이 40, 높이가 5 인 삼각형의 넓이 : 100.000000
		계속하려면 아무 키나 누르십시오 . . .
		*/
		//-------------------------------------------------------------------------------------

		// 짝꿍이 풀이한 코드 -----------------------------------------------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int a, b;         // 밑변 a, 높이 b
		double c;         // 넓이 c

      
		System.out.print("삼각형의 밑변 입력 : ");
      
		 a = Integer.parseInt(br.readLine());



		 System.out.print("삼각형의 높이 입력 : ");

		 b = Integer.parseInt(br.readLine());

		 c = (double)a * b / 2;


		System.out.printf("밑변이 %d, 높이가 %d인 삼각형의 넓이 : %.2f\n", a, b, c);
		*/

		//실행 결과
		/*
		삼각형의 밑변 입력 : 44
		삼각형의 높이 입력 : 4
		밑변이 44, 높이가 4인 삼각형의 넓이 : 88.00
		계속하려면 아무 키나 누르십시오 . . .
		*/
		//-----------------------------------------------------------------------------------------
		
		// 수업하며 함께 풀어 본 내용 -------------------------------------------------------------
		
		// 주요 변수 선언

		//BufferedReader 인스턴스 생성
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		// 밑변, 높이 
		int underLength, height;	//밑변, 높이
		double area;				//넓이			check~~~ 
		
		//연산 및 처리
		// ① 사용자에게 안내 메세지 출력
		System.out.println("■ 삼각형 넓이 구하는 프로그램 ■");
		System.out.print("- 삼각형의 밑변 입력 : ");

		// ② 사용자가 입력한 데이터를(문자열) 정수형태로 변환 한 후 
		//	  변수 underLength에 담아내기 
		underLength = Integer.parseInt(br.readLine());

		// ③ 사용자에게 안내 메세지 출력
		System.out.print("- 삼각형의 높이 입력 : " );

		// ④ 사용자가 입력한 데이터를(문자열) 정수형태로 변환 한 후 
		//	  변수 height 에 담아내기
		height = Integer.parseInt(br.readLine());

		// ⑤ 삼각형의 넓이 구하는 연산 처리 
		area = underLength * height / 2;
		//		 정수형		 정수형   정수형
		//	  ---------------------	  ------
		//				정수형		/ 정수형 → 정수 기반 연산
		//										(즉, 몫을 취하고 나머지는 버림)
		area = underLength * height / 2.0;   //check~~~!!!
		//		 정수형		 정수형   실수형 → 실수 기반 연산

		// ※ 실수 자료형이 결과값으로 나오는 과정에서
		//	  실수 기반의 연산이 필요한 상황이다.
		//    정수형은 『2』가 아닌. 『2.0』으로 나눗셈 연산을 수행하게 되면
		//	  이 연산은 실수 기반으로 처리된다.

		//	  area = (double)underLength * height / 2;
		//	  area = (double)underLength * (double)height / 2;
		//	  area = (double)(underLength * height) / 2;
		//    area = (double)(underLength * height / 2);   --(X) 실수 기반 연산이 아닌 정수 기반 연산으로 진행되고 그 몫이 실수가 된다.

		// 결과 출력
		System.out.println();			//개행
		//System.out.print();			//에러 발생 (컴파일 에러)


		System.out.printf(" >> 밑변이 %d, 높이가 %d 인 삼각형의 넓이 : %.2f\n" , underLength, height, area);
			

		//-----------------------------------------------------------------------------------------


	}
}

//실행 결과
/*
■ 삼각형 넓이 구하는 프로그램 ■
- 삼각형의 밑변 입력 : 5
- 삼각형의 높이 입력 : 3

 >> 밑변이 5, 높이가 3 인 삼각형의 넓이 : 7.50
계속하려면 아무 키나 누르십시오 . . .
*/