/*======================================
	■■■ 지역변수와 전역변수 ■■■
  → 지역변수의 초기화 테스트 및 관찰
  ======================================*/

// Test 068.java와 비교~~!!!



public class Test069
{
	// 클래스의 영역
	
	// 전역 변수 a 선언 //멤버 변수, 인스턴스 변수 등으로 불림
	int a;
	// -- 자동으로 0으로 초기화 지원
	
	boolean b;
	char c;
	double d;

	public static void main(String[] args)
	{
		//메소드 영역

		//System.out.println("a: " + a);
		//--==>> 에러 발생(컴파일 에러)
		//       non-static variable a cannot be referenced from a static context

		// Test069 클래스를 기반으로 인스턴스 생성
		Test069 ob = new Test069();

		System.out.println("ob.a : " + ob.a);
		//--==>> ob.a : 0

		System.out.println("ob.b : " + ob.b);
		System.out.println("ob.c : " + ob.c);
		System.out.println("ob.d : "+ ob.d);

		//--==>> ob.b : false
		//		 ob.c :
		//		 ob.d : 0.0

	}

}