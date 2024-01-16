/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - switch문 실습 
  ==========================================*/

// 사용자로부터 1부터 3까지의 정수 중 하나를 입력 ㅏㄷ아
// 입력받은 정수만큼의 별문자(★)가 출력되는 프로그램을 작성한다.
// 단, 두가지 방법으로 구현할 수 있도록 한다.

// ① switch 문의 일반 모델을 사용하여 구현한다.		// 마음껏 편하게 하기
// ② switch 문의 기본 모델을 사용하되, 
//		break 를 딱 한번 만 사용할 수 있도록 구현한다.  // 입력 오류할때 딱 한번 사용

// 실행 예 )
// 임의의 정수 입력 (1~3): 3
// ★★★
// 계속하려면 아무키나 누르세요...

// 실행 예 )
// 임의의 정수 입력 (1~3): 1
// ★
// 계속하려면 아무키나 누르세요...

// 실행 예 )
// 임의의 정수 입력 (1~3): 7
// 입력오류~!!
// 계속하려면 아무키나 누르세요...


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test041
{
	public static void main(String[] args) throws IOException
	{
		
		//주요 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		/*int a;				//정수 입력 값
		String b;			//결과 값 반환
		
		//연산 및 처리
		System.out.print("임의의 정수 입력 (1~3) : ");
		a = Integer.parseInt(br.readLine());
		*/
		
		// switch의 일반 모델을 사용하여 구현
		/*
		switch (a)
		{

		case 1: b = "★";		break;
		case 2: b = "★★";		break;
		case 3: b = "★★★";	break;
		default: b = "입력 오류~~!!";

		}
		
		// switch의 기본 모델을 사용하여 구현 (단, break 문은 한번만 사용할 것!)  

		switch (a)
		{
		case 1: b = "★"; 	
		case 2: b = "★★"; 
		case 3:	b = "★★★"; break;
		default: b = "입력 오류~~!!"; 
		
		}
			
		System.out.printf("%s\n" , b);
		*/

		//------------------------------------------------------------------------------------------------------------------
		
		int n;				//정수 입력 값
		
		System.out.print("임의의 정수 입력 (1~3) : ");
		n = Integer.parseInt(br.readLine());
		
	
		//①
		/*
		switch (n)
		{
		case 1: System.out.println("★"); break;
		case 2: System.out.println("★★"); break;
		case 3: System.out.println("★★★"); break;
		default: System.out.println("입력 오류~~!!");
		}
		*/
		//②
		switch (n)
		{
		
		case 3: System.out.print("★"); 
		case 2: System.out.print("★");
		case 1: System.out.print("★"); break;

		default: System.out.println("입력 오류~~!!");
		}

		System.out.println();
		//------------------------------------------------------------------------------------------------------------------
	}
}

//실행 결과

/*
임의의 정수 입력 (1~3) : 1
★
계속하려면 아무 키나 누르십시오 . . .
*/

/*
임의의 정수 입력 (1~3) : 2
★★
계속하려면 아무 키나 누르십시오 . . .
*/

/*
임의의 정수 입력 (1~3) : 3
★★★
계속하려면 아무 키나 누르십시오 . . .
*/

/*
임의의 정수 입력 (1~3) : 4
입력 오류~~!!

계속하려면 아무 키나 누르십시오 . . .
*/