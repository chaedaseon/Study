/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - switch문 실습 
  ==========================================*/

  // 사용자로부터 임의의 두 정수와 연산자를 입력받아
  // 해당 연산자와 연산 처리 결과를 출력하는 프로그램을 구현한다.
  // 단, switch문을 활용하여 처리 할 수 있도록 한다.
  // 연산 결과는 편의상 정수 형태로 처리 할 수 있도록 한다.

  // 실행 예)
  // 첫 번째 정수 입력		: 
  // 두 번째 정수 입력		:
  // 연산자 입력[+ - * /]	:

  // >> 3 - 17 = -14
  // 계속하려면 아무키나 누르세요...

  import java.io.BufferedReader;
  import java.io.InputStreamReader;
  import java.io.IOException;


public class Test042
{
	public static void main(String[] args)	throws IOException
	{

		// 내가 작성한 코드 ------------------------------------------------------------------------------------------------
		/*
		// 주요 변수 선언
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		int num1, num2;								//사용자가 입력한 임의의 정수
		char op;									//사용자가 입력한 연산자

		// 연산 및 처리
		System.out.print("첫 번째 정수 입력	:");
		num1 = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력	:");
		num2 = Integer.parseInt(br.readLine());
		System.out.print("연산자 입력 [+ - * /] :");
		op = (char)System.in.read();
	
		switch (op)
		{
		case'+': System.out.printf("\n>> %d + %d = %d \n", num1, num2, (num1+num2)); break;
		case'-': System.out.printf("\n>> %d - %d = %d \n", num1, num2, (num1-num2)); break;
		case'*': System.out.printf("\n>> %d * %d = %d \n", num1, num2, (num1*num2)); break;
		case'/': System.out.printf("\n>> %d / %d = %d \n", num1, num2, (num1/num2)); break;
		default: System.out.println("연산자가 잘못 입력 됐습니다.");
		}
		*/

		//실행 결과 
		/*
		첫 번째 정수 입력       :5
		두 번째 정수 입력       :10
		연산자 입력 [+ - * /] :+

		>> 5 + 10 = 15
		계속하려면 아무 키나 누르십시오 . . .
		*/

		/*
		첫 번째 정수 입력       :5
		두 번째 정수 입력       :1
		연산자 입력 [+ - * /] :=
		
		연산자가 잘못 입력 됐습니다.
		계속하려면 아무 키나 누르십시오 . . .
		*/
		// -----------------------------------------------------------------------------------------------------------------

		// 수업하며 함께 작성한 코드 ---------------------------------------------------------------------------------------

		
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		// ③
		int a, b, result;
		String op;

		System.out.print("첫 번쨰 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력 [+ - * /]: ");
		op = br.readLine();

		switch (op)
		{
		case "+": result = a + b; break;
		case "-": result = a - b; break;
		case "*": result = a * b; break;
		case "/": result = a / b; break;
		default: return;
		
		}

		System.out.printf("\2n>> %d %s %d = %d\n",a, op, b, result);
		// ①
		/*
		int a,b,result;
		int op;

		System.out.print("첫 번째 정수 입력		: ");
		a = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력		: ");
		b = Integer.parseInt(br.readLine());

		System.out.print ("연산자 입력[+ - * /] :");
		op = System.in.read();

		// +  → 43, - → 45, * → 42, / → 47
		switch (op)
		{
		case 43: result = a + b; break;
		case 45: result = a - b; break;
		case 42: result = a * b; break;
		case 47: result = a / b; break;		
		default: return;				//-- 1. 값의 반환		
										//-- 2. 메소드 종료		→ main() 메소드 종료 → 프로그램 종료!
		}

		System.out.println();
		System.out.printf(" >> %d %c %d = %d\n", a, op, b, result);
		*/
		// ②
		/*
		int a, b, result;
		char op;

		System.out.print("첫 번쨰 정수 입력 : ");
		a = Integer.parseInt(br.readLine());
		System.out.print("두 번째 정수 입력 : ");
		b = Integer.parseInt(br.readLine());

		System.out.print("연산자 입력 [+ - * /]: ");
		op = (char)System.in.read();

		switch (op)
		{
		case '+': result = a + b; break;
		case '-': result = a - b; break;
		case '*': result = a * b; break;
		case '/': result = a / b; break;
		default: return;
		
		}

		System.out.printf("/n>> %d %c %d = %d\n",a, op, b, result);
		*/
		//------------------------------------------------------------------------------------------------------------------
	} 
}

//실행 결과

/*
첫 번쨰 정수 입력 : 5
두 번째 정수 입력 : 20
연산자 입력 [+ - * /]: +
>> 5 + 20 = 25
계속하려면 아무 키나 누르십시오 . . .

첫 번쨰 정수 입력 : 5
두 번째 정수 입력 : 10
연산자 입력 [+ - * /]: =
계속하려면 아무 키나 누르십시오 . . .
*/