/*==================================
   ■■■ 클래스와 인스턴스 ■■■
	- 클래스와 인스턴스 활용
  ==================================*/
  
  // 2. sungjuk 클래스
  //    - 인원 수를 입력 받아 
  //      입력받은 인원 수 만큼 이름, 국어점수, 영어점수, 수학점수를 입력받고
  //      총점과 평균을 산출하는 클래스로 설계할 것 
  //	  속성 : 인원수, Record 타입의 배열 → 학생들의 배열
  //	  기능 : 인원수 입력, 상세 데이터 입력, 총점 및 평균 연산, 결과 출력


  // 수업하며 같이 풀어본 내용 

import java.util.Scanner;

public class Sungjuk_1
{
	
	// 주요 속성 구성

	int inwon;						//-- 인원수
	Record[] rec;					//-- Record 타입의 배열(학생 한 명 당 Record 배열 방 한 개 활용)
									//   Record 을 기반으로 생성된 객체만 담아낼 수 있는 배열
	String[] subTitle = {"국어 점수 : ", "영어 점수 : ", "수학 점수 : "};	

	// 주요 기능 구성
	// ① 인원 수 입력
	public void set()
	{
		Scanner sc = new Scanner(System.in);

		do
		{
			System.out.print("인원 수 입력 (1~100) : ");
			inwon = sc.nextInt();
		}
		while (1>inwon || 100<inwon);
		
		// check~~!!
		// Record 클래스를 기반으로 생성된 객체(인스턴스)를 담을 수 있는 
		// 배열방을 inwon 만큼 생성한 것 일뿐
		// Record 클래스의 인스턴스를 생성한 것이 아니다~~!!  
		rec = new Record[inwon];
	}
		
	// ② 상세 데이터 입력 + ③ 총점 및 평균 연산
	public void input()
	{
		Scanner sc = new Scanner(System.in);

		// 인원 수 만큼 반복 → 인원 수에 기반하여 만들어진 배열의 길이만큼 반복 
		//for (int i=0; i<inwon; i++)
		for (int i=0;i<rec.length;i++)
		{
			// check~~!! 
			// Record 클래스 기반의 인스턴스 생성
			//Record ob = new Record();
			//rec[i] = ob;
			rec[i] = new Record();

			System.out.printf("%d번째 학생의 이름 입력 : ", (i+1));
			rec[i].name = sc.next();

			/*
			
			System.out.printf("국어 점수 입력 : ");
			rec[i].score[0] = sc.nextInt();
			System.out.printf("영어 점수 입력 : ");
			rec[i].score[1] = sc.nextInt();
			System.out.printf("수학 점수 입력 : ");
			rec[i].score[2] = sc.nextInt();
			
			*/
		
			for (int j=0; j<subTitle.length; j++)
			{
				//안내 메세지 출력
				System.out.print(subTitle[j]);
				rec[i].score[j] = sc.nextInt();

				// 국어, 영어, 수학 점수 데이터를 반복적으로 입력받는 동안 
				// 총점에 대한 누적 산출
				rec[i].tot += rec[i].score[j];
			}

			// 평균 산출하기 
			 rec[i].avg = rec[i].tot / 3.0;
		}// end outer for 

	
	}//end outer input()

	// ④ 결과 출력
	// 강혜성 90 80 70 240 XX.XX 2
	// 길현욱 92 82 72 XXX XX.XX 1
	// 김경태 82 72 62 XXX XX.XX 3

	public void print()
	{
		//내부 석차 산출 메소드 호출
		ranking();

		//개행
		System.out.println();

		// 학생 한 명 당 반복 출력 구문 구성
		// for (int i=0; i<inwon; i++)
		for (int i=0; i<rec.length; i++)
		{
			// 이름 출력
			System.out.printf("%s", rec[i].name);
			
			//성적(국어, 영어, 수학) 반복 출력
			for (int j=0; j<3; j++)
			{
				System.out.printf("%4d", rec[i].score[j]);
			}
			
			// 총점, 평균 출력
			System.out.printf("%5d", rec[i].tot);
			System.out.printf("%8.2f", rec[i].avg);

			// + 석차 추가	
			System.out.printf("%4d",rec[i].rank);

			//개행
			System.out.println();
		
		}
			
		
	}

	// + ⑤ 석차 산출 
	//		- 산출 과정에서 연산에 필요한 데이터가 이미 존재하는 상황 → 매개변수 넘겨줄 필요 없음
	//		- Record 배열의 rank 속성에 연산 결과 대입 기능 수행 → 반환 자료형 void
	//		- 클래스 내부에서 활용할 메소드로 정의 → 접근제어 지시자 private
	private void ranking()
	{
		// 모든 학생들의 등수(석차, rank)를 1로 초기화
		for (int i=0; i<inwon; i++)
		{
			rec[i].rank = 1;
		}

		// 등수 산출 → 입력 인원이 5명이라 가정하면...  
		for (int i =0; i<inwon-1; i++)						// 웅	→ 비교기준 → 0     1    2   3
		{
			for (int j=i+1; j<inwon; j++)					// 쑝쑝 → 비교대상 → 1234  234  34  4
			{
				if (rec[i].avg > rec[j].avg)				// 비교기준의 평균이 비교대상의 평균보다 크다면
				{
					// 비교대상의 rank를 1만큼 증가
					rec[j].rank ++;
				}
				else if(rec[i].avg < rec[j].avg)				// 비교대상의 평균이 비교기준의 평균보다 크다면
				{
					// 비교기준의 rank를 1만큼 증가
					rec[i].rank++;
				}

			}//end outer for


		}//end outer for
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	public void ranking()	
	{			
		
		for (int i=0; i<rec.length; i++)
		{
			rec[i] = new Record();
		
			if (rec[i].avg<rec[i+1].avg)
			{
				rec[i].rank ++;
			}

			//return rec[i].rank;
		}

	}
	*/


	
}