/*====================================================================
  ■■■ 클래스와 인스턴스 ■■■
- 메소드 오버로딩(Method Overloading)이 가능한 형태와 불가능한 형태
====================================================================*/

public class Test104
{
	public static void main(String[] args)
	{
		print('A');

		print(20);


		print(3.14);

		double result = print(3.14);
	}

	public static void print() {}
	//public static void print() {}							//--(Ⅹ)
	public static void print(int i) {}	
	//public static void print(int j) {}					//--(Ⅹ)
	public static void print(char c) {}						//-- 자동 형 변환 규칙 check~!!! → char에서 int로 자동 형 변환될 수 있어 조심해서 써야함
	public static void print(int i, int j) {}
	public static void print(double d) {}					//-- 자동 형 변환 규칙 check~!!! → int에서 double로 자동 형 변환될 수 있어 조심해서 써야함
	//public static void print(double e) {return 10.0}		//--(Ⅹ) → return으로 실수형을 반환하는데 void라서 정의 자체가 불가
	//public static double print(double e) {return 10.0}	//--(Ⅹ) check~!!! → 문번호25

}