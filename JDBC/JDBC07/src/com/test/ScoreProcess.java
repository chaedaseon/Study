package com.test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

public class ScoreProcess
{
	private ScoreDAO dao;
	
	// 사용자 정의 생성자
	public ScoreProcess()
	{
		dao = new ScoreDAO();
	}
	
	// 성적 입력
	public void scoreInsert() throws SQLException
	{		
		Scanner sc = new Scanner(System.in);
		dao.connection();
		
		int count = dao.count();
		do
		{
			System.out.printf("%d번 학생 성적 입력(이름 국어 영어 수학) : ", ++count);
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
			
			int result = dao.add(dto);
			if (result > 0)
				System.out.println("성적 입력이 완료되었습니다.");
			
		} while (true);
	}
	
	// 성적 전체 출력
	public void scoreLists() throws SQLException
	{
		dao.connection();
		int count = dao.count();		
		
		System.out.printf("전체 인원 : %d명\n", count);
		System.out.print("번호	이름	국어	영어	수학	총점	평균	석차");
		System.out.println();
		for (ScoreDTO list : dao.lists())
		{
			System.out.printf("%3s %6s %7d %6d %7d %7d %8.1f %6d\n"
					, list.getSid(), list.getName()
					, list.getKor(), list.getEng(), list.getMat()
					, list.getTot(), list.getAvg(), list.getRank());
		}
		System.out.println();				
	}
	
	// 이름 검색 출력
	public void scoreSearch() throws SQLException
	{
		Scanner sc = new Scanner(System.in);
		dao.connection();
		
		System.out.print("검색할 이름 입력 : ");
		String name = sc.next();
		
		ArrayList<ScoreDTO> arrayList = dao.lists(name);
		
		if (arrayList.size() > 0)
		{
			System.out.print("번호	이름	국어	영어	수학	총점	평균	석차");
			System.out.println();
			for (ScoreDTO list : arrayList)
			{
				System.out.printf("%3s %6s %7d %6d %7d %7d %8.1f %6d\n"
						, list.getSid(), list.getName()
						, list.getKor(), list.getEng(), list.getMat()
						, list.getTot(), list.getAvg(), list.getRank());
			}
			System.out.println();
		}
		else
		{
			System.out.println("검색 결과가 존재하지 않습니다.");
		}		
	}	
	
	// 성적 수정
	public void scoreUpdate() throws SQLException
	{
		Scanner sc = new Scanner(System.in);
		dao.connection();
		System.out.print("수정할 번호 입력 : ");
		int id = sc.nextInt();
		
		ArrayList<ScoreDTO> arrayList = dao.lists(id);
		if (arrayList.size() > 0)
		{
			System.out.print("번호	이름	국어	영어	수학	총점	평균	석차");
			System.out.println();
			for (ScoreDTO list : arrayList)
			{
				System.out.printf("%3s %6s %7d %6d %7d %7d %8.1f %6d\n"
						, list.getSid(), list.getName()
						, list.getKor(), list.getEng(), list.getMat()
						, list.getTot(), list.getAvg(), list.getRank());
			}
			System.out.println();
			
			System.out.print("수정 내용 입력(이름 국어 영어 수학) : ");
			String name = sc.next();
			int kor = sc.nextInt();
			int eng = sc.nextInt();
			int mat = sc.nextInt();
			
			ScoreDTO dto = new ScoreDTO();
			dto.setName(name);
			dto.setKor(kor);
			dto.setEng(eng);
			dto.setMat(mat);
			dto.setSid(String.valueOf(id));
			
			int result = dao.modify(dto);
			if (result > 0)
				System.out.println("수정이 완료되었습니다.");			
		}
		else 
		{
			System.out.println("수정할 대상이 존재하지 않습니다.");
		}		
	}	
	
	
	// 성적 삭제
	public void scoreDelete() throws SQLException
	{
		Scanner sc = new Scanner(System.in);
		
		dao.connection();
		
		System.out.print("삭제할 번호 입력 : ");
		int id = sc.nextInt();
		
		ArrayList<ScoreDTO> arrayList = dao.lists(id);
		if (arrayList.size() > 0)
		{
			System.out.print("번호	이름	국어	영어	수학	총점	평균	석차");
			System.out.println();
			for (ScoreDTO list : arrayList)
			{
				System.out.printf("%3s %6s %7d %6d %7d %7d %8.1f %6d\n"
						, list.getSid(), list.getName()
						, list.getKor(), list.getEng(), list.getMat()
						, list.getTot(), list.getAvg(), list.getRank());
			}
			System.out.println();
			
			System.out.print("정말 삭제하시겠습니까?(Y/N) : ");
			String response = sc.next();
			if (response.equals("Y")||response.equals("y"))
			{
				int result = dao.remove(id);
				if (result > 0)
					System.out.println("삭제가 완료되었습니다.");
			}
			else
				System.out.println("삭제가 취소되었습니다.");			
		}
		else
		{
			System.out.println("삭제할 대상이 존재하지 않습니다.");
		}
		
	}
}
