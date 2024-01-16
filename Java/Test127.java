/*============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - Object 클래스
==============================================*/

// java126.java 파일과 비교~~!!

// import java.lang.*;
// (import java.lang.Object를 포함하는 구문)


public class Test127 // extends Object
{
	/*
	Object 클래스로부터 상속받은 멤버들
	{
		...;
	}
	
	*/
	
	//Object로부터 상속받은 toString() 오버라이딩
	@Override
	public String toString()
	{
		return "재정의한 toString()...";
	}


	public static void main(String[] args)
	{
		//Test127 클래스 인스턴스 생성
		Test127 ob = new Test127();

		System.out.println(ob.toString());
		//--==>> 재정의한 toString()...

		System.out.println(ob);
		//--==>> 재정의한 toString()...
		//오버라이딩으로 메소드가 덮여쓰여짐
		
	}

}