/*======================================================
  ■■■ 컬렉션 프레임워크(Collection Framework) ■■■
=======================================================*/

import java.util.Stack;

public class Test155
{
	// 정적 문자열 배열 선언 및 초기화
	private static final String[] colors = {"검정", "노랑", "초록", "파랑", "연두"};
	
	// 생성자
	public Test155()
	{
		// st라는 Stack 자료구조 생성
		// 제너릭을 활용하여 자료구조에 담기는 데이터에 대한 표현 → 『<String>』
		 Stack<String> st = new Stack<String>();

		 // st 라는 Stack 자료구조에 데이터(colors) 담기
		 //st = colors;					// 이렇게 담아내는거 아님!!
			
		 /*
		 st.push(colors[0]);		// st.add(colors[0]);  이렇게도 담을 수 있음!
		 st.push(colors[1]);		// st.add(colors[1]);
		 st.push(colors[2]);		// st.add(colors[2]);
		 st.push(colors[3]);		// st.add(colors[3]);
		 st.push(colors[4]);		// st.add(colors[4]);
		 st.push(colors[5]);		// st.add(colors[5]);
		 */
		
		 /*
		 for (int i=0; i<colors.length; i++)
		 {
			 st.push(colors[i]);	// st.add(colors[i]);  동일한 구문~!
		 }
		 */

		 // 향상된 for each문으로 다시 작성해보기~! 위 for 문이랑 동일한 의미
		 for (String color : colors )
		 {
			 st.push(color);		//st.add(colors);
		 }

		 //st.push(10.0);				제너릭으로 String을 담겠다고 선언했기 때문에  String이 아니면 담을 수 없다.
		 //st.push(10);
		 //--==>> 에러 발생(컴파일 에러)
		 //-- 제너릭 표현식을 통해 선언하고 있는
		 //	  String 이 아닌 다른 자료형(double 이나 int)을
		 //	  스택 자료구조 st에 push() 하려고 했기 때문에....

		 st.push("보라");				// 이건 String이라 담을 수 있다.!

		 // 출력 메소드 호출
		 popStack(st);
		 
	 }

	// 출력 메소드
	private void popStack(Stack<String> st)		// 동일한 이름인 st를 다시 쓸 수 있다.
	{
		System.out.print("pop : ");
		//System.out.println(st);				// 이렇게 쓰면 안된다.
		while (!st.empty())						// empty() = isEmpty()랑 동일~!  
		{
			System.out.print(st.pop() + " " );
		}
		System.out.println();
		
	}

	public static void main (String[] args)
	{
		new Test155();
	}
}

// 실행 결과

// pop : 연두 파랑 초록 노랑 검정

// pop : 보라 연두 파랑 초록 노랑 검정