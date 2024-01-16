/*====================================================================================
   ■■■ 클래스와 인스턴스 ■■■
   - 정보 은닉과 접근제어지시자 (접근지시자, 접근 제어자, 접근 지정자, 접근 제한자 …)
  ===================================================================================*/

// 현재 CireleTest2 와 Test098은 같은 『패키지』 안에 있다.

import java.util.Scanner;

class CircleTest2
{	
	// 멤버 변수, 인스턴스 변수, 전역 변수
	//int num;

	//	↓

	// 정보 은닉(information Hiding)
	// 『private』이라는 접근제어지시자의 선언은
	// 클래스 내부에서만 접근 및 참조가 가능하게 하겠다는 의미
	// int형 전역 변수 → 자동으로 0으로 초기화 지원

	private int num;

	//getter / setter 구성

	/*
	public int getNum()
	{
		return num;
	}


	public setNum(int num)
	{
		this.num = num;
	}
	
	*/

	public void input()
	{
		Scanner sc = new Scanner(System.in);

		System.out.print("반지름 입력 : ");
		num = sc.nextInt();
	}

	public double calArea()
	{
		return num * num * 3.141592;
	}

	public void write(double area)
	{
		System.out.println(">> 반지름 : " + num);
		System.out.println(">> 넓이 : " + area);
	}
}


public class Test098
{
	public static void main(String[] args)
	{	
		//CircleTest2의 인스턴스 생성
		CircleTest2 ob1 = new CircleTest2();

		//ob1.num = 10;
		//	  ↓
		//ob1.setNum(10);
		
		//System.out.println("원의 반지름 : " + ob1.num);
		//			   ↓
		//System.out.println("원의 반지름 : " + ob1.getNum());


		// ※ 현재로써는 유일하게 
		//	  CircleTest2의 num 데이러를 전달할 수 있는 방법
		ob1.input();
		//--==>> 반지름 입력 : 500
		//		 『ob1.num = 500;』
	
		double result = ob1.calArea();

		ob1.write(result);
		
	}
}

//실행 결과
/*
반지름 입력 : 500
>> 반지름 : 500
>> 넓이 : 785398.0
계속하려면 아무 키나 누르십시오 . . .
*/