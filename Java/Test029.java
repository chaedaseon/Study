/*===============================
  ■■■ 연산자(Operator) ■■■
  - 조건 연산자 == 삼항 연산자 
=================================*/

// 사용자로부터 임의의 문자 하나를 입력받아
// 알파벳 대문자이면 소문자로
// 알파벳 소문자이면 대문자로 
// 알파벳이 아닌 기타 문자라면 그 문자 그대로
// 출력하는 프로그램을 구현한다.

//실행 예)
// 한 문자 입력 : A
// A → a
// 계속하려면 아무 키나 입력하세요.

// 한 문자 입력 : b
// b → B
// 계속하려면 아무 키나 입력하세요.

// 한 문자 입력 : 7
// 7 → 7
// 계속하려면 아무 키나 입력하세요.

//import java.io.BufferedReader;
//import java.io.InputStreamReader;
import java.io.IOException;

public class Test029
{
	public static void main(String[] args)	throws IOException
	{
		/*
		//주요 변수 선언
		//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));      사용할 필요 없음

		int a;				//사용자의 값을 입력 받을 변수
		int Result;			//판별 결과를 담아둘 변수

		//연산 및 처리
		System.out.print("한 문자 입력 : ");
		//a = Integer.parseInt(br.readLine());
		a = (char)System.in.read(); 
		
		//『System.in.read()』 메소드는 (입력 대기열로부터) 한 문자만 가져온다.
		//단, 입력받은 하나의 문자를 문자 그대로 가져오는 것이 아니라
		//ASCII code값(정수 형태)으로 반환하게 된다.
		


		
		
		
		// a가 대문자일 경우 소문자로 출력 소문자일 경우 대문자로 출력 알파벳이 아닐경우 그대로 출력 
		Result = ( 65 <= a &&  a <= 90 ) ? ( a + 32 ) : ( a => 97 && 122 => a ) ? ( a - 32 ) : a;

		//결과 출력
		System.out.println((char) a + " → " + (char)Result);
		*/	


		// 같이 풀어본 내용 --------------------------------------------------------------------------------
		/*																	
																				알파벳 대문자도 소문자도 아님

																							 ↑

		//알파벳 대문자 ? 알파벳 소문자로 변환 : (알파벳 소문자 ? 알파벳 대문자로 변환 : 있는 그대로) ; 
												 ---------------  ---------------------  ------------
														1				  2						3
		 --------------- ---------------------		
				1					2
		*/	
		/*
		char temp;
		System.out.print("한 문자 입력 : ");
		temp = (char)System.in.read();

		System.out.println("입력 받은 값 확인 : " + temp);
		
		//대문자 ? 대문자 아님?
		//temp == 'A'				→ 65
		//temp == 'B'				→ 66
		//	    :
		//temp == 'Z'				→ 90

		// ※ 두개 이상의 조건이 나오면 무조건 논리 연산자!!!!!!!!!
		//String result = temp >= 65 && temp<= 90 ? "대문자" : "대문자 아님";
		//System.out.println("결과 : " + result);

		//String result = temp >= 'A' && temp <= 'Z' ? "대문자" : "대문자 아님"; 
		//System.out.println("결과 : " + result);

		String result = temp >= 'a' && temp <= 'z' ? "소문자" : "소문자 아님"; 
		System.out.println("결과 : " + result);
		*/

		// 대문자	 →   소문자
		//'A'(65)	 →	 'a'(97)	==>> +32
		//'B'(66)	 →	 'b'(98)	==>> +32
		//'C'(67)	 →	 'c'(99)	==>> +32
		//		:
		//'Z'(90)	 →	 'z'(122)	==>> +32

		// 소문자	 →   대문자
		//'a'(97)	 →	 'A'(65)	==>> -32
		//'b'(98)	 →	 'B'(66)	==>> -32
		//'c'(99)	 →	 'C'(67)	==>> -32
		//		:
		//'z'(122)	 →	 'Z'(90)	==>> -32
		// ※'a'(97), 'A' (65) , 'z'(122) 'Z'(90)인건 기억하는게 좋음! 

		char ch, result;
		
		System.out.print("한 문자 입력 : "  );
		ch = (char)System.in.read();

		// result = () ? () : ();
		// result = (입력 값 대문자) ? (소문자 변환) : (입력 값 소문자? 대문자로 변환 : 그대로);

		result = (ch>='A' && ch<='Z') ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);

		// 'Q' (→ 81)
		//	result = (81>=65 && ch<='Z') ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (true && 81<=90) ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (true && true) ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (true) ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = ((char)(81+32));
		//	result = ((char)(113));
		//	result = 'q';

		// 'm' (→ 109)
		//	result = (109>=65 && ch<='Z') ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (true&& ch<='Z') ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (true&& 109<=90) ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (true&&false) ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = ( 109>= 97 && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = ( true && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = ( true && 109<=122 ? ((char)(ch-32)) : ch);
		//	result = ( true && true ? ((char)(ch-32)) : ch);
		//	result = ( true ? ((char)(ch-32)) : ch);
		//	result = ((char)(ch-32));
		//	result = ((char)(109-32));
		//	result = ((char)(77);
		//	result = 'M';
		

		// '8' (→ 56)
		//	result = (56>=65 && ch<='Z') ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = (false && ch<='Z') ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//	result = false ? ((char)(ch+32)) : ( ch>='a' && ch<='z' ? ((char)(ch-32)) : ch);
		//  result = (56>=97 && ch<='z' ? ((char)(ch-32)) : ch);
		//  result = (false && ch<='z' ? ((char)(ch-32)) : ch);
		//  result = (false ? ((char)(ch-32)) : ch);
		//  result = (ch);
		//  result = '8';

		System.out.println(ch + " → " + result);

		//--------------------------------------------------------------------------------------------------


	}
}

//실행결과 

/*
한 문자 입력 : 5
5 → 5
계속하려면 아무 키나 누르십시오 . . .

한 문자 입력 : a
a → A
계속하려면 아무 키나 누르십시오 . . .

한 문자 입력 : B
B → b
계속하려면 아무 키나 누르십시오 . . .

*/