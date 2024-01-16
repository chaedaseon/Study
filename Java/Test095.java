/*============================================
	■■■ 배열 ■■■
  → 배열과 난수 처리(※ Random 클래스 활용)
  ===========================================*/

  //사용자로부터 임의의 정수를 입력받아
  // 그 수 만큼 난수(1~100)를 발생시켜 배열에 담고
  // 배열에 담겨있는 데이터들 중 
  // 가장 큰 값과 가장 작은 값을 선택하여 
  // 결과를 출력하는 프로그램을 구현한다.

  // 실행 예)
  // 발생시킬 난수의 갯수 입력 : 10
  // (50 7 24 81 72 45 61 38 1 99  → 무작위로 발생한 정수들...)
  // (intp[ arr = {50, 7, 24, 81, 72, 45, 61, 38, 1, 99 }→ 배열에 담아내기(배열구성)
  // 가장 큰 값 : 99, 가장 작은 값 : 1
  // 계속하려면 아무키나 누르세요....

import java.util.Scanner;
import java.util.Random;

public class Test095
{
	public static void main(String[] args)
	{	
		// Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		// 주요 변수 선언 
		int size;								//사용자의 입력 값을 담아낼 변수

		// 안내메세지 출력
		System.out.print("발생시킬 난수의 갯수 입력 : ");
		size = sc.nextInt();

		// 입력받은 size 만큼의 배열방 만들기(배열 길이)
		// (배열 선언 및 메모리 할당)
		int[] arr = new int[size];

		// 무작위 정수(난수)를 발생시키기 위헤서는 
		// 난수 발생 전용 객체가 필요하다.
		// → 『java.util.Random』
		Random rd = new Random();
		// -- Random 인스턴스 생성 

		// ※ Random 클래스의 『nextInt』 메소드
		//	  0 - 매개변수로 넘겨받은 정수 n-1까지의 수 중
		//    무작위 정수(난수) 1개를 발생시킨다. 

		//	  ex) rd.nextInt(10);		//-- 0 ~ 9 중 난수 1개 발생

		//테스트(확인)
		//System.out.println("발생한 난수 : " + rd.nextInt(10));
		// -- 0 ~ 9까지의 범위 내에세 무작위 정수 한개 발생~~!!
		
		// 배열 구성
		//for (int i=0; i<arr.length; i++)
		for (int i=0; i<size; i++)
		{
			//rd.nextInt(101);
			// -- 0 ~ 100 중 1개
			//rd.nextInt(100);
			// -- 0 ~ 99 중 1개

			arr[i] = rd.nextInt(100)+1;
			//		---------------
			//		     0 ~ 99;
			//		-------------------
			//			 1 ~ 100;

		}	 
		
		// 테스트 → 구성된 배열의 전체요소 출력
		for (int i=0; i<arr.length; i++)
		{
			System.out.printf("%3d" , arr[i]);
		}
		System.out.println();

		//--==>>
		/*		발생시킬 난수의 갯수 입력 : 10
				78  95  41  50  98  39  63  33  85  87
				계속하려면 아무 키나 누르십시오 . . .

				발생시킬 난수의 갯수 입력 : 5
				 83  59  26  73  61
				계속하려면 아무 키나 누르십시오 . . .
		*/	

		//--------------------------------------------------------- 여기까지 수행하면 배열 구성 완료~!!!

		// 가장 작은 값, 큰 값 출력 ~!!
		int max, min;					//최대값 , 최소값	

		max=min=arr[0];					//arr[0]의 값을 min에 대입하고
										//min의 값을 max에 대입
		for (int i=1; i<arr.length; i++)
		{
			if (max<arr[i])
				max = arr[i];
		

			//else 사용하면 안됨 독립적으로 if
			if (min>arr[i])
				min = arr[i];
		}

		//결과 출력
		System.out.printf("가장 큰 값 : %d , 가장 작은 값 : %d \n", max,min);

		//실행결과
		/*
		발생시킬 난수의 갯수 입력 : 20
		9 58  8 21 35 86 35 24 21 49 90 68 62 82 48 3 83 82 55 24			// 한번 발생한 난수가 또 발생 할 수 있다!!
		가장 큰 값 : 90 , 가장 작은 값 : 3
		계속하려면 아무 키나 누르십시오 . . .

		*/
		
						



		/*
		for (int i=0; i<arr.length; i++)
		{
			
			for (int j=1; j<arr.length; j++)
			{
				if (arr[i] < arr[j])
				{
					arr[i] = arr[j]^arr[i];
					arr[j] = arr[i]^arr[j];
					arr[i] = arr[j]^arr[i];
				}

				if (arr[i] > arr[j])
				{
					arr[i] = arr[j]^arr[i];
					arr[j] = arr[i]^arr[j];
					arr[i] = arr[j]^arr[i];
				}

			}

			
		}
	
		System.out.printf("가장 큰 값 :%3d 가장 작은 값 :%3d\n", arr[1], arr[0]);
		*/

	}
	
}

//실행 결과

/*
발생시킬 난수의 갯수 입력 : 10
 52 48 41 57 16 28 36 94 28 65
가장 큰 값 : 94 가장 작은 값 : 16
계속하려면 아무 키나 누르십시오 . . .

*/