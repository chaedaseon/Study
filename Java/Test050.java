/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - 반복문 실습 및 관찰 
  ==========================================*/

// 사용자로부터 임의의 정수를 입력받아
// 입력받은 정수가 소수인지 아닌지를 판별하여
// 결과를 출력하는 프로그램을 구현한다.

// ※ 소수 : 1 또는 자기 자신의 값 이외에 어떤 수로도 
//			 나누어 떨어지지 않는 수
//			 단, 1은 소수 아님

// 실행 예)
// 임의의 정수 : 10 
// 10 → 소수아님
// 계속하려면 아무키나....

// 임의의 정수 : 10 
// 11 → 소수
// 계속하려면 아무키나...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test050
{
	public static void main(String[] args) throws IOException
	{
		// 함께 정리하기 전에 스스로 풀어본거 ! ---------------------------------------------------------------------------
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int n;	// 입력받은거
		int x=2;// 나눌 수 2부터 시작이고
		String res = "오류가 발생합니다.";
		
		//사용자에게 값 입력 받기
		System.out.print("임의의 정수 : ");
		n = Integer.parseInt(br.readLine());


		//연산 및 처리

		// 1. 임의의 정수를 임의의 정수 값 만큼 나눌때까지 반복하기 n/1 n/2 n/3 n/4 … n/n;
		// 2. 1인지 아닌지 물어보기
		
		while (n>x)
		{
			if (n==1)
			{
				System.out.println("소수가 아님.");
				return;
			}

			else{ 
						
					while (n>x)
					{
						if (n%x==0)
						{
							System.out.println("소수가 아님");
							x++;
						}

						else 
						{
							System.out.println("소수입니다."); 
							return;
						}
					}
				
			}
		}
		*/


		// 수업을 듣고 스스로 풀어본거 (boolean 사용 안해보고 풀어보기)---------------------------------
		
		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int n;				//사용자의 입력 값을 담아낼 변수
		int x=2;			//입력 값을 대상으로 나눗셈 연산을 수행할 변수

		//사용자에게 임의의 정수 값 받기
		System.out.print("임의의 정수 입력: ");
		n = Integer.parseInt(br.readLine());

		//반복문 사용

		String res= "소수이다.";

		if (n == 1)
		{
		System.out.printf("%d → 소수가 아님\n" , n);
		}
		
		while (x<n)
		{
			if (n%x==0)
			{
				System.out.printf("%d → 소수가 아님\n" , n);
				break;
			}
			else if (n%x!=0)
			{
				System.out.printf("%d → 소수임\n",n);
				break;
			}

			x++;
		}
	




		//-----------------------------------------------------------------------------------------------

		//주요 변수 선언 
		/*
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int num;						//사용자의 입력값을 담아낼 변수
		int n= 2;						//입력 값을 대상으로 나눗셈 연산을 수행할 변수
										//2부터 시작해서 1씩 증가
										// ex) 입력값 27 → 2 3 4 5 6 7 … 26

		//연산 및 처리
		System.out.print("임의의 정수 입력 : ");
		num = Integer.parseInt(br.readLine());

		// 어떤 값을 입력받은 상태인지 알 수 없지만 
		// 이 입력값을 소수로 간주한다. 
		// String result = "소수다";
		boolean flag = true;			//-- num(사용자 입력값)은 소수일 것이다~~  <자주 사용함!!>


		while (n<num)					//num값은 못들어가게 막아둠
		{

			//테스트					// 자주자주 테스트 해보기!! Tip 반복문이 제대로 돌아가는지 확인!! 
			//System.out.println("반복문 수행 → n : " + n);

			//확인 연산
			// -- n으로 num을 나누어서 떨어지는지 확인 → 나머지가 0인지 확인
			if (num%n==0)				// 즉, 나누어 떨어지는 상황
			{
				// 앗~! 난 너를 소수라 생각 했는데..ㅠㅠ
				// 넌 ....소수가 아니었어 흑흑흑... ㅠㅠ
				flag = false;

				//최종적으로 넌 소수가 아니야
				//System.out.printf ("%d → 소수 아님\n", num);
				break;					// 멈춘다 (+그리고 빠져나간다.)
										// 애를 포함하고 있는 가장 가까운 반복문을 빠져나감 여기서는 (while)

			}
			//else if (num!=1)			//이런식으로도 사용 가능!
			//{

			//최종적으로 넌 소수
			//System.out.printf ("%d → 소수\n", num);
			//break;


			n++;

		}

		//테스트
		//System.out.println("flag :" + flag);
		

		//결과 출력
		//(최종 결과를 출력하기전에 추가 확인 → 1인지 아닌지 추가 검토)
		if (flag && num!=1)
		{
			//최종적으로 넌 소수
			System.out.printf ("%d → 소수\n", num);
		}
		else 
		{
			//최종적으로 넌 소수가 아니야
			System.out.printf ("%d → 소수 아님\n", num);
		}
		*/
	}
}

//실행결과
/*
임의의 정수 입력 : 991
991 → 소수
계속하려면 아무 키나 누르십시오 . . .

임의의 정수 입력 : 50
50 → 소수 아님
계속하려면 아무 키나 누르십시오 . . .
*/