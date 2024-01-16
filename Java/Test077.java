/*======================================
	■■■ 클래스와 인스턴스 ■■■
	→ 생성자 (Constructor)
  ======================================*/

public class Test077
{
	int val1;
	double val2;

	Test077()
	{
		val1=0;
		val2=0;
		System.out.println("매개변수 없는 생성자 ....");

	}
	
	//Test077(int x)
	Test077(int val1)
	{
		//val1 = x
		this.val1=val1;
		val2=0;
		System.out.println("int형 데이터를 넘겨 받는 생성자...");

	}
	//Test077(double y)
	Test077(double val2)
	{
		val1=0;
		//vla2 = y
		this.val2=val2;
		System.out.println("double 형 데이터를 넘겨 받는 생성자...");

	}
	//Test077(int x , double y)
	Test077(int val1, double val2)
	{	
		//val1 = x
		//val2 = y
		this.val1=val1;
		this.val2=val2;
		System.out.println("int형 데이터와 double형 데이터를 넘겨 받는 생성자...");
		
	}
	

	
	public static void main(String[] args)
	{
		Test077 ob1 = new Test077();
		System.out.println(ob1.val1 + ", " + ob1.val2);

		Test077 ob2 = new Test077(4);
		System.out.println(ob2.val1 + ", " + ob2.val2);

		Test077 ob3 = new Test077(7.0);
		System.out.println(ob3.val1 + ", " + ob3.val2);

		Test077 ob4 = new Test077(4, 7.0);
		System.out.println(ob4.val1 + ", " + ob4.val2);

	}
}

//실행 결과
/*

매개변수 없는 생성자 ....
0, 0.0
int형 데이터를 넘겨 받는 생성자...
4, 0.0
double 형 데이터를 넘겨 받는 생성자...
0, 7.0
int형 데이터와 double형 데이터를 넘겨 받는 생성자...
4, 7.0
계속하려면 아무 키나 누르십시오 . . 

*/