/*==================================
   ■■■ 클래스와 인스턴스 ■■■
   - 클래스 설계
   - 배열의 활용
   - 접근제어지시자의 정보은닉
  =================================*/

  // 사용자로부터 년, 월, 일을 입력받아
  // 해당 날짜의 요일을 출력하는 프로그램을 구현한다.
  // 단, 달력 클래스(Calender)는 사용하지 않는다.
  // 또한 클래스의 개념을 활용하여 작성 할 수 있도록 한다.
  // (→weekDay 클래스 설계)
  // 그리고, 배열의 개념도 적용시켜 작성 할 수 있도록 한다.
  // 접근제어지시자의 개념도 확인하여 작성할 수 있도록 한다.
  
  // 최종적으로..
  // WeekDay 클래스 설계를 통해 
  // Test099 클래스의 main() 메소드가 정상적으로 프로그램 실행될 수 있도록 한다.

  // 실행 예)
  // 년 월 일 입력(공백구분) : 2023 9 7
  // >> 2023년 9월 7일 → 목요일
  // 계속하려면 아무 키나 누르세요...
  
  // ※ Hint
  //    - 1년 1월 1일 → "월요일"
  //	- 1년은 365일이 아니다. 
  //	  + 2월의 마지막 날짜가 29일 → 윤년
  //	  + 2월의 마지막 날짜가 28일 → 평년
  //	- 윤년 판별 조건
  //	  년도가 4의 배수이면서 100의 배수가 아니거나,
  //	  400의 배수이면 윤년, 그이외의 년도는 평년

import java.util.Scanner;

class WeekDay
{
	// 배열 선언 및 메모리 할당
	String[] arr = {"일요일","월요일","화요일","수요일","목요일","금요일","토요일"};
	int[] dayArr = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	int year,month,day;
	int sum=0;


	// 사용자로부터 년 월 일을 받는 메소드 구성	
	void input()
	{
		Scanner sc = new Scanner(System.in);
		System.out.print("년 월 일 입력(공백 구분) : "); 
		year = sc.nextInt();
		month = sc.nextInt();
		day = sc.nextInt();
	}

	// 올해가 윤년인지 아닌지 판별하기 위한 제어문
	// 윤년은 4의 배수이며, 400의 배수이다. 단, 100의 배수는 평년이다.
	void calYear()	
	{
		if (year%4==0 && year%100!=0)			
		{
			dayArr[1]=29;
		}
		else if (year%400==0)
		{
			dayArr[1]=29;
		}
		else if(year%4!=0)
		{
			dayArr[1]=28;		
		}
			
	}

	//올해까지 있었던 윤년 횟수
	int Count()
	{
		int count=0;
		
		// 윤년일때 count ++;
		for (int i=1; i<year; i++ )
		{
			if (i%4==0 && i%100!=0)		
				count ++;
			else if (i%400==0)
				count++;
		}

		return count;
	}


	// 지금까지 일수 구하기
	int calDay(int a)
	{	
		//작년 *365
		sum = (year-1) * 365;
		
		//이번달 제외하고 더하기
		for (int i=0; i<month-1; i++)
		{
		 sum += dayArr[i];
		}
		// 데이 더하기
		sum += day;
		// 윤년 횟수 더하기 
		sum += a;
		return sum;
	}


	int data(int aa)
	{
		// 지금까지 구한 일 % 7 → 요일
		return aa%7;
	}


	void print(int i)
	{	
		// 년 월 일 sum 출력 테스트
		//System.out.printf("%d , %d , %d , %d , %d" , year, month, day, a, co);
		
		//년 월 일 요일
		System.out.println(" >> " + year + "년" + month + "월" + day + "일" + " → " + arr[i]);
	}

}




public class Test099
{
	public static void main(String[] args)
	{
		//WeekDay 클래스 인스턴스 생성
		WeekDay ob = new WeekDay();

		// 사용자로부터 입력 값 받기
		ob.input();

		// 올해가 윤년인지 아닌지 확인
		ob.calYear();
		
		// 날짜 계산하기
		int i = ob.data(ob.calDay(ob.Count()));

		// 전체 요소 출력하기
		ob.print(i);
	}
}

//실행 결과
/*

년 월 일 입력(공백 구분) : 2023 09 07
 >> 2023년9월7일 → 목요일
계속하려면 아무 키나 누르십시오 . . .

년 월 일 입력(공백 구분) : 1998 05 28
 >> 1998년5월28일 → 목요일
계속하려면 아무 키나 누르십시오 . . .


*/