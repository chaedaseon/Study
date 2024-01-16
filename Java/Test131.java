/*============================================
  ■■■ 자바의 주요(중요) 클래스 ■■■
  - 자바에서 기본적으로 제공하는 주요 클래스들
  - Wrapper 클래스
==============================================*/

public class Test131
{
	public static void main(String[] args)
	{
		boolean bi = true;
		Boolean wrapBi = new Boolean(bi);		// 인스턴스 생성
		Boolean wBi = bi;						// -- 오토 박싱

		int n = 300;
		Integer wrapN = new Integer(n);
		int n2 = wrapN;							// -- 오토 언박싱
		
		float f = 300.3f;						// f 안붙이면 double로 표현되기 떄문에 안됨
		Float wrapF = new Float(f);

		System.out.println(wrapBi.toString());
		System.out.println(wrapN.toString());
		System.out.println(wrapF.toString());
		//--==>> true
		//		 300
		//		 300.3
		
		System.out.println(wrapBi);
		System.out.println(wrapN);
		System.out.println(wrapF);
		//--==>> true
		//		 300
		//		 300.3
		
		//Integer 클래스
		String sn = "12";
		int ni = Integer.parseInt(sn);
		System.out.println("ni : " + ni);
		//--==>> ni : 12

		ni = Integer.parseInt("0101",2);
		System.out.printf("ni : %3d\n" , ni);
		//--==>> ni :   5 

		ni = Integer.parseInt("12",8);
		System.out.printf("ni : %3d\n" , ni);
		//--==>> ni :  10

		ni = Integer.parseInt("A",16);
		System.out.printf("ni : %3d\n" , ni);
		//--==>> ni :  10


		//toXxxx → 대부분 뭔갈 변환 해주는 메소드 
		//isXxxx → 대부분 뭐가를 맞는지 아닌지  메소드

		sn = Integer.toBinaryString(20);	//2진수로 변환 해주는 메소드
		System.out.printf("sn : %s\n", sn);
		//--==>> sn : 10100	
		
		sn = Integer.toOctalString(31);		//8진수로 변환 해주는 메소드
		System.out.printf("sn : %s\n", sn);
		//--==>> sn : 37

		sn = Integer.toHexString(31);		//16진수로 변환 해주는 메소드
		System.out.printf("sn : %s\n", sn);
		//--==>> sn : 1f

		Integer num = new Integer(50);
		System.out.println("num.toString() : " + num.toString());
		//--==>> num.toString() : 50		// 문자열 타입임!!!! 

		int n3 = 345;
		Integer n4 = Integer.valueOf(n3);
		System.out.println("n4 : " + n4);
		//--==>> n4 : 345					//Integer타입!


	}
}