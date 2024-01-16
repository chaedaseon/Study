/*========================
	■■■ 배열 ■■■
  → 배열의 배열
  =======================*/

public class Test085
{
	public static void main(String[] args)
	{
		//배열의 배열 선언과 초기화
		// 방법 ①
		//int[] arr1 = new int[3];			//기본 배열 
		int[][] arr1 = new int[3][3];
		
		//arr[0]=1;

		arr1[0][0]=1;
		arr1[0][1]=2;
		arr1[0][2]=3;
		arr1[1][0]=4;
		arr1[1][1]=5;
		arr1[1][2]=6;
		arr1[2][0]=7;
		arr1[2][1]=8;
		arr1[2][2]=9;

		// 방법②
		//int[] arr2 = {1,2,3};
		int[][] arr2 = {{1,2,3},{4,5,6},{7,8,9}};

		// 방법 ③
		int[][] arr3 = new int[3][3];
		int n =1;	
		for (int i=0; i<arr3.length; i++ )				// 웅~ 0		1		  2
						
		{												//		↓		↓		  ↓	
			for (int j=0; j<arr3[i].length; j++)		// 쑝  0 1 2 숑 0 1 2 쑝~ 0 1 2
			{
				//테스트 (확인)
				//System.out.println("i: " + i + " j :" +j);
				arr3[i][j] = n;
				n++;
			}

		}

		//배열의 전체 요소 출력
		for (int i=0; i<arr3.length; i++)
		{
			for (int j=0; j<arr3[i].length; j++)
			{
				System.out.printf("%2d", arr3[i][j]);
			}
			System.out.println();
		}
	



	}
		
}
//실행결과
/*
 1 2 3
 4 5 6
 7 8 9
*/