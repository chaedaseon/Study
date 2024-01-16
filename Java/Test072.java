/*======================================
	■■■ 클래스와 인스턴스 ■■■
  ======================================*/

// 사용자로부터 임의의 정수를 입력 받아
// 1부터 입력받은 수 까지의 합을 연산하여
// 결과값을 출력하는 프로그램을 구현한다.

// 단, 지금까지처럼 main()메소드에 모든 기능을 적용하는 것이 아니라
// 클래스와 인스턴스의 개념을 활용하여 처리 할 수 있도록 한다.
// Hap 클래스 설계
// 또한, 데이터 입력 처리 과정에서 BufferedReader 의 redaLine()을 사용하며,
// 입력 데이터가 1보다 작거나 1000보다 큰 경우
// 다시 입력 받을 수 있는 처리를 포함하여 프로그램을 구현할 수 있도록 한다

// 실행 예)
// 임의의 정수 입력 (1~1000) : 1200
// 임의의 정수 입력 (1~1000) : -500
// 임의의 정수 입력 (1~1000) : 100
// >> 1부터 100까지의 합  : 5050
// 계속 하려면 아무키나 누르세요...

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

/*
class Hap
{
	int n;												//임의의 정수
											
	// 입력 기능
	void input() throws IOException
	{
		
		do
		{	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			System.out.print("임의의 정수 입력 : ");
			n = Integer.parseInt(br.readLine());
		}
		while (1>n || 1000<n);							//임의의 정수가 1보다 크고 1000보다 작을때까지 반복
	}

	
	// 누적합 계산 기능
	int sum()
	{
		int s=0;										//누적합 변수선언 및 초기화

		for (int i=1; i<=n ; i++)
		{
		
			s +=i;
		}

		return s;
	}
	
	// 결과 출력 기능
	void print(int a)
	{
		System.out.printf("\n>> 1부터 %d까지의 합 : %d\n" ,n, a);
	}

}


public class Test072
{
	public static void main(String[] args) throws IOException
	{
		// Hap클래스 인스턴스 생성
		Hap ob = new Hap();
		
		// 입력 메소드 호출
		ob.input();
		
		// 누적합 메소드 호출
		int result = ob.sum();
		
		// 출력 메소드 호출
		ob.print(result);

		
	}
}
*/

class Hap
{
	//주요 변수 선언(사용자의 입력 값을 담아낼 변수)
	int su;

	// 입력 메소드 정의
	void input() throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		do
		{
			System.out.print("임의의 정수 입력 (1~1000) : ");
			su = Integer.parseInt(br.readLine());
		}
		while (su<1 || su>1000);

	}

	// 연산 처리 메소드 정의
	int calculate()
	{
		int result = 0;
		for (int i=1; i<=su; i++)
		{
			result +=i;
		}

		return result;
	}

	// 결과 처리 메소드 정의

	void print(int sum)
	{
		System.out.printf("\n >> 1부터 %d까지의 합 : %d\n", su, sum);
	}
}


public class Test072
{
	public static void main(String[] args) throws IOException
	{
		//Hap 인스턴스 생성
		Hap ob = new Hap();

		//생성된 인스턴스를 통해 입력 메소드 호출
		//-----------------------
		//     참조 변수 활용
		
		ob.input();							//-- new Hap().input(); 이렇게도 가능~~ 

		// 생성된 인스턴스를 통해 연산 메소드 호출
		int s = ob.calculate();

		// 생성된 인스턴스를 통해 출력 메소드 호출
		//ob.print(ob.calculate.());
		ob.print(s);
	}
}


//실행결과

/*
임의의 정수 입력 : 100

>> 1부터 100까지의 합 : 5050
계속하려면 아무 키나 누르십시오 . . .

임의의 정수 입력 (1~1000) : 1999
임의의 정수 입력 (1~1000) : 665

 >> 1부터 665까지의 합 : 221445
계속하려면 아무 키나 누르십시오 . . .


*/