/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - 반복문(while문) 실습 및 관찰 
  ==========================================*/

// ○  과제
//		사용자로부터 임의의 정수를 입력 받아
//		1부터 입력받은 그 정수까지의
//		전체 합과 짝수의 합과. 홀수의 합을
//		각각 결과값으로 연산하여 출력하는 프로그램을 구현한다.

//	실행 예) 
//	임의의 정수 입력 : 396
//	>> 1 ~ 396까지의 정수의 합 : xxxxxx
//	>> 1 ~ 396까지의 짝수의 합 : xxxxxx
//	>> 1 ~ 396까지의 홀수의 합 : xxxxxx
// 계속하려면 아무 키나 누르세요.....

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test052
{
	public static void main(String[] args) throws IOException
	{
		
		 BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		 int n=1;									// 루프 변수
		 int num;									// 사용자가 입력하는 임의의 정수를 담을 변수
		 int sum=0;									// 사용자로부터 입력 받은 정수의 총합
		 int even=0;								// 짝수의 합
		 int odd=0;									// 홀수의 합

		 //사용자로부터 입력 값을 받기
		 System.out.print("임의의 정수 입력 : ");
		 num = Integer.parseInt(br.readLine());

		 // 사용자가 입력한 정수가 잘 나오는지 테스트!
		 //System.out.println("정수의 값 : " + num);  // 테스트 결과 잘 나옴!
									

		while (n<=num)								
		{
			if (n%2==0)								  // n의 값이 짝수 일 경우
			{
				even +=n;					
			}
			else if (n%2!=0)						  // n의 값이 홀수 일 경우
			{
				odd +=n;
			}
			else 
			{
				System.out.println("오류 발생");	  // 미처 예상하지 못한 오류가 발생했을 경우	
				return;
			}
			sum +=n;								  //정수의 합
			n++;
		}

		
		System.out.printf("1부터 %d까지의 정수의 합 : %d\n", num, sum);		//1부터 임의의 정수까지의 정수의 합 출력 
		System.out.printf("1부터 %d까지의 짝수의 합 : %d\n", num, even);	//1부터 임의의 정수까지의 짝수의 합 출력 
		System.out.printf("1부터 %d까지의 홀수의 합 : %d\n", num, odd);		//1부터 임의의 정수까지의 홀수의 합 출력 
	

	}
}

//실행결과 2

/*

임의의 정수 입력 : 100
정수의 값 : 100
1부터 100까지의 정수의 합 : 5050
1부터 100까지의 짝수의 합 : 2550
1부터 100까지의 홀수의 합 : 2500
계속하려면 아무 키나 누르십시오 . . .

*/