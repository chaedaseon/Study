/*==========================
  ■■■ 클래스 고급 ■■■
  - 중첩 클래스
============================*/

/*
○ annonymous 클래스 (익명의 클래스 : 무명 클래스)

	- AWT나 안드로이드 이벤트 처리에서 일반적으로 사용					// 이벤트 →  일어나는 모든 행위 ex) 키보드를 누르는 행위, 화면을 터치하는 행위 전부 이벤트! 
	- 『상위 클래스 메소드를 하나 정도 재정의』할 필요성이 있을 때 사용
	- 클래스의 객체가 필요하면 또 다시 클래스를 생성해야 하는 
	  번거로움으로 인해 빈번하게 객체 생성이 필요할 경우
	  익명의 클래스를 생성하여 처리할 수 있다.

	  클래스에 이름을 붙인다는건 또 쓸려고 → 익명의 클래스는 한번 쓰고 버릴거니까 이름 Ⅹ

○ 형식 및 구조 
	
	new 상위 클래스의 생성자()
	{
		접근제어지시자 자료형 메소드()
		{
			.....;
		}
	};						← check~~!! 세미콜론
*/


// 모든 클래스는 extends Object 가 뒤에 붙어있음!
// 다중상속이 안되는데 자식클래스는 extends Object 가 어떻게 있을 수 있을까?
// 단일 상속만 가능한거 맞음! → 부모 클래스 따라가면 부모 클래스가 extends Object를 상속 받음 → 따라서 자식도 상속받는다.
// Object 클래스는 클래스의 조상(최상위 클래스) → 클래스 가계도 맨 꼭대기에 Object가 있음! 

//import java.lang.Object;
//import java.lang.*; 
// 우리가 만든 모든 클래스에 자동 삽입

class TestObj //extends Object
{

	/*
	Object 의 멤버들~~!! 
	...;

	public String toString()
	{
		...;
	}
	...;

	*/
	
	/*
	@Override							//Object 를 상속받았기때문에 오버라이딩 가능!
	public String toString()
	{
		...;
	}
	*/

	public Object getString()
	{
		/*
		Object ob = new Object();
		ob.xx()
		ob.yy()
		ob.xxx()

		return ob;
		*/

		//return new Object();
		//			----------- Object 형

		return new Object()
		{
			// 특정 메소드 재구성 → 재정의
			@Override							
			public String toString()
			{
				return "익명의 클래스...";
			}

		};
	}

}

//import java.lang.*;

public class Test125 //extends Object
{
	/*
	Object의 멤버들 상속~~!! 
	*/
	
	public static void main(String[] args)
	{
		TestObj ob = new TestObj();
		System.out.println(ob.toString());
		//--==>> TestObj@15db9742

		System.out.println(ob.getString());
		//--==>> 익명의 클래스...

	}
}