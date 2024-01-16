/*========================================
  ■■■ 정렬(sort) 알고리즘 ■■■
=========================================*/

/*
○ 정렬
	: 데이터를 특정한 규칙(기준)에 맞게 순서대로 나열(오름차순, 내림차순)

○ 정렬의 목적
	: 데이터 처리 과정의 편의성이나 가독성을 높이기 위한
	  → 보기 좋게... 찾기 좋게... 검색이 편하게.. 

○ 정렬의 특징
	: 부하가 되게 심하다!!	, 정렬 종류가 많은 이유는 부하를 줄이기 위해 여러가지 방법을 고안했기 때문에.

○ 정렬의 종류
	: 선택 정렬, 삽입 정렬, 버블 정렬, 힙 정렬, 퀵 정렬, 쉘 정렬, ... 
*/

// 버블 정렬(거품 정렬 , Bobble Sort)

// 실행 예 
// Source Data : 52 42 12 62 60
// Sorted Data : 12 42 52 60 62


public class Test108
{
	public static void main(String[] args)
	{
		int[] a = {52, 42, 12, 62, 60};
		/*
		42, 52, 12, 62, 60
		==  --

		42, 12, 52, 62, 60
		    ==  --
		
		42, 12, 52, 62, 60
		        ==  --	
				
		42, 12, 52, 60, 62
		            ==  --	
		--------------------------------------- 1회전 종료  (가장 오른쪽에 있는 수가 확정 → 오른쪽 끝은 안가도 됨)

		12, 42, 52, 60, 62
		==  --	

		12, 42, 52, 60, 62
		    ==  --	

		12, 42, 52, 60, 62
		        ==  --	

		------------------------------------  2회전 종료

		12, 42, 52, 60, 62
		==  --	

		12, 42, 52, 60, 62
		    ==  --	

		------------------------------------  3회전 종료

		12, 42, 52, 60, 62
		==  --	

		------------------------------------- 4회전 종료
		*/
		/*
		int i,j;
		System.out.print("source Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();

		// 정렬

		for (i=1; i<a.length; i++)
		{
			for (j=0; j<a.length-i; j++)
			{
				if (a[j] > a[j+1])
				{
					a[j]   = a[j]  ^ a[j+1];
					a[j+1] = a[j+1]^ a[j];
					a[j]   = a[j]  ^ a[j+1];
				}
				//테스트
				//System.out.print(" j: " + j);
				for (int n : a )
				{
					System.out.printf("%3d" , n);
				}
				System.out.println();
			}

			System.out.println("-----------------------------");
		}
		
		

		// 전체 출력
		
		System.out.print("sorted Data : ");
		for (int n : a)
			System.out.print(n + " ");
		System.out.println();
	*/

	//------------------------------------------------------------------------

		int i,j;

		System.out.print("source Data : ");
		for (int n : a )
			System.out.print(n + " ");
		System.out.println();

		// 정렬
		// → 버블 정렬 (Bubble sort)
		for ( i=1; i<a.length; i++)				// 웅~~~	i → 뒤에서 비교대상을 하나씩 줄여주는 역할	
		{											//				 1	  2	  3  4								
			for ( j=0; j<a.length -i ; j++)		// 쑝쑝쑝	j → 비교기준 인덱스
			{										//				 0123 012 01 0
				//if (a[j] < a[j+1]))				// 내림차순
				if (a[j] > a[j+1])					// 오름차순
				{
					// 자리 바꾸기
					a[j] = a[j]^a[j+1];
					a[j+1] = a[j+1]^a[j];
					a[j] = a[j]^a[j+1];

				}
			}
		}
		System.out.print("sorted Data : ");
		for (int n : a )
			System.out.print(n + " ");
		System.out.println();

	}
}

//실행결과
/*

source Data : 52 42 12 62 60
sorted Data : 12 42 52 60 62
계속하려면 아무 키나 누르십시오 . . .

*/