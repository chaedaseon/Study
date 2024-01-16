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

import java.util.Scanner;

public class Test019
{
	public static void main(String[] args)
	{
		//주요 변수 선언
			
		Scanner sc = new Scanner(System.in);
		String name;
		int kor, eng, mat, tot;

		//연산 및 처리
		System.out.print("이름,국어,영어,수학 입력 (『,』구분):");
		//이름,국어,영어,수학 입력 (『,』구분) : 채다선,80,90,90

		sc = new Scanner(sc.next()).useDelimiter("\\s*,\\s*");
		//				 ---------
		//		     "채다선,80,90,90"
		//new Scanner(sc(next()).useDelimiter("\\s*,\\s*");
		//						.구분자사용();
		//									  "\\s*,\\s*"	
		//										\s*,\s*
		//

		name = sc.next();
		kor = sc.nextInt();
		eng = sc.nextInt();
		mat = sc.nextInt();
		
		tot = kor + eng + mat;


		//결과 출력
		System.out.println("\n>>이름 : " + name);
		System.out.println(">> 총점 : "+ tot);
	
	}
}