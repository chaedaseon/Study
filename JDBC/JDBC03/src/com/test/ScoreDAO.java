/*=====================
	ScoreDAO.java
======================*/

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection conn;
	
	// 사용자 정의 생성자
	public ScoreDAO()
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터를 입력받는 기능
	public int add(ScoreDTO dto) throws SQLException
	{
		int result = 0;
		
		// 작업 객체 생성
		Statement stmt = conn.createStatement();
		
		// 쿼리문 준비
		String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", dto.getName(), dto.getKor(), dto.getEng(), dto.getMat());
		
		// 쿼리문 전달 결과값
		result = stmt.executeUpdate(sql);
		
		// 리소스 반납
		stmt.close();
		
		// 결과값 반환
		return result;
	}
	
	// 데이터의 학생 수를 조회하는 기능
	public int count() throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		ResultSet rs = stmt.executeQuery(sql);
		
		// 쿼리문 전달 결과값 -> 여기서는 단일값이므로 반복문/조건문 뭐든 상관없음!
		while (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		// 리소스 반납
		stmt.close();
		
		return result;
	}
	
	// 전체 데이터를 조회하는 기능
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT SID, NAME, KOR, ENG, MAT, KOR+ENG+MAT AS SUM, (KOR+ENG+MAT)/3 AS AVG FROM TBL_SCORE";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setSum(rs.getInt("SUM"));
			dto.setAvg(rs.getDouble("AVG"));
			
			result.add(dto);
		}		
		return result;
	}
	
	// 데이터베이스 연결 종료
	public void close()
	{
		DBConn.close();
	}
}
