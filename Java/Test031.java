/*========================================
  ■■■ 실행 흐름의 컨트롤 (제어문) ■■■
  - if 문
  - if ~ else 문
==========================================*/

//1. 프로그램을 작성할때 주어진 조건에 따라
//   분기 방향을 정하기 위해 사용하는 제어문에는
//   if문, if ~ else문, 조건연산자, 복합if문(if문 중첩), switch문이 있다.
//	 

//2. if문은 if다음의 조건이 참일 경우
//   특정 문장을 수행하고자 할 때 사용되는 구문이다.

// 사용자로부터 이름, 국어 점수, 영어 점수, 수학 점수를 입력받아
// 다음과 같은 형태로 출력하는 프로그램을 작성한다.
// 등급은 평균 점수를 기준으로 처리한다.

// 90점 이상			:A
// 80점 이상 90점 미만	:B
// 70점 이상 80점 미만	:C
// 60점 이상 70점 미만	:D
// 60점 미만			:F

//단 BufferedReader를 활용해 데이터를 입력 받을 수 있도록 하며,
// printf()메소드를 통해 출력 할 수 있도록 한다.

//실행 예)
// 이름 입력 : 김민지
// 국어 점수 : 90
// 영어 점수 : 70
// 수학 점수 : 80
// 
// >> 당신의이름은 김정태입니다.
// >> 국어 점수는 90,
// >> 영어 점수는 70
// >> 수학 점수는 80,
// >> 총점은 240이고, 평균은 80.00입니다.
// >> 등급은 B입니다.
// 계속하려면 아무거나 누르세요.....


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;


public class Test031
{
	public static void main(String[] args) throws IOException
	{
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	//---내가 풀어본 내용------------------------------------------------------------------------------
		/*
		//주요 변수 선언
		int kor,eng,mat,tot;		//국어, 영어, 수학, 총점 
		double a;					//평균
		String name;				//이름
		char g;						//등급


		//연산 및 처리

		//사용자에게 값을 입력 받기
		System.out.print(" 이름 입력 : ");
		name = br.readLine();
		System.out.print(" 국어 점수 : ");
		kor = Integer.parseInt(br.readLine());
		System.out.print(" 영어 점수 : ");
		eng = Integer.parseInt(br.readLine());
		System.out.print(" 수학 점수 : ");
		mat = Integer.parseInt(br.readLine());
		
		//총점 구하기 
		tot = kor + eng + mat;
		
		//평균 구하기
		a = tot / 3.0;

		//등급 구하는 조건문 작성하기 
		if (a >= 90)
		{
			g = 'A';
		}
		else if (80 <= a && a < 90)
		{
			g = 'B';
		}
		else if (70<= a && a < 80)
		{
			g = 'C';
		}
		else if (60<= a && a <70)
		{
			g = 'D';
		}
		else 
		{
			g = 'F';
		}
	
		//결과 출력 
		System.out.printf("\n >> 당신의 이름은 %s 입니다.\n" , name);
		System.out.printf(" >> 국어 점수는 %d,\n" ,kor);
		System.out.printf(" >> 영어 점수는 %d, \n",eng);
		System.out.printf(" >> 수학 점수는 %d, \n",mat);
		System.out.printf(" >> 총점은 %d이고, 평균은 %.2f입니다.\n", tot, a);
		System.out.printf(" >> 등급은 %c입니다.\n" , g);
	*/
	//----------------------------------------------------------------------------------------------

	//---수업 하며 같이 풀어 본 내용 ---------------------------------------------------------------
	
	// 1. 사용자로부터 이름을 입력받는다.
	System.out.print("이름 입력 : ");
	String strName = br.readLine();
	
	// 2. 사용자로부터 국어, 영어, 수학 점수를 입력 받는다.
	System.out.print("국어 점수 : ");
	String strKor = br.readLine();
	System.out.print("영어 점수 : ");
	String strEng = br.readLine();
	System.out.print("수학 점수 : ");
	String strMat = br.readLine();

	// 3. 문자열 형태로 입력받은 과목 점수를 정수 형태로 변환한다.
	int nKor = Integer.parseInt(strKor);
	int nEng = Integer.parseInt(strEng);
	int nMat = Integer.parseInt(strMat);

	// 4. 산술 연산을 통해 총점과 평균을 계산한다.
	int nTot = nKor + nEng + nMat;						//--총점
	double fAvg = nTot / 3.0;							//--평균 
	
	// 5. 등급에 대한 조건 검사를 수행한다.
	char grade;

	if (fAvg >= 90)				
	{
		grade = 'A';
	}
	//else if (fAvg >= 80 && fAvg < 90)
	else if (fAvg >= 80 )					//평균이 90점 미만이라는 조건 포함
	{
		grade = 'B';
	}	
	else if (fAvg >=70)						//평균이 80점 미만이라는 조건 포함
	{
		grade = 'C';
	}
	else if (fAvg >=60)						//평균이 70점 미만이라는 조건 포함
	{
		grade = 'D';
	}
	else
	{
		grade ='F';
	}

	// ※ if ~ else 문에서 마지막이 else로 끝나지 않고 else if로 끝나면 컴파일 에러가 발생하는데
	//    사용되는 변수에 초기화 값(ex> char grade = 'F')이 들어있다면 else if로 끝나도 에러가 나지 않는다. 

	// 6. 최종 결과 출력
	System.out.printf(" \n >> 당신의 이름은 %s 입니다.\n" , strName);
	System.out.printf(" >> 국어 점수는 %s \n" , strKor);
	System.out.printf(" >> 영어 점수는 %s \n", strEng);
	System.out.printf(" >> 수힉 점수는 %s \n", strMat);
	System.out.printf(" >> 총점은 %d이고, 평균은 %.2f입니다. \n" , nTot,fAvg);
	System.out.printf(" >> 등급은 %c 입니다.", grade);


	//----------------------------------------------------------------------------------------------
	}
}

//실행 결과
/*
이름 입력 :  김민지
국어 점수 : 80
영어 점수 : 70
수학 점수 : 56

 >> 당신의 이름은  김민지 입니다.
 >> 국어 점수는 80,
 >> 영어 점수는 70,
 >> 수학 점수는 56,
 >> 총점은 206이고, 평균은 68.00입니다.
 >> 등급은 D입니다.
계속하려면 아무 키나 누르십시오 . . .

 이름 입력 : 김민지
 국어 점수 : 88
 영어 점수 : 95
 수학 점수 : 87

 >> 당신의 이름은 김민지 입니다.
 >> 국어 점수는 88,
 >> 영어 점수는 95,
 >> 수학 점수는 87,
 >> 총점은 270이고, 평균은 90.00입니다.
 >> 등급은 A입니다.
계속하려면 아무 키나 누르십시오 . . .

*/

