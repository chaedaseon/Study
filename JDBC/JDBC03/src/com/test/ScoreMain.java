/*=====================
	ScoreMain.java
======================*/

/*
○ 성적 처리 프로그램 구현 → 데이터베이스 연동 → ScoreDAO, ScoreDTO 클래스 활용

   여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
   총점, 평균을 연산하여 내용을 출력하는 프로그램을 구현한다.
   
실행 예)

1번째 학생 성적 입력(이름 국어 영어 수학) : 강혜성 80 75 60
2번째 학생 성적 입력(이름 국어 영어 수학) : 김동민 100 90 80
3번째 학생 성적 입력(이름 국어 영어 수학) : 이주형 80 85 80
4번째 학생 성적 입력(이름 국어 영어 수학) : .

------------------------------------------------------
번호	이름	국어	영어	수학	총점	평균
------------------------------------------------------
 1	   강혜성    80		 75		 60		xxx		xx.x
 2	   김동민	100		 90		 80		xxx		xx.x
 3	   이주형	 80		 85		 80		xxx		xx.x
------------------------------------------------------
*/

package com.test;

import java.sql.SQLException;
import java.util.Scanner;

public class ScoreMain
{
	public static void main(String[] args) throws SQLException
	{
		Scanner sc = new Scanner(System.in);
		ScoreDAO dao = new ScoreDAO();
		int count = dao.count();
		
		do
		{
			System.out.printf("%d번째 학생 성적 입력(이름 국어 영어 수학) : ", ++count);
			String name = sc.next();
			
			if (name.equals("."))
				break;
			
			int kor = sc.nextInt();
			int eng = sc.nextInt();
			int mat = sc.nextInt();
			
			ScoreDTO dto = new ScoreDTO();
			
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			
			// 테이블에 데이터 입력
			dao.add(dto);
			
		} while (true);
		
		System.out.println();
		System.out.println("------------------------------------------------------");
		System.out.println("번호	이름	국어	영어	수학	총점	평균");
		System.out.println("------------------------------------------------------");

		for (ScoreDTO obj : dao.lists())
		{
			System.out.printf("%2s %7s %6d %7d %7d %7d %7.1f\n", obj.getSid(), obj.getName(), obj.getKor(), obj.getEng(), obj.getMat(), obj.getSum(), obj.getAvg());
		}
		
		System.out.println("------------------------------------------------------");

	}
	
}


/* 
1번째 학생 성적 입력(이름 국어 영어 수학) : 강혜성 80 75 60
2번째 학생 성적 입력(이름 국어 영어 수학) : 김동민 100 90 80
3번째 학생 성적 입력(이름 국어 영어 수학) : 이주형 80 85 80
4번째 학생 성적 입력(이름 국어 영어 수학) : .

------------------------------------------------------
번호	이름	국어	영어	수학	총점	평균
------------------------------------------------------
 1     강혜성     80      75      60     215    71.7
 2     김동민    100      90      80     270    90.0
 3     이주형     80      85      80     245    81.7
------------------------------------------------------
*/
