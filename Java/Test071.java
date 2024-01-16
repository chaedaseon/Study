/*======================================
	■■■ 클래스와 인스턴스 ■■■
	 → 
  ======================================*/


// ※ CircleTest.java 파일과 한세트~~!!

// 원의 넓이와 둘레 구하기
// 원의 넓이와 둘레를 구할 수 있는 클래스를 설계한다.
// 클래스명 (CircleTest)
// 입력은 BufferedReader 의 readLine()

// 원의 넓이 = 반지름 * 반지름 * 3.141592
// 원의 둘레 = 반지름 * 2 * 3.141592

// 실행 예) 
// 반지름 입력 : 

// >> 반지름이 xxx인 원의
// >> 넓이 : xxx.xx
// >> 둘레 : xx.xx
// 계속하려면 아무키나 누르세요


import java.io.IOException;

public class Test071
{
	public static void main(String[] args) throws IOException
	{
	/*
	//CircleTest 클래스 기반의 인스턴스 생성(객체생성)
	CircleTest ob = new CircleTest();
	
	// 입력 메소드 호출
	ob.input();

	// 넓이 메소드 호출
	double area = ob.cirArea();

	// 둘레 메소드 호출
	double length = ob.cirLength();


	// 출력 메소드 호출
	ob.print(area, length);
	*/

	// CircleTest 클래스 기반의 인스턴스 생성
	// CircleTest 인스턴스 생성
	// CircleTest 객체 생성
	
		CircleTest ob = new CircleTest();

		ob.input();
		
		double num1 = ob.calArea();

		double num2 = ob.calLength();

		ob.print(num1, num2);
		


	}
 
}

//실행결과

/*

반지름 입력 : 5

 >> 반지름이 5인 원의
 >> 넓이 : 78.5398
 >> 둘레 : 31.41592
계속하려면 아무 키나 누르십시오 . . .

반지름 입력 : 256

 >> 반지름이 256인 원의
 >> 넓이 : 205887.373312
 >> 둘레 : 1608.495104
 계속하려면 아무 키나 누르십시오 . . .


*/