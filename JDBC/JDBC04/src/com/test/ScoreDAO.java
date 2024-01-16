/*=======================================
	ScoreDAO.java
	- 데이터베이스 액션 처리 전용 객체
========================================*/

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	// 주요 속성 구성
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
						+ " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		result = stmt.executeUpdate(sql);
		stmt.close();
		
		return result;
	}
	
	// 전체 리스트 출력 담당 메소드
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", KOR+ENG+MAT AS TOT"
				+ ", (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE"
				+ " ORDER BY SID ASC";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		
		// 리소스 반납 → 두 번째로 연 ResultSet을 먼저 닫고, 첫 번째로 연 Statement를 나중에 닫기!
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 이름 검색 담당 메소드
	// 현재 우리가 설계한 쿼리문에서는 이름, 번호가 한 명만을 조회할 수 있도록 해서
	// public ScoreDTO lists(String name) 라고 해도 되지만, lists() 오버로딩해서 사용해볼 예정!
	public ArrayList<ScoreDTO> lists(String name) throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK"
				+ " FROM"
				+ " (SELECT SID, NAME, KOR, ENG, MAT"
				+ ", KOR+ENG+MAT AS TOT"
				+ ", (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE)"
				+ " WHERE NAME='%s'", name);
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 번호 검색 담당 메소드
	public ArrayList<ScoreDTO> lists(int sid) throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT SID, NAME, KOR, ENG, MAT, TOT, AVG, RANK"
				+ " FROM"
				+ " (SELECT SID, NAME, KOR, ENG, MAT"
				+ ", KOR+ENG+MAT AS TOT"
				+ ", (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE)"
				+ " WHERE SID=%d", sid);
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;		
	}
	
	// 인원 수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;
		Statement stmt = conn.createStatement();
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		ResultSet rs = stmt.executeQuery(sql);
		
		if (rs.next() == true)				// while (rs.next())
			result = rs.getInt("COUNT");	// result = rs.getInt(1);

		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 데이터 수정 담당 메소드 → 매개변수의 유형 check~!!!
	public int modify(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		Statement stmt = conn.createStatement();
		String sql = String.format("UPDATE TBL_SCORE"
				+ " SET NAME='%s', KOR=%d, ENG=%d, MAT=%d"
				+ " WHERE SID=%s"
				, dto.getName(), dto.getKor(), dto.getEng(), dto.getMat(), dto.getSid());
		result = stmt.executeUpdate(sql);
		stmt.close();
		
		return result;
	}
	
	// 데이터 삭제 담당 메소드
	public int remove(int sid) throws SQLException
	{
		int result = 0;
		Statement stmt = conn.createStatement();
		String sql = String.format("DELETE FROM TBL_SCORE WHERE SID=%d", sid);
		result = stmt.executeUpdate(sql);
		stmt.close();		
	
		return result;
	}
	
	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
}
