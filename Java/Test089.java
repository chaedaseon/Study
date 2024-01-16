/*========================
	■■■ 배열 ■■■
  → 배열의 배열
  =======================*/

// 배열의 배열(다차원배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
/*

1 8  9 16 17
2 7 10 15 18
3 6 11 14 19
4 5 12 13 20

0,0 0,1 0,2 0,3 0,4				3 2 1 0 0 1 2 3 3 1 2 3
1,0 1,1 1,2 1,3 1,4
2,0 2,1 2,2 2,3 2,4
3,0 3,1 3,2 3,3 3,4

//계속 하려면 아무키나 누르세요
*/


public class Test089
{
	public static void main(String[] args)
	{
		/*	
		//배열의 배열 선언 및 메모리 할당
		int[][] arr = new int[4][5];
		int n=1;
		
	
		for (int j=0; j<5; j++)
		{
			if (j%2==0)
			{
				for (int i=0; i<arr.length; i++)
				{
					arr[i][j] = n;
					n++;
				}
			}

			else if (j%2!=0)
			{
				for (int i=3; i>-1; i--)
				{
					arr[i][j]=n;
					n++;

				}
			}
		}
		*/
		/*
		for (int j=0; j<arr[0].length; j++)
		{

			for (int i=0; i<arr.length; i++)
			{
				if (i%2==0)
				{
					arr[i][j] = n;
					n++;
				}

				if (i%2!=0)
				{
					arr[3-i][j] = n;
					n++;
				}
			}
			
						
		}


		//배열 전체 요소 출력
		for (int i=0; i<arr.length; i++)
		{
			for (int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3d" , arr[i][j]);
			}
			System.out.println();
			
		}
		*/
	//--- 수업 -------------------------------------------------------------------------------------------------------------	
	
		int[][] arr = new int[4][5];
		
		int n=0;

		for (int i=0; i<5; i++)			//웅~~  0 1 2 3 4
		{
			for(int j=0; j<4; j++)		//쑝쑝쑝 0 1 2 3
			{
				n++;
				if (i%2==0)
					arr[j][i] = n;
				
				else
					arr[3-j][i] = n;
			}
			
		}


		//배열 전체 요소 출력
		for (int i=0; i<arr.length; i++)
		{
			for (int j=0; j<arr[i].length; j++)
			{
				System.out.printf("%3d" , arr[i][j]);
			}
			System.out.println();
			
		}


	}
	
}

//실행 결과
/*
  1  8  9 16 17
  2  7 10 15 18
  3  6 11 14 19
  4  5 12 13 20
계속하려면 아무 키나 누르십시오 . . .

*/