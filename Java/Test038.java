
/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - if 문
  - if ~ else 문
==========================================*/
//1. 프로그램을 작성할때 주어진 조건에 따라
//   분기 방향을 정하기 위해 사용하는 제어문에는
//   if문, if ~ else문, 조건연산자, 복합if문(if문 중첩), switch문이 있다.
//	 

//2. if문은 if다음의 조건이 참일 경우
//   특정 문장을 수행하고자 할 때 사용되는 구문이다.

// ○ 과제
//	  사용자로부터 임의의 알파벳 한 문자를 입력 받아
//	  이름과 판별하여 입력받은 알파벳이 모음일 경우만 
//    결과를 출력하는 프로그램을 구현한다.
//    단, 대소문자를 모두 적용할 수 있도록 처리한다.
//	  또한, 알파벳 이외의 문자가 입력되었을 경우 
//	  입력 오류에 대한 내용을 사용자에게 안내해 줄 수 있도로 한다. 

//	실행 예 ) 
//	임의의 알파벳 한 문자 입력 : A ← 대문자 모음
//	>> 모음 OK~~~!!!
// 계속하려면 아무키나 누르세요

//	실행 예 ) 
//	임의의 알파벳 한 문자 입력 : e ← 소문자 모음
//	>> 모음 OK~~~!!!
// 계속하려면 아무키나 누르세요

//	실행 예 ) 
//	임의의 알파벳 한 문자 입력 : B ← 대문자 자음
// 계속하려면 아무키나 누르세요

//	실행 예 ) 
//	임의의 알파벳 한 문자 입력 : c ← 소문자 자음
// 계속하려면 아무키나 누르세요

//	실행 예 ) 
//	임의의 알파벳 한 문자 입력 : 1 ← 알파벳 아님
//	>> 입력 오류 ~ !!!
// 계속하려면 아무키나 누르세요


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test038
{
   public static void main(String[] args) throws IOException
   {
      //알파벳 모음 A, E, I, O, U
      
      //주요 변수 선언
      
      char a;                     //사용자가 입력한 문자를 담을 변수
      
      //연산 및 처리		
      System.out.print("임의의 알파벳 한문자 입력 : ");						//사용자가 값을 입력할 수 있도록 안내
      a = (char)System.in.read();

      //테스트
      //System.out.printf("%c",a);
   
	  //알파벳 모음 A, E, I, O, U	
      if (a >= 'A' && a<='Z'  )												//알파벳 대문자인 경우	
      {
            if( a == 'A' ||  a == 'E' || a== 'I' || a== 'O' || a== 'U')		//알파벳 모음인 경우
            {
               System.out.println("\n모음 OK~~!!");							
            }
         return;															//알파벳 대문자이지만 모음이 아닌경우 메소드 종료
   
      }
      else if (a >= 'a' && a<='z')											//알파벳 소문자인 경우
      {
         if(a == 'a' || a=='e' ||a=='i'||a=='o'||a=='u')					//알파벳 모음인 경우
         {
            System.out.println("\n모음 OK~!!!");	
         }
         return;															//알파벳 소문자이지만 모음이 아닌경우 메소드 종료
      }
      else
         {
            System.out.println("\n입력오류~!!!");							//알파벳이 아닌경우
         } 
         

     

   }
}