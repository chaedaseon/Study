/*========================
	■■■ 배열 ■■■
	→ 배열의 선언과 초기화
	→ 배열의 기본적 활용
  =======================*/

  // 사용자로부터 인원수를 입력받고
  // 입력 받은 인원 수 만큼의 학생 이름과 전화번호를 입력받아
  // 이렇게 입력받은 데이터를 이름 배열과 전화번호 배열로 구성하여
  // 결과를 출력 할 수 있는 프로그램을 구현한다.

  // 실행 예)
  // 입력 처리할 학생 수 입력(명, 1~10) : 17
  // 입력 처리할 학생 수 입력(명, 1~10) : -5
  // 입력 처리할 학생 수 입력(명, 1~10) : 3
  // 이름 전화 번호 입력[1](공백 구분) : 박범구 010-1234-5678
  // 이름 전화 번호 입력[2](공백 구분) : 임재용 010-1235-8975
  // 이름 전화 번호 입력[3](공백 구분) : 오수정 010-3456-4567

  //----------------------------
  // 전체 학생 수 : 3
  //----------------------------
  // 이름		전화번호
  // 박범구		010-1234-5678	
  // 임재용		010-1235-8975
  // 오수정		010-3456-4567
  //----------------------------
  //계속하려면 아무키나 누르세요....

  import java.util.Scanner;
  import java.io.IOException;

public class Test082
{
	public static void main(String[] args) throws IOException
	{
		/*

		//주요 변수 선언
		int n;							//학생 수를 담을 변수
		
		Scanner sc = new Scanner(System.in);
		

		// 사용자로부터 학생 수 입력 받기
		do
		{
			System.out.print("입력 처리할 학생 수 입력 (명, 1~10): ");
			n = sc.nextInt();

		}
		while ( 1> n || n > 10);

		//배열 선언
		String[] arr1;					// 이름 배열 선언
		arr1 = new String[n];

		String[] arr2 = new String[n];	// 전화번호 배열 선언


		// 이름과 전화번호 입력 받기
		for (int s=1, i=0; i<n; s++, i++)
		{
			System.out.printf("이름 전화번호입력 [%d] (공백구분): "  , s );
			arr1[i] = sc.next();						
			arr2[i] = sc.next();
		}
		
		// 결과 출력 
		System.out.println("\n -----------------------");
		System.out.println(" 전체 학생 수 : " + n);
		System.out.println(" -----------------------");
		System.out.println(" 이름	 전화번호   ");
		
		
		for (int i=0; i<arr1.length; i++)
		{
			System.out.printf(" %s ", arr1[i]);
			System.out.printf(" %s ", arr2[i]);
			System.out.println();
		}
		*/
	//-같이 수업하며 푼 내용---------------------------------------------------------------------------------------------
		
		//Scanner 인스턴스 생성
		Scanner sc = new Scanner(System.in);
	
		//사용자가 입력하는 학생 수를 담아낼 변수
		int memberCount = 0;

		do
		{
			System.out.print("입력 처리할 학생 수 입력 (명, 1~10) : ");
			memberCount = sc.nextInt();
		}
		while (1>memberCount || 10<memberCount);

		//테스트(확인)
		//System.out.println("사용자가 입력한 인원 수 : " + memberCount);
		//--==>> 사용자가 입력한 인원 수 : 6

		// 사용자가 입력한 인원 수를 토대로 
		// 이름 배열과 전화번호 배열을 생성해야 한다. 

		// 인원 수 만큼의 이름 저장 배열 구성
		String[] names = new String[memberCount];
		
		// 인원 수 만큼의 전화번호 저장 배열 구성
		String[] tels = new String[names.length];

		// 이름 전화번호 입력[1] (공백 구분) :
		// 인원 수 만큼의 안내 메세지 출력 및 입력 값 담아내기
		// for (int i=0; i<name.length; i++);
		// for (int i=0; i<tels.length; i++);
		for (int i=0; i<memberCount; i++)
		{
			System.out.printf("이름 전화번호 입력[%d](공백구분) : ", (i+1));
			//박범구		010-1234-5678
			//-------
			names[i] = sc.next();
			//박범구		010-1234-5678
			//				-------------
			tels[i] = sc.next();
		}

		//최종 결과 (이름 전화번호) 출력
		System.out.println();
		System.out.println("-----------------------");
		System.out.printf("전체 학생 수 : %d명 \n" , memberCount);
		System.out.println("-----------------------");
		// memberCount = names.length = tels.length

		System.out.println(" 이름	 전화번호   ");
		
		// 학생 리스트 출력
		for (int i=0; i<names.length; i++)
		{
			System.out.printf("%3s  %14s", names[i], tels[i]);
			System.out.println();
		}
		
	
		
		

		
	}
}

//실행결과
/*

입력 처리할 학생 수 입력 (명, 1~10) : 3
이름 전화번호입력 [1] (공백구분): 김민지 010-1234-5964
이름 전화번호입력 [2] (공백구분): 채다선 010-1234-5486
이름 전화번호입력 [3] (공백구분): 성준수 010-3131-0404

 -----------------------
 전체 학생 수 : 3
 -----------------------
 이름    전화번호
 김민지  010-1234-5964
 채다선  010-1234-5486
 성준수  010-3131-0404
계속하려면 아무 키나 누르십시오 . . .

*/