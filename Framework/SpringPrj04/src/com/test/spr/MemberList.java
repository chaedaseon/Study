/*=========================================
	MemberList.java
	- DAO 객체를 참조하는 클래스
	- 의존관계 설정
	- 리스트 출력(print()) 메소드 구현
	- 기존 코드의 일부 내용 제거 
==========================================*/

package com.test.spr;

public class MemberList
{
	// 처음 연결하는 객체 정보(OracleDAO)				→ 삭제
	/*
	private OracleDAO dao;
	
	public MemberList()
	{
		// MemberList 입장에서의 의존 객체 OracleDAO
		dao = new OracleDAO();
	}
	*/
	
	// 두 번째 연결하는 객체 정보(MssqlDAO)				→ 삭제
	/*
	private MssqlDAO dao;
	
	public MemberList()
	{
		// MemberList 입장에서의 의존 객체 MssqlDAO
		dao = new MssqlDAO();
	}
	*/
	
	// ※ 스프링 IoC/DI 패턴 적용
	
	// check~!!!
	// 멤버 변수를 추가하는 과정에서 데이터타입은 인터페이스 형식
	// DI 를 위한 추가 작업
	private IDAO dao;
	
	// check~!!!
	// setter 추가
	public void setDao(IDAO dao)
	{
		this.dao = dao;
	}	
	
	// 리스트 출력(print()) 메소드 구현					→ 수정내용 없음, 그대로 사용.
	public void print()
	{
		try
		{
			for (MemberDTO dto : dao.list())
			{
				System.out.printf("%14s %4s %15s %15s%n"
						, dto.getId(), dto.getName(), dto.getTel(), dto.getEmail());
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}
