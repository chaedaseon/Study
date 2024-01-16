
/*======================================
	■■■ 클래스와 인스턴스 ■■■
  ======================================*/

//Test071.java와 한세트~~!!!

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

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;
/*
public class CircleTest	
{
	
	//BufferedReader br = new BufferedReader(new InputStreamReader(System.in));			// 여기 있으면 안됨!!! 잘못 된거임!!!!
	int n;			// 원의 반지름
		
	
	void input() throws IOException			//IOException 위치 check~~~~!!!!!!!!!!★★
	{
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	System.out.print("반지름 입력 : ");
	n = Integer.parseInt(br.readLine());
	}

	double cirArea()						// 원의 넓이
	{
		return  ((n * n) * 3.141592);
	}

	double cirLength()						// 원의 둘레
	{
		return  ((n * 2) * 3.141592);
	}
	
	//결과 출력
	void print(double a, double b)
	{
	System.out.println();
	System.out.printf(" >> 반지름이 %d인 원의\n" , n );
	System.out.println(" >> 넓이 : " + a);
	System.out.println(" >> 둘레 : " + b);
	}

	
}
*/


public class CircleTest	
{
	// 주요 속성(데이터, 상태)  →	멤버 변수
	int r;						// -- 반지름
	final double PI = 3.141592;	// -- 원주율(변수의 상수화)

	// 주요 기능 (동작, 행위)	→	멤버 메소드
	
	//반지름 입력 기능
	void input() throws IOException
	{	
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("반지름 입력 : ");
		r = Integer.parseInt(br.readLine());
	}

	// 넓이 계산 기능
	double calArea()
	{
		//원의 넓이 = 반지름 * 반지름 * 3.141592
		return r * r * PI;
	}

	// 둘레 계산 기능
	double calLength()
	{
		double result;

		//원의 둘레 = 반지름 * 2 * 3.141592
		result = r * 2 * PI;

		return result;
	}

	// 결과 출력 기능 
	void print(double a, double l)
	{

	// >> 반지름이 xxx인 원의
	// >> 넓이 : xxx.xx
	// >> 둘레 : xx.xx

	System.out.printf("\n >> 반지름이 %d인 원의 \n", r);
	System.out.printf(" >> 넓이 : %2f \n" , a);
	System.out.printf(" >> 둘레 : %2f \n ", l);
	}

}