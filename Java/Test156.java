/*======================================================
  ■■■ 컬렉션 프레임워크(Collection Framework) ■■■
=======================================================*/

/*
○ 큐(Queue)
	
   큐(Queue)는 선인선출의 FIFO(First Input, First Output) 구조로
   먼저 입력된 자료를 먼저 출력하며
   Queue 인터페이스를 구현한 클래스는 큐와 관련한 다양한 기능을 제공한다.


※ Queue 인터페이스 인스턴스를 생성하기 위해서는
   new 연산자를 이용하여 Queue 인터페이스를 구현한(implements)
   클래스의 생성자를 호출한다.

   ex ) Queue ob = new LinkedList();


○ 주요 메소드

   - E element()
   	 큐의 head 요소를 반환하며 제고하지 않는다.

   - boolean offer(E o)
     지정된 요소를 큐에 삽입한다.

   - E peek()
     큐의 head 요소를 반환하고 삭제하며
	 큐 자료구조가 empty 인 경우 null 을 반환한다.

   - E remove()
     큐의 head 요소를 반환하고 삭제한다.

	
*/

import java.util.Queue;
import java.util.LinkedList;

public class Test156
{
	public static void main(String[] args)
	{
		// Queue 자료구조 생성
		//Queue muQue = new Queue();		이렇게 객체 생성할 수 없다. 왜? 인터페이스니까~
		Queue<Object> myQue = new LinkedList<Object>();

		// 데이터 준비
		String str1 = "강혜성";
		String str2 = "길현욱";
		String str3 = "김경태";
		String str4 = "김다슬";

		// myQue 라는 Queue 자료구조에 데이터 추가
		myQue.offer(str1);
		myQue.offer(str2);
		myQue.offer(str3);
		//myQue.offer(str4);
		boolean test = myQue.offer(str4);
		System.out.println("test : " + test);
		//--==>> test : true

		//System.out.println(myQue);			
		//--==>> [강혜성, 길현욱, 김경태, 김다슬]  → 더미		// 요소 하나하나 직접 접근해서 컨트롤 해야합니다~!
	
		// Queue 자료구조 myQue 에서
		// 요소를 제거하지 않고 head 요소 반환
		System.out.println("값1 : " + (String)myQue.element());				//Object 형으로 나올테니 (String)으로 형변환
		System.out.println("값2 : " + (String)myQue.element());
		System.out.println("값3 : " + (String)myQue.element());
		//--==>> 값1 : 강혜성
		//		 값2 : 강혜성
		//		 값3 : 강혜성 

		System.out.println();				// 개행

		String val;

		// ①
		/*
		// peek()
		//-- 큐의 head 요소 반환. 제거 안함.
		//	 큐가 empty 일 경우 null 을 반환.
		while (myQue.peek() != null)
		{
			// poll()
			//-- 큐의 head 요소 반환. 제거함.
			//	 큐가 empty 일 경우 null 을 반환.
			val = (String)myQue.poll();
			System.out.println("요소 : " + val);
		}
		System.out.println();
		//--==>> 요소 : 강혜성
		//		 요소 : 길현욱
		//		 요소 : 김경태
		//		 요소 : 김다슬
		*/

		// 테스트
		/*
		while (myQue.poll() != null)
		{
			val = (String)myQue.poll();
			System.out.println("요소 : " + val);
		}
		System.out.println();
		//--==>> 요소 : 길현욱
		//		 요소 : 김다슬
		*/

		/* ②
		while (true)
		{
			val = (String)myQue.poll();
			
			if (val==null)
				break;
			else
				System.out.println("요소 : " + val);
		}
		System.out.println();
		//--==>> 요소 : 강혜성
		//		 요소 : 길현욱
		//		 요소 : 김경태
		//		 요소 : 김다슬
		*/

		// ③
		while (!myQue.isEmpty())
		{
			val = (String)myQue.poll();
			System.out.println("요소 : " + val);
		}
		System.out.println();
		//--==>> 요소 : 강혜성
		//		 요소 : 길현욱
		//		 요소 : 김경태
		//		 요소 : 김다슬


	}
}