/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - 반복문(while문) 실습 및 관찰 
  ==========================================*/

  // 사용자로부터 임의의 두 정수를 입력받아
  // 입력받은 두 정수중
  // 작은 수 부터 큰 수까지의 합을 구하여
  // 결과를 출력하는 프로그램을 구현한다.
  
  // 실행 예)
  // 첫번째 정수 입력 : 100
  // 두번째 정수 입력 : 200
  //  >> 100 ~ 200 까지의 합 : xxxx 
  // 계속하려면 아무키나 누르세요

  // 첫번째 정수 입력 : 1000
  // 두번째 정수 입력 : 2
  //  >> 2 ~ 1000 까지의 합 : xxxxx
  // 계속하려면 아무키나 누르세요

  
  // 첫번째 정수 입력 : 10
  // 두번째 정수 입력 : 10
  //  >> 10 ~ 10 까지의 합 : 10
  // 계속하려면 아무키나 누르세요

  import java.io.BufferedReader;
  import java.io.InputStreamReader;
  import java.io.IOException;

public class Test051
{
	public static void main(String[] args) throws IOException
	{	
		//주요 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		int num1 , num2;				//사용자가 입력한 정수
		int n=0;
		int sum=0;						//누적합을 담을 변수

		//사용자로부터 값을 받기
		System.out.print("첫번째 정수 입력 : ");
		num1 = Integer.parseInt(br.readLine());
		System.out.print("두번째 정수 입력 : ");
		num2 = Integer.parseInt(br.readLine());

		// 테스트
		//System.out.println("입력받은 값 확인 : " + num1 + " " + num2);

		// 생각해볼 점 
		// 누적합으로 진행할 것 
		// 큰수와 작은 수를 정렬하는 방법을 생각해볼것!
		// ↑수 두개를 비교해보기

		if (num1>num2)				//num2가 num1보다 크거나 같을 경우
		{
			num1= num1^num2;
			num2= num2^num1;
			num1= num1^num2;

		}
	

		//테스트 서로 두값이 잘 바뀌는지 확인
		//
		System.out.printf("\n 현재 num1의 값 : %d, num2의 값 : %d",num1,num2 );

		while (n<=num2)
		{

				sum +=n;
				
				n++;
		
		}

		System.out.printf("\n%d부터 %d까지의 합 : %d\n" ,num1,num2, sum);
	
		

		//----------------------------------------------------------------------------------
		/*

		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		
		int n;
		int su1,su2;				//첫 번째, 두 번째 사용자 입력 값을 담은 변수
		int result=0;


		//연산 및 처리 
		System.out.print("첫 번째 정수 입력 : ");
		su1 = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력 : ");
		su2 = Integer.parseInt(br.readLine());

		if (su1 > su2)
		{	
			//자리바꿈
			su1= su1^su2;
			su2= su2^su1;
			su1= su1^su2;
		}

		// 반복 연산 수행
		// 반복 연산을 수행하기 전에 
		// 작은 수를 따로 저장하여 루프 변수로 활용한다.
		// (결과 출력 과정에서 입력받은 작은 수가 필요한데...)
		// 그 수를 반복 과정에서 사용하게 되면..
		// 원래 처음 입력된 값을 확인 할 수 없기때문에..

		n = su1;
		while (n<=su2)
		{
			result +=n;
			n++;
		}
		//결과 출력
		System.out.printf("%d ~ %d 까지의 합 : %d\n", su1, su2, result);
		*/
	}
}