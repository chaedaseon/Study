/*==========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  ==========================================*/
  
  // break 실습

  //다음과 같은 처리가 이루어지는 프로그램을 구현한다.
  //단, 입력받는 정수는 1~100범위 안에서만 
  //가능하도록 처리한다.

  //실행 예)
  //
  //임의의 정수 입력 :-10
  //
  //임의의 정수 입력 : 0
  //
  //임의의 정수 입력 : 2023
  // 
  // 임의의 정수 입력 : 10
  // >> 1~10까지의 합 : 55
  // 계속하시겠습니까? (Y/N) : Y
  //
  // 임의의 정수 입력 : 100
  // >> 1~10까지의 합 : 5050
  // 계속하시겠습니까? (Y/N) : N
  // 계속하려면 아무키나 누르세요 .... → 프로그램 종료

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
import java.util.Scanner;

public class Test064
{
	public static void main(String[] args) throws IOException
	{
		Scanner sc = new Scanner(System.in);
		
		/*
 
		1. 임의의 정수 입력하라고 사용자에게 출력					
		2. 입력한 값이 1~100이 아닌 경우 1번을 계속 반복한다.
		3. 입력한 값이 1~100일경우 누적합을 구한다.
		4. 사용자에게 계속 진행할건지 물어본다.
		5. 답이 y || Y일경우 1번부터 4번까지 진행
		6. 답이 n || N일경우 프로그램 종료 (break 사용)

		*/

		/*
		do
		{
			System.out.print("임의의 정수 입력 :");
			num = sc.nextInt();
			System.out.println();

		}
		while (num<=1 || 100<=num);

			if (num<n)
			{

			sum +=n;
			n++;

			}


		*/
		/*
		
			do
			{
				do
				{
				System.out.print("임의의 정수 입력 :");
				num = sc.nextInt();
				System.out.println();
				//flag = true;
				}
				while (num<=1 || 100<=num);
				
				if(n<=num)
				{
				sum +=n;
				n++;
				}
			}
			while (num == 'y' || num != 'n');

			System.out.println("n:"+num);
			
			/*if (n<=num)
			{
				if (1<=num || num<=100)
				{
					sum +=n;
				}
				else
				{
					System.out.println();
				}

				n++;
			}
		*/

		/*		
		int n=1;					//루프 변수
		int num=0;					//사용자의 값을 입력 받을 변수
		int sum=0;					//누적합을 담을 변수
		boolean flag = true;		//계속 진행할건지 물어보는 변수
		char ch;					//결과값받기

		while (flag)
		{
			do
			{
			System.out.print("임의의 정수 입력 :");
			num = sc.nextInt();
			System.out.println();
			//flag = true;
				for (n=1;n<=num ;n++ )
				{
					sum +=n;
				}

			}
			while (num<=1 || 100<=num);
			
			System.out.printf("1부터 %d까지의 합 : %d\n", num, sum);
			System.out.print("계속 하시겠습니까? : ");
			ch = (char)System.in.read();

			if (ch != 'Y' && ch != 'y')
			{
			  //flag = false;
					break;
			}
			  //if (flag == false)
		 
	    }

		
		*/

		/*
		else if (flag=false)
		{	
			System.out.println();
		}
		//System.out.printf("1부터 %d까지의 합 : %d", num, sum);
		
		*/
		// 수업하며 같이 풀어본 코드 -----------------------------------------------------------------------------

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		//check~~
		//누접합 변수의 초기값 위치~~
		int n, s, i;
		//		--n: 사용자 입력값을 담아둘 변수
		//		--s: 누적합 연산 결과를 담아낼 변수
		//		--i: 1부터 1씩 사용자의 입력값까지 증가하게 될 변수

		char ch;
		//--프로세스를 계속 진행할지 말지의 여부를 담아둘 변수

		while (true)
		{
			//무한 반복(무한 루프 )			
			do
			{
				System.out.print("\n 임의의 정수 출력 : ");
				n = Integer.parseInt(br.readLine());

			}
			while (n<1 || n>100);

			// 테스트 확인
			//System.out.println("유효한 정수 입력 완료~!!");

			//누적합 변수의 초기화 위치 check~~~!!!!!!
			s=0;
			
			for (i=1; i<=n;i++)
			{
				s+=i;					//누적합 연산
			}
			System.out.printf(" >> 1~%d까지의 합 : %d\n", n, s);
			
			System.out.print(" 계속하시겠습니까?(Y/N)? : ");	// y Y
			ch = (char)System.in.read();
			//-- 계속할지 말지에 대한 여부(의사표현)

			// 그만할래 → 빠져나감
			//if (ch== 'n' || ch=='N')  // --n또는 N입력한거 맞아???

			if (ch!= 'y' && ch!='Y')	//-- y또는 Y입력한게 아닌거 맞아????  자주 헷갈리기때문에 check~~!!!!!!! 빵과 우유인지 빵 또는 우유인지 생각해보면 쉽다!!!
			{
				//  반복문을 멈추고 빠져나갈 수 있는 코드 작성 필요
				//--즉 위와 같은 의사를 표현했다면
				//  그동안 수행했던 반복문을 멈추고 빠져나가야 한다.
				break;
				//-- 멈춘다. + (그리고 빠져나간다.) check~~!!!
			}//end if

			//엔터값(\r\n)처리
			System.in.skip(2);

		}//end while(true)
	

		//-------------------------------------------------------------------------------------------------------

	}
}
//실행결과
/*

 임의의 정수 출력 : 10
 >> 1~10까지의 합 : 55
 계속하시겠습니까?(Y/N)? : y

 임의의 정수 출력 : 100
 >> 1~100까지의 합 : 5050
 계속하시겠습니까?(Y/N)? : y

 임의의 정수 출력 : 10
 >> 1~10까지의 합 : 55
 계속하시겠습니까?(Y/N)? : y

 임의의 정수 출력 : 100
 >> 1~100까지의 합 : 5050
 계속하시겠습니까?(Y/N)? : n
계속하려면 아무 키나 누르십시오 . . .

*/