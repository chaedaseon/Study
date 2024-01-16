/*========================
   ■■■ 배열 ■■■
  → 배열의 배열
  =======================*/

// 배열의 배열(다차원배열)을 활용하여
// 다음과 같은 데이터를 요소로 취하는 배열 (5*5)을 구성하고
// 그 결과를 출력하는 프로그램을 구현한다.

// 실행 예)
/*
A 
C B 
D E F 
J I H G 
K L M N O
//계속 하려면 아무키나 누르세요
*/


public class Test094
{   
   public static void main(String[] args)
   {
      // 배열의 배열 선언 및 메모리 할당
      char[][] arr = new char[5][5]; 
      

      //주요 변수 선언
      char ch = 'A';               //ch 에 문자 A를 삽입 → 추후 알파벳을 출력하기 위함

      //배열의 배열 구성
      for (int i=0; i<arr.length; i++)
      {
         for (int j=0; j<=i; j++)
         {   
            
            if (i%2==0)				//i가 짝수일때 
            {
               arr[i][j] = ch;		//배열[i][j]에 ch값을 담는다.
               ch++;				//ch값을 증가시킨다.
              
            }   
			 if (i%2!=0)			//i가 홀수일때 
			{
               arr[i][i-j] = ch;	//배열[i][j]에 들어가는 방향을 반대로 ch값을 담는다.
			   ch++;				//ch값을 증가시킨다.
               
             }

         }
      }

      //배열 전체요소 출력 
      for (int i=0; i<arr.length; i++)
      {
         for (int j=0; j<arr.length; j++)
         {
            System.out.printf("%2c" , arr[i][j]);
         }
         System.out.println();
      }

   }
}

//실행결과
/*
 A
 C B
 D E F
 J I H G
 K L M N O
계속하려면 아무 키나 누르십시오 . . .

*/