  /*==================================
   ■■■ 클래스와 인스턴스 ■■■
	- 클래스와 인스턴스 활용
  ==================================*/
  
  // 2. sungjuk 클래스
  //    - 인원 수를 입력 받아 
  //      입력받은 인원 수 만큼 이름, 국어점수, 영어점수, 수학점수를 입력받고
  //      총점과 평균을 산출하는 클래스로 설계할 것 
  //	   기능 : 인원수 입력, 상세 데이터 입력, 총점 및 평균 연산, 결과 출력

import java.util.Scanner;

public class Sungjuk
{
	int n; 
	

	// 인원 수 입력 기능 메소드
	void input()	
	{
		//Scanner 클래스 인스턴스 생성
		Scanner sc = new Scanner(System.in);

		do
		{
			System.out.print("인원 수 입력 (1~100) : ");
			n = sc.nextInt();
		}
		while (1>n || n>100);

		// 테스트(확인)
		//System.out.print("n : " + n);
	}

	//값을 입력 받는 기능을 하는 메소드 
	Record[] reinput() 
	{
		//Scanner 클래스 인스턴스 생성
		Scanner sc = new Scanner(System.in);
			
		Record[] arr = new Record[n];											// Record 클래스를 배열 형태로 선언 방크기는 학생 수 만큼! 							

		for (int i=0; i<n; i++)
		{
			arr[i] = new Record();												// Record 배열인 arr i번째 방에 / Record 클래스 형태로 설계도를 지급?

			System.out.printf("%d번째 학생의 이름 입력 : " , i+1);
			arr[i].name = sc.next();
			System.out.printf("국어 점수 입력 : ");
			arr[i].score[0] = sc.nextInt();
			System.out.printf("영어 점수 입력 : ");
			arr[i].score[1] = sc.nextInt();
			System.out.printf("수학 점수 입력 : ");
			arr[i].score[2] = sc.nextInt();
			System.out.println();

			arr[i].tot = arr[i].score[0] + arr[i].score[1] + arr[i].score[2];	// 국어, 영어, 수학 점수 총점

			arr[i].avg = arr[i].tot/3.0;										// 평균	double 형 잘 생각!!!

		}

		return arr;																// Record[]형 arr를 반환
		
	}
	
	
	// 출력 기능을 가진 메소드
	void print(Record[] arr)			
	{
		for (int i=0; i<n; i++) // 학생 수 만큼
		{
			System.out.printf(" %s %d %d %d %d %.2f \n",arr[i].name, arr[i].score[0], arr[i].score[1], arr[i].score[2], arr[i].tot, arr[i].avg);
		}
	
	}
	

/*

	// 테스트용 main() 메소드
	public static void main(String[] args) 
	{
		Sungjuk sj =  new Sungjuk();
		sj.input();
		Record[] arr = sj.reinput();
		sj.print(arr);

}
*/
	
}