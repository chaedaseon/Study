/*==================================
  ■■■ 컬렉션 (Collection) ■■■
===================================*/

// Set → HashSet, TreeSet, ...
// ·순서 없음
// ·중복 허용하지 않는 구조(기본)

/*
○ HashSet<E> 클래스

   java.util.HashSet<E> 클래스는
   Set 인터페이스를 구현하는 클래스로
   순서의 개념이 아니라 집합의 개념으로 이해해야 하는 자료구조이다.
   이로 인해 데이터의 중복을 허용하지 않는다.
   또한, 동기화를 지원하지 않는다.  
*/

import java.util.Set;
import java.util.HashSet;

public class Test168
{
	public static void main(String[] args)
	{	
		// Set 자료구조 생성
		//Set ob = new Set();			Set은 인터페이스이므로 이렇게 생성할 수 없다.
		Set<String> dog = new HashSet<String>();

		// dog 라는 Set 자료구조에 요소 추가
		dog.add("리트리버");
		dog.add("푸들");
		dog.add("말티즈");
		dog.add("불독");
		dog.add("진돗개");
		
		// 기존 데이터 Set 출력
		System.out.print("기존 데이터 Set : ");
		for (String s : dog)
				System.out.print(s + " " );
		System.out.println();
		//--==>> 기존 데이터 Set : 리트리버 진돗개 푸들 불독 말티즈		→ 넣은 순서는 상관없이 출력
		//-- 순서가 의미 없는 자료구조이기 때문에
		//   데이터 입력 순서 → 자료구조의 요소 격납 순서
		//   이들이 서로 관계없이 구성되어 있는 것을 확인할 수 있다.

		// 데이터(요소) 추가
		dog.add("진돗개");
		dog.add("진돗개");
		dog.add("불독");
		dog.add("시베리안허스키");
		dog.add("비글");
		dog.add("리트리버");
		dog.add("푸들");
		dog.add("푸들");
		dog.add("말티즈");

		// 추가 후 데이터 Set 출력
		System.out.print("추가 후 데이터 Set : ");
		for (String s : dog )
			System.out.print(s + " ");
		System.out.println();
		//--==>> 추가 후 데이터 Set : 리트리버 진돗개 시베리안허스키 푸들 불독 말티즈 비글
		
		// ※ 데이터가 추가되는 순서와 상관없이 목록이 구성되어 있으며
		//    같은 데이터가 여러 번 반복 추가될 경우
		//	  이들 중 하나만 유효한 데이터로 구성되어 있는 것을 확인할 수 있다.
		//	  (아무리 추가해도 한 번만 확인 출력됨)

		// ※ 또한, 자료구조의 특성 상
		//	  중복 데이터를 허용하지 않는다고 해서
		//	  중복된 데이터를 추가할 경우
		//	  에러가 발생한다는 의미는 아니라는 것도 확인할 수 있다.		
	}
}