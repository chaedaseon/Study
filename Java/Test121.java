/*==========================
  ■■■ 클래스 고급 ■■■
  - 인터페이스(Interface)
============================*/

// ○ 실습 문제
//	  성적 처리 프로그램을 구현한다.
//	  단, 인터페이스를 활용할 수 있도록 한다.

// 실행 예)
// 인원 수 입력(1~10) : 11
// 인원 수 입력(1~10) : 0
// 인원 수 입력(1~10) : 2

// 1번째 학생의 학번 이름 입력(공백 구분) : 2309123 김다슬
// 국어 영어 수학 점수 입력   (공백 구분) : 90 100 85
// 2번째 학생의 학번 이름 입력(공백 구분) : 2309125 김동민
// 국어 영어 수학 점수 입력   (공백 구분) : 85 70 60

// 2309123 김다슬 90 100  85		xxx(총점) xx.xx(평균)
//				  수  수  우
// 2309125 김동민 90 100  85		xxx(총점) xx.xx(평균)
//				  우  미  양

// 수우미양가

// 90 이상		   → 수
// 80 이상 90 미만 → 우
// 70 이상 80 미만 → 미 
// 60 이상 70 미만 → 양
// 60 미만(그외)   → 가 

import java.util.Scanner;
import java.io.IOException;

class Record
{
	String hak, name;				//-- 학번, 이름
	int kor, eng, mat;				//-- 국어, 영어, 수학 점수
	int tot;						//-- 총점
	double avg;						//-- 평균
}

interface Sungjuk
{
	public void set();				//-- 인원 셋팅
	public void input();			//-- 데이터 입력
	public void print();			//-- 결과 출력
}

// 문제 해결 과정에서 설계해야할 클래스 → Sungjuk 인터페이스를 구현하는 클래스
class SungjukImpl implements Sungjuk
{
	private int inwon;
	private Record[] rec;

	// 인원 수 입력 받는 메소드 정의
	@Override
	public void set()
	{
		Scanner sc = new Scanner(System.in);
		do
		{
			System.out.print("인원 수 입력(1~10) : ");
			inwon = sc.nextInt();
		}
		while (1 > inwon || 10 < inwon);
	}	

	// 학번, 이름, 점수 등 데이터를 입력 받는 메소드 정의
	@Override
	public void input()	
	{
		Scanner sc = new Scanner(System.in);
		rec = new Record[inwon];			//배열 방을 inwon 수 만큼 배정

		for (int i=0; i<inwon; i++)
		{
			rec[i] = new Record();			//rec[i]번째의 방에 Record 클래스 인스턴스 생성!


			System.out.printf("%d번째 학생의 학번 이름 입력(공백구분) : ", i+1);
			rec[i].hak = sc.next();
			rec[i].name = sc.next();

			System.out.print("국어 영어 수학 점수 입력(공백 구분) : ");
			rec[i].kor = sc.nextInt();
			rec[i].eng = sc.nextInt();
			rec[i].mat = sc.nextInt();

			rec[i].tot = rec[i].kor + rec[i].eng + rec[i].mat;
			rec[i].avg = rec[i].tot / 3.0;
		}	
		
		System.out.println();
	}
	
	// 전체 결과를 출력하는 메소드 정의
	@Override
	public void print()
	{
		for (int i = 0; i< inwon; i++)
		{
			System.out.printf("%8s %s %d %d %d %d %.2f\n",rec[i].hak, rec[i].name, rec[i].kor, rec[i].eng, rec[i].mat, rec[i].tot, rec[i].avg);
			System.out.printf("%17s %s %s\n", panjung(rec[i].kor), panjung(rec[i].eng), panjung(rec[i].mat));
		}
	}
	
	// 내부적으로 등급에 대한 판정을 수행할 메소드
	private String panjung(int score)
	{
		String str;
		
		if (score >= 90)
			str = "수";
		else if (score >= 80)
			str = "우";
		else if (score >=70)
			str = "미";
		else if (score >=60)
			str = "양";
		else 
			str = "가";
		
		return str;	
	}
	
}


public class Test121
{
	public static void main(String[] args)
	{
		Sungjuk ob = new SungjukImpl();

		ob.set();
		ob.input();
		ob.print();

	}
}
//실행결과
/*

인원 수 입력(1~10) : 3
1번째 학생의 학번 이름 입력(공백구분) : 17234006 김민지
국어 영어 수학 점수 입력(공백 구분) : 80 75 95
2번째 학생의 학번 이름 입력(공백구분) : 23234021 채다선
국어 영어 수학 점수 입력(공백 구분) : 85 65 50
3번째 학생의 학번 이름 입력(공백구분) : 18234008 노은하
국어 영어 수학 점수 입력(공백 구분) : 75 85 91

17234006 김민지 80 75 95 250 83.33
                우 미 수
23234021 채다선 85 65 50 200 66.67
                우 양 가
18234008 노은하 75 85 91 251 83.67
                미 우 수
계속하려면 아무 키나 누르십시오 . . .



*/