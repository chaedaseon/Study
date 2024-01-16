/*========================
   ■■■ 배열 ■■■
   → 배열의 선언과 초기화
   → 배열의 기본적 활용
  =======================*/

// ○ 과제 
//     사용자로부터 임의의 학생 수를 입력받고
//     그만큼의 정수(정수형태)를 입력받아 
//    전체 학생 점수의 합, 평균, 편차를 구해서
//    결과를 출력하는 프로그램을 구현한다.

// 실행 예)
// 학생 수 입력 : 5
// 1번 학생의 점수 입력 : 80
// 2번 학생의 점수 입력 : 92
// 3번 학생의 점수 입력 : 64
// 4번 학생의 점수 입력 : 36
// 5번 학생의 점수 입력 : 98

// >> 합   : 370
// >> 평균   : 74.0
// >> 편차  
// 90 : - 16.0
// 82 : - 8.0
// 64 : 10.0
// 36 : 38.0
// 98 : - 24.0
//계속하려면 아무키나 누르세요...

import java.util.Scanner;
import java.io.IOException;


public class Test084
{
   public static void main(String[] args) throws IOException
   {

      // Scanner 인스턴스 생성
      Scanner sc = new Scanner(System.in);


      // 주요 변수 선언 
      int studentCount;                     // 학생들의 수
      int tot=0;
      double avg=0;                        // 학생들의 평균

      //사용자로부터 학생 수 입력 받기
      System.out.print("학생 수 입력 :");
      studentCount = sc.nextInt();

      //자료형이 int인 학생 점수 배열 구성
      int[] arr1 = new int[studentCount];

      //학생의 점수 입력 받기
      for (int i=0; i<arr1.length; i++)
      {
         System.out.printf("%d번 학생의 점수 입력 : ", (i+1));
         arr1[i] = sc.nextInt();

       //테스트(확인)
       //System.out.println("학생의 점수 출력 : " + arr[i]);       //정상적으로 출력 되는 것을 확인   
       }

      // 학생들의 점수 합, 평균 구하기
      
      // 점수 누적합 연산
       for (int i=0; i<arr1.length; i++)
       {
          tot +=arr1[i];
       } 

       // 평균 연산
         
       avg = tot / studentCount;

       //테스트(확인)
       //System.out.printf("총점 : %d, 평균 : %.2f\n", tot, avg);      //정상적으로 출력 되는 것을 확인
         
      
      // 자료형이 double인 편차 배열 구성
      double[] arr2 = new double[arr1.length];

      // 편차 구하기
      for (int i=0; i<arr1.length; i++)
      {
         arr2[i] = avg - arr1[i]; 
      }

      // 최종 출력
      System.out.println();                  // 개행
      System.out.println(" >> 합 : " + tot);
      System.out.printf(" >> 평균 : %.2f \n" , avg );
      System.out.println(" >> 편차  ");
      for (int i=0; i<arr2.length; i++)
      {
         System.out.println(arr1[i]+ " : " +arr2[i]);
      }
      




      
   }
}

//실행 결과
/*

학생 수 입력 :4
1번 학생의 점수 입력 : 90
2번 학생의 점수 입력 : 55
3번 학생의 점수 입력 : 66
4번 학생의 점수 입력 : 89

 >> 합 : 300
 >> 평균 : 75.00
 >> 편차
90 : -15.0
55 : 20.0
66 : 9.0
89 : -14.0
계속하려면 아무 키나 누르십시오 . . .
*/