/*============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - Wrapper 클래스
==============================================*/

/*
○ Wrapper 클래스

	1. 자바에서는 언어 수준에서 제공하는 기본형 데이터를 제외한
	   나머지는 클래스로 설계하여 객체 단위로 처리한다.
	   따라서 자바에서는 이러한 기본형 데이터를 
	   객체 단위로 처리할 수 있도록 클래스를 제공할 수 밖에 없는데 
	   이러한 클래스들을 가리켜 Whapper 클래스라 한다.

	2. 기본 자료형인
	   byte, short, int,     long, float, double, char      ,boolean 형에 대응하는
	   Byte, Short, Integer, Long, Float, Double, Character ,Boolean 의				 // 기본 자료형들을 객체로 사용하기 위한 Wrapper 클래스이다. 1 : 1 짝꿍이 있다!
	   Wrapper 클래스 및 큰 숫자들을 다루기 위한
	   Java.math.BigInteger 와 java.math.BigDecimal 클래스를 제공한다.				 // 엄청나게 큰 값들을 다룰 수 있는 클래스
	  
	   Wrapper 클래스는 java.lang 패키지에 포함되어 있으므로 
	   별도의 import 과정 없이 바로 사용하는 것이 가능하며
	   기본형과 마찬가지고 Wrapper클래스도 내부 메소드를 통해
	   형 변환이 가능하다 동등 비교와 같은 연산도 가능하다.

	   ex) java.lang.Integer 클래스
	   	   int 기본 자료형의 Wrapper 클래스로 
		   정수를 다루는데 필요한 상수나 메소드, 긴수 변환등에 필요한
		   메소드 등을 포함하고 잇다.

		   Static Integer valueOf(int i)
		   int 형을 Integer형으로 변환한다.

		   Static Integer parseInt(String s)
		   문자열 형식으로 저장된 숫자를 정수 형태로 변환하여 반환한다.
		   
			Integer.parseInt("숫자형태의문자열");
			1. java.lang.Integer 	
			2. 인스턴스 생성 한적 x → static 쓰는구나 클래스메소드구나
			라는 사실을 알 수 있다!
			이제 당연하게 생각해야 한다!

		   byte byteValue()	, Int intValue()
		   short shortValue(), long ongValue()
		   float floatValue(), double doubleValue()
		   해당 기본 자료형으로 형 변환한 값을 반환한다.

*/

/*
※ 오토 박싱(Auto-Boxing)과 오토 언박싱(Auto-UnBoxing)

	일반적으로 레퍼런스 형과 기본자료형은 호환되지 않으며
	이 경우 발생하는 문제 해결을 위해 자바에서는 Wrapper 클래스를 제공하게 되었다.
	하지만 JDK 1.5부터 레퍼런스 형과 기본 자요형이 
	다음과 같이 형 변환이 가능하도록 문법적인 지원이 이루어지게 되었다.

	int a=10,b;
	Integer ob;
	ob = a;
	//-- 기본 자료형(int)이 Integer 형으로 자동 변환(오토 박싱)
	//   실제로는... 『ob = new Integer(a);』 ← 이건 박싱

	b = ob;
	//-- Integer(객체)가 기본 자료형 int형으로 자동 변환(오토 언박싱)
	//   실제로는 ... 『b = ob.intValue();』 ← 이건 언박싱 
	↓ 
	이는 JDK1.5 이후 추가된 오토 박싱 / 오토 언박싱이라는 
	기능으로 인해 가능해진 것이다. 


*/

public class Test130
{
	public static void main(String[] args)
	{
		int a= 10, b;
		Integer c;
		Object d;

		b = a;					//-- int 형 데이터(자료) → int 형 변수
		c = new Integer(0);		//-- 객체 생성

		// ※ 기본적으로 레퍼런스 형(참조 타입)과 기본 자료형(기본 타입)은 호환되지 않는다. 
		
		b = c;					//-- Integer 형 데이터(객체) → int 형 변수(오토 언박싱)
		b = c.intValue();		//-- 객체의 메소드 호출을 통해 결과값 반환(언박싱)

		d = new Object();		//-- 객체 생성
		System.out.println("d.toString() : " + d.toString());
		//--==>> d.toString() : java.lang.Object@15db9742				// 사용자에게 어디 있는지 알려줄려고 java.lang가 붙음

		d = new Integer(10);	//-- 업 캐스팅
		System.out.println("d.toString() : " + d.toString());
		//--==>> d.toString() : 10
		//		 Integer 클래스에서 Object로부터 상속받은 toString()메소드를 오버라이딩 했다.
		
		d = new Double(12.345);	//-- 업 캐스팅
		System.out.println("d.toString() : " + d.toString());
		//--==>> d.toString() : 12.345
		// 		  double 클래스에서 Object로부터 상속받은 toString()메소드를 오버라이딩 했다.

		// Object d = 10
		d = 10;					//-- 오토 박싱 → 업 캐스팅
		System.out.println("d.toString() : " + d.toString());
		//--==>> d.toString() : 10
		//		 위에 결과를 보면 Object의 toString()메소드가 오버라이딩 됐다는 것을 알 수 있다. → Integer가 오버라이딩 시킴!!
		//		 
		

	}
}