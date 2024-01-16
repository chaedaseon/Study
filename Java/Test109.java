/*========================================
  ■■■ 정렬(sort) 알고리즘 ■■■
=========================================*/

// 향상된 버블 정렬(Bobble Sort)

// ※ 앞에서 본 Selection Sort(Test107.java)나 Bubble Sort(Test108.java)의 성능은 같다.
//    (→  성능에 대한 추정 근거 : 반복문을 수행한 횟수)
//	  하지만, 향상된 Bubble Sort는 대상 데이터의 구조에 따라서
//    일반 Bubble Sort 나 Selection Sort에 비해 성능이 좋을 수 있다.

// 원본 데이터 : 61 15 20 22 30
//			   : 15 20 22 30 61				- 1회전 (스왑 발생 → true) → 다음 회전 진행 ○
//			   : 15 20 22 30 61				- 2회전 (스왑 발생 → false) → 다음 회전 진행 X

// ==>> 1회전 수행... 2회전 수행... 을 해 보았더니 
//		2회전에서 스왑(자리바꿈)이 전혀 일어나지 않았기 때문에
//      불필요한 추가 연산(더이상의 회전)은 무의미한 것으로 판단하여
//      수행하지 않는다. 

public class Test109
{
	public static void main(String[] args)
	{
		int[] a = {10, 50, 20, 30, 40};
		/*
		10, 50, 20, 30, 40
		==  --

		10, 20, 50, 30, 40
		    ==  --

		10, 20, 30, 50, 40
		        ==  --

		10, 20, 30, 40, 50
					==  --
		---------------------------------------------------- 1회전 → 스왑 발생

		10, 20, 30, 40, 50
		==  --
		
		10, 20, 30, 40, 50
			==  --
		
		10, 20, 30, 40, 50
				==  --
		---------------------------------------------------- 2회전 → 스왑 발생하지 않음
				
				X

				X
		
		---------------------------------------------------- 3회전 → 스왑 발생하지 않음
			
				X

		---------------------------------------------------- 4회전 → 스왑 발생하지 않음
		*/
		
		/*
		int i,j;
		boolean bl= false;							// 스왑이 일어났는지 아닌지 판별하는 변수
		
		// 초기 값 출력
		System.out.print("Source Data : " );
		for ( int n : a )
			System.out.print(n + " ");
		System.out.println();

		// 정렬

		for (i=1; i<a.length; i++)
		{
			for (j=0; j<a.length - i ; j++)
			{
				if (a[j] > a[j+1])
				{
					a[j] = a[j]^a[j+1];
					a[j+1] = a[j+1]^a[j];
					a[j] = a[j]^a[j+1];
					bl= true;							// 스왑이 일어날 경우 트루 
				}

				//테스트
				for (int n : a )
				{
					System.out.printf("%3d" , n);
				}
				System.out.println();
			}
			System.out.println("-----------------------------");
			
			if (bl == false)						// false 경우 break;
			{
				break;
			}
			bl = false;								// bl 값을 다시 한번 더  false 로 초기화
				
		}
	
		// 결과 출력
		System.out.print("Sorted Data : ");
		for(int n : a)
			System.out.print(n + " ");
		System.out.println();
		*/
	

		System.out.print("Source Data : ");
		for (int n : a )
			System.out.print( n + " ");
		System.out.println();

		// 정렬
		// 향상된 Bubble sort
		boolean flag;
		int pass = 0;

		do
		{
			flag = false;				// -- 이번 회전에서 자리바꿈이 발생하지 않을 것이다. 
			pass++;

			for (int i=0; i<a.length-pass; i++)
			{
				// 테스트
				//System.out.println("쑝");
				if (a[i] > a[i+1])
				{
					a[i] = a[i]^a[i+1];
					a[i+1] = a[i+1]^a[i];
					a[i] = a[i]^a[i+1];
					
					flag = true;
					// -- 단 한번이라도 스왑이(자리바꿈)이 발생하게 되면
					//	  flag 변수는 true로 변경 ~~!!
				}
			}
		}
		while (flag);
		// -- flag변수가 false 라는 것은
		//    회전이 구분적으로 발생하는 동안 스왑이 일어나지 않은 경우로
		//    더 이상 반복문 수행은 무의미한 것으로 판단 가능~~!!
	
		System.out.print("Sorted Data : ");
		for (int n : a )
			System.out.print( n + " ");
		System.out.println();

	}
}

//실행결과
/*

Source Data : 10 50 20 30 40
Sorted Data : 10 20 30 40 50
계속하려면 아무 키나 누르십시오 . . .

*/