/*=============================================
  ■■■ 자바의 기본 프로그래밍 ■■■
  - 변수와 자료형
  - 자바의 기본 입출력 : BufferedReader 클래스 
=============================================*/

// 사용자로부터 이름, 국어점수, 영어점수, 수학점수를 입력받아
// 이름과 총점을 출력하는 프로그램을 구현한다.

// 실행 예) 
// 이름을 입력하세요 : 김민지
// 국어 점수 입력 : 90
// 영어 점수 입력 : 80
// 수학 점수 입력 : 70

// === [결과] ===
// 이름 : 김민지
// 총점 : 240
// 계속하려면 아무키나 누르세요...


		
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class Test014
{
	public static void main(String[] args) throws IOException //throws IOException
	{
		// 내가 풀이한 내용 -----------------------------------------------------------
		/*
		// 주요 변수 선언 및 초기화 
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

		String name;			//이름 변수 
		int kor;				//국어 점수
		int eng;				//영어 점수
		int mat;				//수학 점수
		int a;					//총점


		// 연산 및 처리 
		System.out.print("이름을 입력하세요 : ");
		name = br.readLine();
		System.out.print("국어 점수 입력 : ");
		kor = Integer.parseInt(br.readLine());
		System.out.print("영어 점수 입력 : ");
		eng = Integer.parseInt(br.readLine());
		System.out.print("수학 점수 입력 : ");
		mat = Integer.parseInt(br.readLine());
	
		a = kor + eng + mat;	

		// 결과 출력
		System.out.println("\n ==== [결과]==== ");
		System.out.println("이름 : " + name);
		System.out.println("총점 : " + a);
		*/
		//실행 결과 
		/*
		이름을 입력하세요 : 김민지
		국어 점수 입력 : 100
		영어 점수 입력 : 100
		수학 점수 입력 : 100

		 ==== [결과]====
		이름 : 김민지
		총점 : 300
		계속하려면 아무 키나 누르십시오 . . .
		*/	

		//---------------------------------------------------------------------------- 

		//------------짝꿍이 입력한 코드----------------------------------------------
		 /*
		 int a, b, c, sum;
		 String nm;

		 System.out.print("이름을 입력하세요 : ");
		 nm = br.readLine();

		 System.out.print("국어 점수 입력 : ");
		 a = Integer.parseInt(br.readLine());
      
		 System.out.print("영어 점수 입력 : ");
		 b = Integer.parseInt(br.readLine());

		 System.out.print("수학 점수 입력 : ");
		 c = Integer.parseInt(br.readLine());

		 sum = a + b + c;

		 System.out.println();
		 System.out.println("===[결과]===");
		 System.out.println("이름 : " + nm);
		 System.out.printf("총점 : %d%n", sum);

	  */

	  
      // 실행 결과

      /*
      이름을 입력하세요 : 채다선
      국어 점수 입력 : 90
      영어 점수 입력 : 80
      수학 점수 입력 : 70

      ===[결과]===
      이름 : 채다선
      총점 : 240
      계속하려면 아무 키나 누르십시오 . . .*/

	 //------------------------------------------------------------------------------

	 // 수업하며 함께 풀어본 내용 ---------------------------------------------------

	 //주요 변수 선언 

	 //BufferedReader 인스턴스 생성
	 //BufferedReader br. new BufferedReader(new InputStreamReader(System.in));

	 //↓ 이런식으로도 사용 할 수 있다는 점을 알고있기!!!
	 InputStreamReader isr = new InputStreamReader(System.in);
	 BufferedReader br = new BufferedReader(isr);

	String strName;				// -- 이름 변수 
	int nKor,nEng, nMat;		// -- 국어 점수, 영어 점수, 수학 점수 변수 
	int nTot;					// -- 총점 변수
	String strTemp;				// -- 문자열 임시 저장 변수

	// 연산 및 처리
	// - 사용자에게 안내 메세지 출력(이름 입력 안내)
	System.out.print("이름을 입력하세요: ");

	// - 사용자가 입력한 값(외부 데이터)을 변수에 담아내기
	strName = br.readLine();

	// - 사용자에게 안내 메세지 출력 (국어 메세지 입력)
	System.out.print("국어 점수 입력 : ");

	// - 사용자가 입력한 값(외부 데이터)을 변수에 담아내기 
	strTemp = br.readLine();

	// - 담아낸 데이터를 변환한 후 필요한 변수에 다시 담기 
	nKor = Integer.parseInt(strTemp);

	// - 사용자에게 안내 메세지 출력(영어 점수 안내)
	System.out.print("영어 점수 입력 : ");

	// - 사용자가 입력한 값(외부 데이터)을 변수에 담아내기
	strTemp = br.readLine();

	// - 담아낸 데이터를 변환한 후 필요한 변수에 다시 담기
	nEng = Integer.parseInt(strTemp);

	// - 사용자에게 안내 메세지 출력(수학 점수 안내)
	System.out.print("수학 점수 입력 : ");

	// - 사용자가 입력한 값(외부 데이터)을 변수에 담아내기
	strTemp = br.readLine();

	// - 담아낸 데이터를 변환한 후 필요한 변수에 다시 담기
	nMat = Integer.parseInt(strTemp);

	// - 각 점수 변수에 담겨있는 데이터(사용자가 입력한 데이터)들을
	//	 종합하여 총점을 산출하고 그 결과를 총점 변수에 담아내기
	nTot = nKor + nEng + nMat;

	//결과출력
	System.out.println("=====결과=====");
	//System.out.println("이름 : " + strName);
	System.out.printf("이름 : %s\n" ,strName);
	System.out.println("총점 : " + nTot);
	//System.out.ptintf("총점 : %d\n " ,nTot);

	


	
	 //------------------------------------------------------------------------------
		
	}
}

//실행 결과
/*
	이름을 입력하세요 : 김민지
	국어 점수 입력 : 100
	영어 점수 입력 : 100
	수학 점수 입력 : 100

	 ==== [결과]====
	이름 : 김민지
		총점 : 300
		계속하려면 아무 키나 누르십시오 . . .
*/