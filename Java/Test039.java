
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
//    사용자로부터 임의의 문자를 하나 입력 받아
//	  알파벳 대문자이면 소문자로. 소문자이면 대문자로
//    알파벳이 아닌 기타 문자면 입력 오류 처리하는 
//	  프로그램을 구현한다.

// 실행 예) 
// 한 문자 입력 : A
// >> A → a
// 계속하려면 아무키나 누르세요...

// 실행 예) 
// 한 문자 입력 : b
// >> b → B
// 계속하려면 아무키나 누르세요...

// 실행 예) 
// 한 문자 입력 : 3
// >> 입력 오류~!!!
// 계속하려면 아무키나 누르세요...



import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test039 
{
	public static void main(String[] args) throws IOException
	{
		//주요 변수 선언
		char ch;								//사용자가 입력한 임의의 문자
	
		System.out.print("한 문자 입력 : ");	//사용자가 값을 입력할 수 있도록 안내
		ch = (char)System.in.read();

		//테스트 
		//System.out.println(" " + ch);

		if (ch >= 'A' && ch <= 'Z')									//알파벳 대문자인 경우
		{		
			System.out.println(ch + " → " + (char)(ch+32));		//대문자를 소문자로 변경	
		}
		else if (ch >= 'a' && ch<='z')								//알파벳 소문자인 경우
		{
			System.out.println( ch +  " → " + (char)(ch-32));		//소문자를 대문자로 변경
		}
		else 
			{
			System.out.println("입력 오류~~!!");					//알파벳이 아닌 문자를 입력했을때 
		}

	}
}