/*====================
	ScoreMain.java
=====================*/

/*
○ 성적 처리
   - 데이터베이스 연동(데이터베이스 연결 및 액션 처리)
   - ScoreDTO 클래스 활용(속성만 존재하는 클래스 getter / setter 구성)
   - ScoreDAO 클래스 활용(데이터베이스 액션 처리)
   - ScoreProcess 클래스 활용(업무 단위 기능 구성)
   
※ 단, 모~~~~ 든 작업 객체는 PreparedStatement 를 활용한다.

여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
총점, 평균, 석차 등을 계산하여 출력하는 프로그램을 구현한다.

실행 예)

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 1

4번 학생 성적 입력(이름 국어 영어 수학) : 박범구 50 60 70
성적 입력이 완료되었습니다.

5번 학생 성적 입력(이름 국어 영어 수학) : 김경태 80 80 80
성적 입력이 완료되었습니다.

6번 학생 성적 입력(이름 국어 영어 수학) : .

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : 2

전체 인원 : 5명
번호	이름	국어	영어	수학	총점	평균	석차
 1	   
 2
 3								....
 4
 5

===[ 성적 처리 ]===
1. 성적 입력
2. 성적 전체 출력
3. 이름 검색 출력
4. 성적 수정
5. 성적 삭제
===================
>> 선택(1~5, -1종료) : -1

프로그램이 종료되었습니다.
*/

package com.test;

import java.sql.SQLException;
import java.util.Scanner;

public class ScoreMain
{
	public static void main(String[] args) throws SQLException
	{
		ScoreProcess prc = new ScoreProcess();
		Scanner sc = new Scanner(System.in);		
		
		do
		{
			System.out.println("");
			System.out.println("===[ 성적 처리 ]===");
			System.out.println("1. 성적 입력");
			System.out.println("2. 성적 전체 출력");
			System.out.println("3. 이름 검색 출력");
			System.out.println("4. 성적 수정");
			System.out.println("5. 성적 삭제");
			System.out.println("===================");
			System.out.print(">> 선택(1~5, -1종료) : ");
			String menus = sc.next();
			
			int menu = Integer.parseInt(menus);
			if (menu == -1)
			{
				System.out.println("프로그램을 종료합니다.");
				return;
			}			
			switch (menu)
			{
			case 1:
				prc.scoreInsert();
				break;
			case 2:
				prc.scoreLists();
				break;
			case 3:
				prc.scoreSearch();
				break;
			case 4:
				prc.scoreUpdate();
				break;
			case 5:
				prc.scoreDelete();
				break;
			}
		} while (true);
	}
		
}
