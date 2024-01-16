/*========================
	■■■ 배열 ■■■
  → 배열의 배열
  =======================*/

// 배열의 배열(다차원배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
/*
2,4
1,4

1 2 3 4 5
5 1 2 3 4
4 5 1 2 3
3 4 5 1 2
2 3 4 5 1
//계속 하려면 아무키나 누르세요
*/


/*
1    2   3   4   5

앞이 i 뒤에가 j 
i는 하나씩 증가

0:0 0:1 0:2 0:3 0:4 
1:1 1:2 1:3 1:4 1:0 
2:2 2:3 2:4 2:0 2:1
3:3 3:4 3:0 3:1 3:2
4:4 4:0 4:1 4:2 4:3

*/


public class Test088
{
	public static void main(String[] args)
	{
		/*
		//배열의 배열 구성
		int arr[][] = new int[5][5];
		int n=1;
		
			for (int i=0; i<arr.length; i++)
			{	
				for (int j=0; j<arr[i].length; j++)
				{
					if (n>5)
					{
					  n = 1;	
					}
					arr[i][j] = n;
					n++;
				}
				n--;
				
			}
		

		//최종 결과 출력
		
		for (int i=0; i<arr.length; i++)
		{
			for (int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%2d",arr[i][j]);
			}

			System.out.println();
		}
		*/
		
		// 스스로 도전.........................ㅜㅜ.....
		
		int arr[][] = new int[5][5];
		int a;
		

		for (int i=0; i<arr.length; i++)
		{	
			int n=1;

			for (int j=0; j<arr[i].length; j++)
			{
				if (i==j)					//1 넣는 거
				{
					arr[i][j] = n;
					n++;
				}
				if (j>i)					//1이후 값
				{
					arr[i][j] = n;
					n++;
				}

				if
				{
					a = arr[i-1][4];
					for (j=0; j<i; j++)
					{
						arr[i][j] = a;
						a++;
					}	
				}

			}
		}

		//최종 결과 출력

		for (int i=0; i<arr.length; i++)
		{
			for (int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%2d",arr[i][j]);
			}

			System.out.println();
		}
		

		//------------------------------------------------------------------------------------------------
		/*
		int arr[][] = new int[5][5];
		int n;
		int j=0;
	
		//배열의 배열 선언 및 메모리 할당 
		for (int i=0; i<arr.length; i++)
		{
			for (n=1, j=i; n<=5; n++)
			{	
				//테스트(확인)
				//System.out.print(i+ "," +j +"[" + n + "]");

				arr[i][j]=n;
				j++;

				if (j==5)
				{
					j=0;
				}
			}
		
		}
		
		
		//배열 전체 요소 출력
		for (int i=0; i<arr.length; i++)
		{
			for (j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3d" , arr[i][j]);
			}
			System.out.println(); 
		}
		*/


	}

}

//실행결과
/*
 1 2 3 4 5
 5 1 2 3 4
 4 5 1 2 3
 3 4 5 1 2
 2 3 4 5 1
계속하려면 아무 키나 누르십시오 . . .



*/