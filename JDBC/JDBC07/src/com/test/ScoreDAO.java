package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;


public class ScoreDAO
{
	private Connection conn;
	
	// 데이터베이스 연결
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터베이스 연결 종료
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 인원 수 조회 기능
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql ="SELECT COUNT(*) AS COUNT FROM TBL_SCORE";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getInt("COUNT");
		
		rs.close();
		pstmt.close();
		return result;
	}
	
	// 성적 입력 기능
	public int add(ScoreDTO dto) throws SQLException
	{
		
		String sql = "INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT)"
				+ " VALUES(SCORESEQ.NEXTVAL, ?, ?, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		int result = pstmt.executeUpdate();
		
		return result;
	}
	
	// 성적 전체 출력 기능
	public ArrayList<ScoreDTO> lists() throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>(); 
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) TOT"
				+ ", (KOR+ENG+MAT)/3 AS AVG"
				+ ", RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE"
				+ " ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getInt("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);
		}

		rs.close();
		pstmt.close();
		return result; 
	}
	
	// 이름 검색 출력 기능
	public ArrayList<ScoreDTO> lists(String value) throws SQLException
	{
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) TOT,"
				+ " (KOR+ENG+MAT)/3 AS AVG,"
				+ " RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE"
				+ " WHERE NAME = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, value);
		ResultSet rs = pstmt.executeQuery();
				
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getInt("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);			
		}
		
		rs.close();
		pstmt.close();
		return result;
	}
	
	// 번호 검색 출력 기능
	public ArrayList<ScoreDTO> lists(int num) throws SQLException
	{
		
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		String sql = "SELECT SID, NAME, KOR, ENG, MAT"
				+ ", (KOR+ENG+MAT) TOT,"
				+ " (KOR+ENG+MAT)/3 AS AVG,"
				+ " RANK() OVER(ORDER BY (KOR+ENG+MAT) DESC) AS RANK"
				+ " FROM TBL_SCORE"
				+ " WHERE SID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, num);
		ResultSet rs = pstmt.executeQuery();		
		
		while (rs.next())
		{
			ScoreDTO dto = new ScoreDTO();
			
			dto.setSid(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getInt("AVG"));
			dto.setRank(rs.getInt("RANK"));
			
			result.add(dto);			
		}
		
		rs.close();
		pstmt.close();
		return result;
	}
	
	// 성적 수정 기능
	public int modify(ScoreDTO dto) throws SQLException
	{
		String sql = "UPDATE TBL_SCORE SET NAME=?, KOR=?, ENG=?, MAT=? WHERE SID = ?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		pstmt.setString(5, dto.getSid());
		
		int result = pstmt.executeUpdate();
		pstmt.close();
		return result;
	}
	
	// 성적 삭제 기능
	public int remove(int id) throws SQLException
	{
		ScoreDTO dto = new ScoreDTO();
		String sql = "DELETE FROM TBL_SCORE WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		
		int result = pstmt.executeUpdate();
		
		pstmt.close();
		return result;		
	}
}
