/*========================================
  ■■■ 정렬(sort) 알고리즘 ■■■
=========================================*/

// ○ 과제
//    사용자로부터 여러 학생의 성적 데이터를 입력 받아
//	  점수가 높은 학생부터 낮은 순으로 등수를 부여하여 
//	  결과를 출력하는 프로그램을 구현한다.
//	  단, 배열과 정렬 알고리즘을 활용하여 작성할 수 있도록 한다.

// 실행 예) 
// 인원 수 입력 : 5
// 이름 점수 입력 (1, 공백 구분) : 임하성 90
// 이름 점수 입력 (2, 공백 구분) : 정한울 80 
// 이름 점수 입력 (3, 공백 구분) : 정현욱 85
// 이름 점수 입력 (4, 공백 구분) : 채다선 75
// 이름 점수 입력 (5, 공백 구분) : 최혜인 95

/*
-------------------
1등 최혜인 95
2등 임하성 90
3등 정현욱 85
4등 정한울 80
5등 채다선 75
--------------------
*/

import java.util.Scanner;

public class Test110
{
	public static void main(String[] args)
	{
		Scanner sc = new Scanner(System.in);
		int num;									// 학생 인원 수
		String str;									// 이름을 저장할 변수
		

		// 사용자로부터 인원 수 입력 받기
		System.out.print("인원 수 입력 : ");
		num = sc.nextInt();
		
		// 배열 구성
		int[] arr = new int[num];					// int 형 배열 선언 (점수)
		String[] name = new String[num];			// String 형 배열 선언 (이름) 
		
		// 사용자로부터 점수 입력 받기
		for (int i = 0; i<arr.length; i++)
		{
			System.out.printf(" 이름 점수 입력 (%d, 공백 구분) : " , i+1);
			name[i] = sc.next();					// 이름 받기
			arr[i] = sc.nextInt();					// 점수 받기
		}	
	
		// 테스트 제대로 출력 되는 거 확인 완료
		/*
		for (int i= 0 ; i<arr.length; i++)
		{
			System.out.println(name[i] + " " + arr[i]);
		}
		*/
		
		// 스트링 변수 하나 더 선언 -> 값을 저장할 매체 
		//				   → name [i] = String A 
		//				   → name[i] = name[i+1] 
		//				   → name[i+1] = String A

		// 점수 비교하고 자리 교환하기
		for (int i=1; i<arr.length; i++)
		{		
			for (int j=0 ; j<arr.length-i; j++)
			{

				if (arr[j] < arr[j+1])						
				{
					// 점수 
					arr[j] = arr[j]^arr[j+1];
					arr[j+1] = arr[j+1]^arr[j];
					arr[j] = arr[j]^arr[j+1];
					
					// 이름 				
					str = name[j];
					name[j] = name[j+1];
					name[j+1] = str;
				}		

			}
			
		}
		

		// 결과 출력	
		System.out.println("---------------------------");
		for (int i= 0 ; i<arr.length; i++)
		{																	// 1등 최혜인 95
			System.out.printf("%d등 %s %d \n" , i+1, name[i], arr[i]);		// ↑예시와 같이 출력
		}
		System.out.println("---------------------------");
		
		

	}
}

//실행결과
/*

인원 수 입력 : 3
 이름 점수 입력 (1, 공백 구분) : 김민지 95
 이름 점수 입력 (2, 공백 구분) : 채다선 98
 이름 점수 입력 (3, 공백 구분) : 노은하 100
---------------------------
1등 노은하 100
2등 채다선 98
3등 김민지 95
---------------------------
계속하려면 아무 키나 누르십시오 . . .

*/