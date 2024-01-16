/*============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - StringBuffer 클래스
==============================================*/

/*
○ StringBuffer 클래스
	
   문자열을 처리하는 클래스로 String 클래스와의 차이점은
   String 클래스는 내부 문자열 데이터의 수정이 불가능하지만
   StringBuffer 클래스는 문자열을 사용 할 때 
   내부 문자열을 실행 단계에서 변경할 수 있다.

   즉, StringBuffer 객체는 가변적인 길이를 가지므로 
   객체를 생성하는 시점에서 미리 그 크기나 값을 지정하거나
   실행 시점에 버퍼의 크기를 바꿀 수 있는 기능을 제공한다.

   또한 JDK1.5 이후부터는
   문자열을 처리하는 StringBuilder 라는 클래스도 제공한다.
   StringBuilder 클래스의 기능은 StringBuffer 클래스와 동일하지만
   가장 큰 차이점은 multi - thread unsafe 라는 점이다.					// 여러 작업자가 있는 곳은 안전 Ⅹ → StringBuffer가 더 안전하다.
   즉, Syncronization 이 없기때문에
   StringBuffer 보다 빠르며, 동시성(동기화) 문제가 없다면
   StringBuilder 를 사용하는 것이 성능을 향상시킬 수 있다.

   기능은 StringBuffer 가 더 많고 안전하지만 StringBuilder가 더 빠르고 성능이 좋다.
*/

public class Test138
{
	public static void main(String[] args)
	{
		String str1 = new String("seoul");
		String str2 = new String("seoul");

		System.out.println(str1 == str2);			// 주소값 비교
		System.out.println(str1.equals(str2));		// 데이터 비교
		//--==>> false
		//		 true

		StringBuffer sb1 = new StringBuffer("korea");
		StringBuffer sb2 = new StringBuffer("korea");

		System.out.println(sb1 == sb2);
		System.out.println(sb1.equals(sb2));
		//--==>> false
		//		 false
		// StringBuffer에서는 equals 를 오버라이딩 안함 → 주소값 비교

		System.out.println("-----------------------------------------------------------------");

		System.out.println(sb1);
		//--==>> korea	→ StringBuffer 객체 출력
		//-- toString() 메소드 오버라이딩

		System.out.println(sb1.toString());
		//--==>> korea → String 출력
		
		System.out.println(sb1.toString().equals(sb2.toString()));
		//--==>> true
		//--==>> String equals String이기때문에 데이터 비교로 true가 나옴

		System.out.println("-----------------------------------------------------------------");

		StringBuffer sb3 = new StringBuffer();
		// -- StringBuffer 기본 생성자 호출(인스턴스 생성 과정)
		//	  기본적으로 생성되는 버퍼 크기는 『16』

		// capacity()	→ 버퍼 크기를 알려주는 메소드
		System.out.println("버퍼 크기 : " + sb3.capacity());
		//--==>> 버퍼 크기 : 16

		System.out.println(sb3);
		//--==> 아무것도 안나옴 無
		//-- 안에 들은게 없어요~ 
		//Returns a string representing the data in this sequence.

		/*
		String name = "박가영";
		name += "박나영";
		name += "박범구";
		name += "엄재용";

		System.out.println(name);
		//--==>> 박가영박나영박범구엄재용
		*/

		sb3.append("seoul");					// sb3 += "seoul";
		sb3.append("korea");					// sb3 += "korea";
		sb3.append("우리나라");					// sb3 += "우리나라";
		sb3.append("대한민국");					// sb3 += "대한민국";
		// 메모리 절약 아마도~? 

		System.out.println(sb3);
		//--==>> seoulkorea우리나라대한민국		//StringBuffer 타입
		System.out.println(sb3.toString());
		//--==>> seoulkorea우리나라대한민국		//String타입

		//버퍼 크기 다시 확인
		System.out.println("버퍼크기 : " + sb3.capacity());
		//--==>> 버퍼크기 : 34



		//////////////////////////////////////////////////////////////////////////////////////////////

		String temp1 = "java and oracle";

		System.out.println(temp1.toUpperCase());
		//--==>> JAVA AND ORACLE	
		//		 소문자를 모두 대문자로 변환

		String temp2 = "JAVA AND ORACLE";
		System.out.println(temp1.toLowerCase());
		//--==>> java and oracle
		//		 대문자 → 소문자

		//System.out.println(sb3.toUpperCase());
		//System.out.println(sb3.toLowerCase());
		// 에러 발생(컴파일 에러)
		// 왜냐면 StringBuffer 에는 toUpperCase() 메소드와 toLowerCase() 메소드가 없다~
		
		// seoulkorea우리나라대한민국
		String temp3 = sb3.toString();
		System.out.println(temp3.toUpperCase());
		//--==>> SEOULKOREA우리나라대한민국

		System.out.println(sb3.toString().toUpperCase());
		//--==>> SEOULKOREA우리나라대한민국
		// seoulkorea우리나라대한민국
		// sb3에는 여전히 이 문장이 들어있음! 헷갈리지 말것!
		// sb3에 대문자로 변환된 값이 들어가려면 대입 연산자를 사용해 넣어줘야한다.

		
		// seoulkorea우리나라대한민국
		// ○ 대상 문자열("seoulkorea우리나라대한민국")중
		//	  "seoul" 문자열 앞에 "한국"이라는 문자열 추가
		//	  즉, 『한국seoulkorea우리나라대한민국』 으로 구성
		sb3.insert(0,"한국");
		System.out.println("seoul 앞에 『한국』추가 :" + sb3);
		//--==>> seoul 앞에 『한국』추가 : 한국seoulkorea우리나라대한민국
		System.out.println("seoul 앞에 『한국』추가 : " + sb3.toString());
		//--==>> seoul 앞에 『한국』추가 : 한국seoulkorea우리나라대한민국

		// ○ 대상 문자열(sb3 → "한국seoulkorea우리나라대한민국")중
		//	  "korea"문자열 뒤에 "사람"이라는 문자열 추가
		//	  단, 대산 문자열의 인덱스를 눈으로 직접 확인하지 않고...
		//	  즉, 『"한국seoulkorea사랑우리나라대한민국"』으로 구성
		
		//sb3 = sb3.append("사랑");
		//System.out.println(sb3);
		

		//테스트 ①
		System.out.println(sb3.toString());
		//--==>> 한국seoulkorea우리나라대한민국

		//테스트 ②
		//sb3.insert(12,"사랑");
		//System.out.println("korea뒤에 『사랑』 추가 : " + sb3);
		//korea뒤에 『사랑』 추가 : 한국seoulkorea사랑우리나라대한민국
		//System.out.println("korea뒤에 『사랑』 추가 : " + sb3.toString());
		//korea뒤에 『사랑』 추가 : 한국seoulkorea사랑우리나라대한민국

		//테스트③
		sb3.indexOf("korea");
		System.out.println(sb3.indexOf("korea"));
		//--==>> 7

		//테스트 4
		//System.out.println(sb3.insert(sb3.indexOf("korea"), "사랑"));
		//--==>> 한국seoul사랑korea우리나라대한민국

		//테스트 ⑤ 
		//System.out.println(sb3.insert(sb3.indexOf("korea") +5, "사랑"));
		//--==>> 한국seoulkorea사랑우리나라대한민국

		//테스트 ⑥ 
		System.out.println(sb3.insert(sb3.indexOf("korea")+"korea".length(), "사랑"));
		//--==>> 한국seoulkorea사랑우리나라대한민국

		System.out.println(sb3.toString());
		//--==>> 한국seoulkorea사랑우리나라대한민국

		// ○ 대상 문자열(sb3)에서 
		//	  『"우리나라"』문자열 삭제

		//sb3.delete(14,18);
		//System.out.println(sb3);
		//--==>> 한국seoulkorea사랑대한민국
		
		sb3.delete(sb3.indexOf("우리나라"),sb3.indexOf("우리나라")+"우리나라".length());
		System.out.println(sb3);
		//--==>> 한국seoulkorea사랑대한민국

		//sb3.delete(14,18);
		//			 --	-- 
		//			 ↓	└─────────┐
		//	sb3.indexOf("우리나라")		 sb3.indexOf("우리나라")+"우리나라".length()


		// ○ 대상 문자열(sb3)에서
		//	  『"korea"』이후 모든 문자열 삭제(korea포함)
		//	  한국seoulkorea사랑대한민국 → 한국seoul

		//sb3.delete(sb3.indexOf("korea"), sb3.length());
		//System.out.println(sb3);
		//--==>> 한국seoul

		//sb3.delete(7,18);
		//System.out.println(sb3);

		//sb3.delete(7);
		//System.out.println(sb3);

		//sb3.delete(7,18);
		//			-- -- 
		//			│ └──────ab3.length()
		//			│
		//	sb3.indexOf("korea")	
		
		sb3.delete(sb3.indexOf("korea"), sb3.length());
		System.out.println(sb3);
	
		/////////////////////////////////////////////////////////////////////////
		
		//버퍼크기 다시 확인
		System.out.println("버퍼크기 : " + sb3.capacity());
		//--==>> 버퍼크기 : 34
		//		 내용물이 줄어들어도 버퍼크기는 줄어들지 않는다. 
		//		 증가는 자동증가 감소는 자동 증가Ⅹ

		// 문자열(sb3)의 길이 확인
		System.out.println("문자열의 길이  : " + sb3.length());
		//--==>> 문자열의 길이  : 7

		// 버퍼 크기 조절
		// → 현재 문자열을 담아둘 수 있는 버퍼의 크기로....
		// trimToSize()
		sb3.trimToSize();		

		//버퍼 크기 조절 이후 버퍼 크기 다시 확인
		System.out.println("버퍼크기 : " + sb3.capacity());
		//--==>> 버퍼크기 : 7
	
	
		

	
	}
}