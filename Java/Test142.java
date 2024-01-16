/*=============================================
  ■■■ 자바의 기본 프로그래밍 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스
  - Calendar 클래스
==============================================*/

/*
※ Calendar 클래스는 추상 클래스이기 때문에 객체를 생성할 수 없다.
   (추상 클래스 : 미완성된 클래스 → 상속을 위해 존재하는 클래스)

   Calendar ob = new Calendar();
   → 이와 같은 구문을 통해 인스턴스 생성 불가

○ Calendar 클래스 객체(인스턴스)를 생성할 수 있는 방법

   1. Calendar ob1 =  Calendar.getInstance();					// 클래스 메소드 static~~
   
   2. Calendar ob2 = new GregorianCalendar();					// 업 캐스팅 GregorianCalendar 가 자식 클래스라는 것을 알 수 있다. 
   	  //GregorianCalendar gc = new GregorianCalendar();
	  //Calendar ob2 = gc;
	  //Calendar ob2 = (Calndar)gc;

   3. GregorianCalender ob3 = new GregorianCalendar();

   (※ GregorianCalendar : Calendar 클래스의 하위 클래스)
*/


// 연, 월, 일 요일을 Calendar 객체로부터 가져와 출력

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Test142
{
	public static void main(String[] args)
	{
		//Calendar 객체 생성
		//Calendar ob = new Calendar();		// 이거 안됨
		Calendar rightNow = Calendar.getInstance();

		// 생성된 달력(Calendar) 인스턴스를 통해
		// 날짜 관련 정보를 얻어낼 수 있는 메소드 → 『get()』
		
		int y = rightNow.get(Calendar.YEAR);			// YEAR → static final 변수
		System.out.println("y : " + y); 
		//--==>> y : 2023

		int m = rightNow.get(Calendar.MONTH)+1;		//--『+1』 check~~!! 	
		System.out.println("m : " + m);
		//--==>> m : 9

		int d = rightNow.get(Calendar.DATE);
		System.out.println("d : " + d);
		//--==>> d : 19

		int w = rightNow.get(Calendar.DAY_OF_WEEK);
		System.out.println("w : " + w);
		//--==>> w : 3

		// 테스트(확인)
		//System.out.println(Calendar.SUNDAY);		//--==>> 1 → 일요일
		//System.out.println(Calendar.MONDAY);
		//System.out.println(Calendar.TUESDAY);
		//System.out.println(Calendar.WEDNESDAY);
		//System.out.println(Calendar.THURSDAY);
		//System.out.println(Calendar.FRIDAY);
		//System.out.println(Calendar.SATURDAY);

		System.out.println(y + "-" + m +"-"+ d +"-" +w);
		//--==>> 2023-9-19-3

		String week="";
		switch(w)
		{
			//case Calendar.SUNDAY : week = "일요일"; break;
			//case Calendar.MONDAY : week = "월요일"; break;	
			//case Calendar.TUESDAY : week = "화요일"; break;	
			//case Calendar.WEDNESDAY : week = "수요일"; break;	
			//case Calendar.THURSDAY : week = "목요일"; break;	
			//case Calendar.FRIDAY : week = "금요일"; break;	
			//case Calendar.SATURDAY : week = "토요일"; break;	

			case 1 : week = "일요일"; break;
			case 2 : week = "월요일"; break;	
			case 3 : week = "화요일"; break;	
			case 4 : week = "수요일"; break;	
			case 5 : week = "목요일"; break;	
			case 6 : week = "금요일"; break;	
			case 7 : week = "토요일"; break;

		}
		
		System.out.println(y + "-" + m +"-"+ d +"-" +week);
		//--==>> 2023-9-19-화요일
		

		System.out.println("/////////////////////////////////////////////////");

		//Calendar 객체 생성
		Calendar rightNow2 = new GregorianCalendar();

		String[] week2 = {"일요일", "월요일", "화요일", "수요일","목요일","금요일","토요일"};

		// 달력의 날짜 세팅 → 『set()』메소드 활용
		rightNow2.set(2024, 2, 19);		//2024년 03월 19일			//check~!!!

		System.out.println(rightNow2.get(Calendar.DAY_OF_WEEK));
		//--==>> 3

		System.out.println(week2[rightNow2.get(Calendar.DAY_OF_WEEK)-1]);
		//--==>> 화요일


	}
}