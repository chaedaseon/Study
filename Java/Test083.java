/*========================
   ■■■ 배열 ■■■
   → 배열의 선언과 초기화
   → 배열의 기본적 활용
  =======================*/

// ○ 과제 
//     사용자로부터 임의의 정수를 임의의 갯수만큼 입력받아
//    입력받은 수 중에서 가장 큰 수를 출력하는 프로그램을 구현한다.
//    단. 배열을 활용하여 구현할 수 있도록 한다.

// 실행 예)
// 입력할 데이터의 갯수 : 11
// 데이터 입력(공백구분): 1 2 3 4 5 9 5 7 123 4 8 7 8  

// >> 가장 큰 수 → 123
// 계속하려면 아무 키나 누르세요.

import java.util.Scanner;
import java.io.IOException;

public class Test083
{
   public static void main(String[] args)   throws IOException
   {
      

      //Scanner 인스턴스 생성
      Scanner sc = new Scanner(System.in);

      int num;            //사용자로부터 입력 받은 임의의 정수 변수

      // 사용자에게 임의의 정수 입력 받기
      System.out.print("입력할 데이터의 갯수 : ");
      num = sc.nextInt();

      //테스트(확인)
      //System.out.println("사용자가 입력한 정수 : " + num);         // 정상적으로 출력 되는 것을 확인

      //배열 선언
      int[] arr = new int[num];

      // 사용자에게 데이터 값 입력 받기
      System.out.print("데이터 입력(공백구분) : ");

      for (int i=0; i<num; i++)
      {      
         arr[i] = sc.nextInt();

         //테스트(확인)
         //System.out.printf("%d " , arr[i]);                  // 정상적으로 출력 되는 것을 확인

      }
      
      // 가장 큰 수 정렬
      for (int i=0; i<num; i++)
      {
         for (int j=1; j<num; j++)
         {
            if (arr[i] < arr[j])
            {
               arr[i] = arr[i]^arr[j];
               arr[j] = arr[j]^arr[i];
               arr[i] = arr[i]^arr[j];
            }
         }   
      }

      System.out.println("가장 큰 수 → " + arr[0]);


   

   

      
   }
}

//실행결과
/*
입력할 데이터의 갯수 : 10
데이터 입력(공백구분) : 11 55 77 1234 88 456 123 895 11 55
가장 큰 수 → 1234
계속하려면 아무 키나 누르십시오 . . .
*/