/*=============================================
  ■■■ 자바의 기본 프로그래밍 ■■■
  - 변수와 자료형
  - 자바의 기본 입출력 : System.util.Scanner
==============================================*/

// ※ java.util.Scanner
//    단락 문자 패턴을 사용하여 입력을 토큰에 따라 분할하며
//	  디폴트(default)로 사용되는 단락문자는 공백이다.
//	  작성된 다음 토큰은 『next()』메소드 사용
//    다른 형태(자료형)의 값으로 변환할 수 있다.


public class Test018
{
	public static void main(String[] args)
	{
		// 주요 변수 선언

		java.util.Scanner sc = new java.util.Scanner(System.in);	
		String name;
		int kor, eng, mat, tot;

		// 연산 및 처리
		// - 사용자에게 안내 메세지 출력
		System.out.print("이름 국어 영어 수학 입력 (공백구분) : ");
		// -- "최혜인 90 80 70"
		
		// -- 사용자가 입력한 데이터를 각각의 변수에 담아내기
		name = sc.next();
		kor = sc.nextInt();
		eng = sc.nextInt();
		mat = sc.nextInt();

		// - 총점 산출
		tot = kor + eng + mat;
			
		// 결과 출력
		System.out.println();
		System.out.println(" >> 이름 : " + name);
		System.out.println(" >> 총점 : " + tot);

	}
}

//실행 결과
/*
이름 국어 영어 수학 입력 (공백구분) : 김민지 80 70 90

 >> 이름 : 김민지
 >> 총점 : 240
계속하려면 아무 키나 누르십시오 . . .
*/