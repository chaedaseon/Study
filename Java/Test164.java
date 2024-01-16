/*==================================
  ■■■ 컬렉션 (Collection) ■■■
===================================*/

/*
○ Enumeration 과 Iterator 인터페이스

   Collection Framework 에는
   Enumeation 과 Iterator 라는 인터페이스가 있다.
   사전적인 의미로는 반복, 순환 이라는 의미를 가지고 있으며
   어떤 객체들의 모임이 있을 때,
   이 객체들을 어떤 순서에 애희 하나씩 접근하여 사용하기 위한
   인터페이스라고 할 수 있다.

   - java.util.Enumeration<E> 인터페이스
     : 이 인터페이스는 단지 두 개의 메소드만을 제공하며
	   『hasMoreElements()』 메소드를 통해
	   인터페이스 안에 다음 요소가 있는지에 대한 질의를 한다.
	   만약 ture가 반환되었다면 다음 인덱스에 요소가 존재한다는 의미이며
	   『nextElement()』 메소드로 다음 요소에 접근하여 사용하면 되는 것이다.

	 ex) // v 라는 벡터 자료구조에 저장된 모든 요소 출력
		 for (Enumeration e = v.elements(); e.hasMoreElements(); )
		 {
			 System.out.println(e.nextElement());
		 }

   - java.util.Iterator<E> 인터페이스
     : Enumeration 과의 차이점은 단지 『remove()』 메소드가 추가된 것 뿐이다.
	   Iterator  가 가지고 있는 『hasNext()』와 『next()』 메소드는
	   이름만 약간 다를 뿐  Enumneration 인터페이스가 가지고 있는
	   『hasMoreElements()』와 그리고 『nextElement()』와
	   정확히 일치하는 기능을 수행한다.
	   Enumeration 대신 Iterator 를 JDK 1.2 부터 추가하여 사용하게 된 이유는 
	   Enumeration 인터페이스는 집합 내에서 요소를 제거할 방법이 없기 때문에
	   이를 보완하기 위해 나온 것이 Iterator 인터페이스이다.

*/

import java.util.Vector;
import java.util.Enumeration;
import java.util.Iterator;

public class Test164
{
	public static void main(String[] args)
	{
		// 벡터 자료구조 인스턴스 생성
		Vector<String> v = new Vector<String>();

		// 벡터 자료구조 v 에 요소 추가
		v.add("Java");
		v.add("Oracle");
		v.add("Jsp");
		v.add("Servlet");
		v.add("Spring");

		// ① Enumeration
		//	  - hasMoreElements()
		//	  - nextElement()
		Enumeration<String> e = v.elements();
		while (e.hasMoreElements())
		{
			System.out.println(e.nextElement());
		}
		System.out.println();
		//--==>> Java
		//		 Oracle
		//		 Jsp
		//		 Servlet
		//  	 Spring


		System.out.println("----------------------------------------");

		// ② Iterator
		//	  - hasNext()
		//	  - next()
		Iterator<String> it = v.iterator();
		while (it.hasNext())
		{
			System.out.println(it.next());
		}
		System.out.println();
		//--==>> Java
		//		 Oracle
		//		 Jsp
		//		 Servlet
		//		 Spring

	}
}