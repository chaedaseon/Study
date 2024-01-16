/*==========================
  ■■■ 클래스 고급 ■■■
  - 상속 (Inheritance)
=============================*/

// 다음과 같은 프로그램을 구현한다.
// 단, 상속의 개념을 적용하여 작성 할 수 있도록 한다.

// 실행 예)
// 임의의 두 정수 입력 (공백구분) : 
// 연산자 입력 (+ - * /) :
// >> 20 - 10 = 10.00
// 계속하려면 아무키나 누르세요

import java.util.Scanner;
import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;

class Aclass
{
	protected int x, y;
	protected char op;

	Aclass()
	{
		
	}

	void write(double result)
	{
		System.out.printf("\n >> %d %c %d = %.2f\n", x, op, y, result);
	}
}

/*
//Aclass를 상속 받는 클래스로 설계
class Bclass extends Aclass
{	

	// 사용자의 값을 입력 받는 기능을 하는 메소드
	void input() throws IOException
	{	
		// Scanner 클래스 인스턴스 생성
		Scanner sc = new Scanner(System.in);
		System.out.print("임의의 두 정수 입력(공백구분) : ");
		x = sc.nextInt();
		y = sc.nextInt();
		System.out.print("연산자 입력 (+ - * /) : ");
		op = (char)System.in.read();
	}

	double result()
	{
		double r=0;
		if (op == '+')
			r = x + y;
		else if (op == '-')
			r = x - y;
		else if (op == '*')
			r = x * y;
		else if (op == '/')
			r = (double)x / y;
		else 
			System.out.println("잘못된 연산자 입니다!!");

		return r;
	}
	
	void print(double r)
	{
		write(r);
	}
	
}
*/

//Aclass를 상속 받는 클래스로 설계
class Bclass extends Aclass
{
	/* 상속 받음
	
	protected int x, y;
	protected char op;

	void write(double result)
	{
		System.out.printf("\n >> %d %c %d = %.2f\n", x, op, y, result);
	}
	
	*/

	Bclass()
	{
		// super();								// 자식으로써 부모클래스를 메모리에 넣는 책임 중 하나
	}
	
	//void input()								// 원래 쓰던 거
	boolean input()	throws IOException			// 이렇게도 가능하다~ 라는 걸 보기
	{
		//Scanner sc = new Scanner(System.in);
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		System.out.print("임의의 두 정수 입력(공백구분) :");				// "20 10"
		String temp = br.readLine();

		// ※ 문자열.split("구분자");
		//	  문자열.split("\\s");			// -- 구분자 → 공백(\s)
		//
		//	ex) "10 20 30 40 50".split("\\s");
		//		→ 반환 →{"10", "20", "30", "40", "50"}
		//	ex) "010-1234-5678".split("-");
		//		→ 반환 →{"010", "1234", "5678"};

		String[] strArr = temp.split("\\s");				// "20 10" → String[] strArr = {"20", "10"};

		//if (temp.length() != 2)
		if (strArr.length != 2)
			return false;
		
		// -- false 를 반환하여 input() 메소드 종료
		//	  이 조건을 만족하여 if문을 수행하게 될 경우
		//	  아래 수행해야 할 코드가 남아있더도
		//	  결과값(→false)을 반환하여 메소드는 종료된다.

		x = Integer.parseInt(strArr[0]);
		y = Integer.parseInt(strArr[1]);

		// this.x = Integer.parseInt(strArr[0]);
		// super.x = Integer.parseInt(strArr[0]);
		// 다 같은 의미이다.

		System.out.print("연산자 입력 (+ - * /) : ");
		op = (char)System.in.read();
		
		/*
		if (op != '+' && op != '-' && op != '*' && op != '/')
		{
			return false;
		}
	
		return true;
		*/
		
		if (op =='+' || op == '-' || op == '*' || op == '/')
		{
			return true;
		}
		return false;

	}// and input()

	double calc()
	{
		double result = 0;
	
		switch (op)
		{
		case '+': result = x + y; break;
		case '-': result = x - y; break;
		case '*': result = x * y; break;
		//case '/': result = x / y; break;
		//case '/': result = x / y; 
		case '/': result = (double)x / y; 

		}
		
		return result;
	}// end calc()

	/*	 물려 받은 출력문이 잇으니까 출력문 구성 안해도 됨
	print()
	{
		
	}
	*/
}

//main() 메소드를 포함하고 있는 외부의 다른 클래스
public class Test113
{
	public static void main(String[] args) throws IOException
	{	
		/*
		// Bclass 클래스 인스턴스 생성
		Bclass ob = new Bclass();
		ob.input();
		double a = ob.result();
		ob.print(a);
		*/

		//Bclass 클래스 인스턴스 생성
		Bclass ob = new Bclass();
		
		// 밑 세가지 코드는 모드 같은 의미 
		//ob.input();
		/*
		boolean resp = ob.input();
		
		if (resp != true)
		{
			System.out.println("Error....");
			return;								//-- 프로그램 종료
		}
		*/
		/*
		boolean resp = ob.input();
		
		if (!resp)
		{
			System.out.println("Error....");
			return;								//-- 프로그램 종료
		}
		*/
		
		if (!ob.input())
		{
			System.out.println("Error....");
			return;								//-- 프로그램 종료
		}

		double result = ob.calc();

		ob.write(result);
		
		


	}
}

//실행결과
/*
임의의 두 정수 입력(공백구분) : 3 5
연산자 입력 (+ - * /) : +

 >> 3 + 5 = 8.00
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백구분) :86 52
연산자 입력 (+ - * /) : /

 >> 86 / 52 = 1.65
계속하려면 아무 키나 누르십시오 . . .

임의의 두 정수 입력(공백구분) :50 8
연산자 입력 (+ - * /) : =
Error....
계속하려면 아무 키나 누르십시오 . . .




*/