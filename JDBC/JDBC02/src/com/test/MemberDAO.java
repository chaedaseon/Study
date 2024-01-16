/*=====================
 	MemberDAO.java
======================*/

// 데이터베이스에 액세스 하는 기능
// → DBConn 활용(전담 계층)

// 데이터를 입력하는 기능 → insert

// 인원 수 확인하는 기능
// 즉, 대상 테이블(TBL_MEMBER)의 레코드 카운팅 기능 → select

// 전체 리스트를 조회하는 기능
// 즉, 대상 테이블(TBL_MEMBER)의 데이터를 조회하는 기능 → select

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

// 내가 풀이한 내용 ----------------------------------------------------------------------------------------
public class MemberDAO
{
	// 주요 속성 구성 → DB 연결 객체
	private Connection conn;
	
	/*
	public Connection getConn()
	{
		return conn;
	}

	public void setConn(Connection conn)
	{
		this.conn = conn;
	}
	*/
	
	// 생성자 정의(사용자 정의 생성자)
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 메소드 정의 → 데이터를 입력하는 기능
	public int add(MemberDTO dto) throws SQLException
	{		
		// 반환할 결과값을 담아낼 변수(적용된 행의 갯수)
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
				+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", dto.getName(), dto.getTel());
		result = stmt.executeUpdate(sql);
		
		stmt.close();
				
		// 최종 결과값 반환
		return result;
	}
	
	// 메소드 정의 → 전체 인원 수 확인하는 기능
	public int count() throws SQLException
	{			
		// 결과값으로 반환하게 될 변수 선언 및 초기화(인원 수)
		int result = 0;
		
		Statement stmt = conn.createStatement();		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";		
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next() == true)
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;		
	}
	
	// 메소드 정의 → 전체 리스트 조회하는 기능
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		// 결과값으로 반환할 변수 선언 및 초기화
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO md = new MemberDTO();
			md.setSid(rs.getString(1));
			md.setName(rs.getString(2));
			md.setTel(rs.getString(3));

			result.add(md);
		}
		rs.close();
		stmt.close();
		
		// 최종 결과값 반환
		return result;		
	}
	
	// 메소드 정의 → 데이터베이스 연결 종료
	public void close() throws SQLException
	{
		// check~!!!
		//conn.close();
		
		DBConn.close();
	}
}

// 같이 풀이한 내용 ----------------------------------------------------------------------------------------
//public class MemberDAO
//{
//	// 주요 속성 구성 → DB 연결 객체
//	private Connection conn;
//	
//	/*
//	public Connection getConn()
//	{
//		return conn;
//	}
//
//	public void setConn(Connection conn)
//	{
//		this.conn = conn;
//	}
//	*/
//	
//	// 생성자 정의(사용자 정의 생성자)
//	public MemberDAO() throws ClassNotFoundException, SQLException
//	{
//		conn = DBConn.getConnection();
//	}
//	
//	// 메소드 정의 → 데이터를 입력하는 기능
//	public int add(MemberDTO dto) throws SQLException
//	{		
//		// 반환할 결과값을 담아낼 변수(적용된 행의 갯수)
//		int result = 0;
//		
//		// 작업 객체 생성
//		Statement stmt = conn.createStatement();
//		
//		// 쿼리문 준비(insert)
//		String sql = String.format("INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
//				+ " VALUES(MEMBERSEQ.NEXTVAL, '%s', '%s')", dto.getName(), dto.getTel());
//		
//		// 작업 객체를 활용하여 쿼리문 실행(전달)
//		result = stmt.executeUpdate(sql);
//		
//		// 사용한 리소스 반납
//		stmt.close();
//				
//		// 최종 결과값 반환
//		return result;
//	}
//	
//	// 메소드 정의 → 전체 인원 수 확인하는 기능
//	public int count() throws SQLException
//	{			
//		// 결과값으로 반환하게 될 변수 선언 및 초기화(인원 수)
//		int result = 0;
//		
//		// 작업 객체 생성
//		Statement stmt = conn.createStatement();
//		
//		// 쿼리문 준비(select)
//		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";		// AS COUNT : 별칭을 COUNT 라고 부여
//		
//		// 생성된 작업 객체를 활용하여 쿼리문 실행
//		// → select → executeQuery() → ResultSet 반환 
//		// → 일반적으로 반복문 구성을 통한 ResultSet 처리
//		ResultSet rs = stmt.executeQuery(sql);
//		
//		// ResultSet 처리 → 반복문 구성 → 결과값 수신
//		while (rs.next())		// if (rs.next()) → 단일값을 가져올 때는 반복문/조건문 뭐든 상관없음!
//		{
//			result = rs.getInt("COUNT");	// rs.getInt(1) --(○)
//											// ※ 컬럼 인덱스는 1부터...
//											// ==> "COUNT(*)" : 문자열 안에 * 는 들어갈 수 없음! 
//		}
//		
//		// 사용한 리소스 반납
//		rs.close();
//		stmt.close();
//		
//		// 최종 결과값 반환
//		return result;		
//	}
//	
//	// 메소드 정의 → 전체 리스트 조회하는 기능
//	public ArrayList<MemberDTO> lists() throws SQLException
//	{
//		// 결과값으로 반환할 변수 선언 및 초기화
//		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
//		
//		// 작업 객체 생성
//		Statement stmt = conn.createStatement();
//		
//		// 쿼리문 준비(select)
//		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
//		
//		// 생성된 작업 객체를 활용하여 쿼리문 실행
//		// → select → executeQuery() → ResultSet 반환
//		// → 일반적으로 반복문 구성을 통한 ResultSet 처리 
//		ResultSet rs = stmt.executeQuery(sql);
//		
//		// check~!!!
//		// ResultSet 처리 
//		while (rs.next())
//		{
//			MemberDTO dto = new MemberDTO();
//			
//			dto.setSid(rs.getString("SID"));
//			dto.setName(rs.getString("NAME"));
//			dto.setTel(rs.getString("TEL"));
//			
//			result.add(dto);
//		}
//		
//		// 리소스 반납
//		rs.close();
//		stmt.close();
//		
//		// 최종 결과값 반환
//		return result;		
//	}
//	
//	// 메소드 정의 → 데이터베이스 연결 종료
//	public void close() throws SQLException
//	{
//		// check~!!!
//		//conn.close();
//		
//		DBConn.close();
//	}
//}



