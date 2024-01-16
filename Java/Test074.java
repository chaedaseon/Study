/*======================================
	■■■ 클래스와 인스턴스 ■■■
	→ 생성자 (Constructor)
  ======================================*/

/*
○ 생성자(Constructor)
	
	1. 인스턴스 생성  → 메모리 할당
	2. 초기화 

○ 생성자(Constructor)의 특징
	
	1. 생성자는 메소드이지만, 일반 메소드처럼 호출 될 수 없으며,
	   반환 자료형을 가질 수 없다.
	   (『void』조차 가질 수 없으며, 값을 반환할 수도 없다.)
	2. 생성자는 클래스와 동일한 이름을 가져야 한다.
	   (대소문자 명확히 구분)
	3. 생성자는 객체를 생성하는 과정에서 『new 생성자();』의 형태로 호출 된다.
	   (인스턴스 생성 시 단 한 번만 호출 )
		→ final 변수(상수화된 변수)초기화 가능 
*/

class NumberTest
{
	int num;
	
	//디폴트(default) 생성자 → 컴파일 과정에서 자동으로 삽입
	//							단, 사용자 정의 생성자가 존재하지 않을 경우만...
	/*

	NumberTest()
	{
		// 텅 비어있음~~~~!!!
	}
	*/

	// 사용자 정의 생성자
	NumberTest()
	{
		num =1;
		System.out.println("사용자 정의 생성자 호출~~!!");
	}

	int getNum()
	{
		return num;
	}
}

public class Test074
{
	public static void main(String[] args)
	{
		//NumberTest 클래스 기반의 인스턴스 생성
		NumberTest nt1 = new NumberTest();
		// --==>>  사용자 정의 생성자 호출~!! 
		//	-- 인스턴스가 생성되는 시점에서
		//	   이와 동시에 선택의 여지없이 생성자 호출이 이루어진다.
		//									------------
		//								    NumberTest();

		int num = nt1.getNum();
		System.out.println(num);
		//--==>> 1

		nt1.num = 200;
		System.out.println(nt1.getNum());
		//--==>> 200

		// NumberTest 클래스 기반의 인스턴스 생성
		NumberTest nt2 = new NumberTest();
		//--==>> 사용자 정의 생성자 호출~~!!

		System.out.println("nt1.num : " + nt1.getNum());	//--==>> nt1.num : 200
		System.out.println("nt2.num : " + nt2.getNum());	//--==>> nt2.num : 1오전 9:04


	}
}

