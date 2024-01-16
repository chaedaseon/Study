/*==========================================
	MemberDAO.java
	- 데이터베이스 액션 처리 전용 클래스
==========================================*/

package com.test;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;


public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결하는 기능
	public Connection connection()
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터를 입력하는 기능
	public int add(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("INSERT INTO TBL_EMP (EMP_ID, EMP_NAME, SSN, IBSADATE"
				+ ", CITY_ID, TEL, BUSEO_ID, JIKWI_ID, BASICPAY, SUDANG)"
				+ " VALUES (EMPSEQ.NEXTVAL, '%s', '%s', '%s', %s, '%s', %s, %s, %d , %d)"
				, dto.getEmpname(), dto.getSsn(), dto.getIbsadate(), dto.getCityid()
				, dto.getTel(), dto.getBuseoid(),dto.getJikwiid(), dto.getBasicpay(), dto.getSudang());
		
		result = stmt.executeUpdate(sql);
		stmt.close();
		
		return result;
	}
	
	// ID로 변환하는 기능
	public String convert(int num, String key) throws SQLException
	{
		Statement stmt = conn.createStatement();
		String sql="";
		ResultSet rs= null;
		String result="";
		
		switch (num)
		{
		case 1:
			sql = String.format("SELECT CITY_ID FROM TBL_CITY WHERE CITY_NAME = '%s'", key);
			rs = stmt.executeQuery(sql);
			break;
		case 2:
			sql = String.format("SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME = '%s'", key);
			rs = stmt.executeQuery(sql);
			break;
		case 3:
			sql = String.format("SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'", key);
			rs = stmt.executeQuery(sql);
			break;
		}
		while (rs.next())
		{
			result = rs.getString(1);
		}
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 인원 수를 조회하는 기능
	public int count() throws SQLException
	{
		int result = 0;
		Statement stmt = conn.createStatement();
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_EMP";
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next() == true)
			result = rs.getInt("COUNT");
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 전체 데이터 조회하는 기능
	public ArrayList<MemberDTO> lists(int num) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		Statement stmt = conn.createStatement();
		String sql = "";
		
		switch (num)
		{
		case 1:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP ORDER BY EMP_ID";
			break;
		case 2:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP ORDER BY EMP_NAME";
			break;
		case 3:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP ORDER BY BUSEO_NAME";
		case 4:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP ORDER BY JIKWI_NAME";
			break;
		case 5:
			sql = "SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP ORDER BY Pay DESC";
			break;
		case -1:
			break;
		}
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpid(rs.getString(1));
			dto.setEmpname(rs.getString(2));
			dto.setSsn(rs.getString(3));
			dto.setIbsadate(rs.getString(4));
			dto.setCityname(rs.getString(5));
			dto.setTel(rs.getString(6));
			dto.setBuseoname(rs.getString(7));
			dto.setJikwiname(rs.getString(8));
			dto.setBasicpay(rs.getInt(9));
			dto.setSudang(rs.getInt(10));
			dto.setPay(rs.getInt(11));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 검색해서 조회하는 기능
	public ArrayList<MemberDTO> lists(int num, String key) throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		String sql="";
		
		switch (num)
		{
		case 1:
			sql = String.format("SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP WHERE EMP_ID = %s", key);
			break;
		case 2:
			sql = String.format("SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP WHERE EMP_NAME = '%s'", key);
			break;
		case 3:
			sql = String.format("SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP WHERE BUSEO_NAME = '%s'", key);
			break;
		case 4:
			sql = String.format("SELECT EMP_ID, EMP_NAME, SSN, IBSADATE, CITY_NAME, TEL, BUSEO_NAME, JIKWI_NAME, BASICPAY, SUDANG, Pay"
					+ " FROM VIEW_EMP WHERE JIKWI_NAME = '%s'", key);
			break;
		case -1:
			break;
		}
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
			
			dto.setEmpid(rs.getString(1));
			dto.setEmpname(rs.getString(2));
			dto.setSsn(rs.getString(3));
			dto.setIbsadate(rs.getString(4));
			dto.setCityname(rs.getString(5));
			dto.setTel(rs.getString(6));
			dto.setBuseoname(rs.getString(7));
			dto.setJikwiname(rs.getString(8));
			dto.setBasicpay(rs.getInt(9));
			dto.setSudang(rs.getInt(10));
			dto.setPay(rs.getInt(11));
			
			result.add(dto);
		}
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 데이터를 수정하는 기능
	public int modify(MemberDTO dto) throws SQLException
	{
		int result = 0;
		
		Statement stmt = conn.createStatement();
		String sql = String.format("UPDATE TBL_EMP"
				+ " SET EMP_NAME='%s', SSN='%s', IBSADATE='%s', CITY_ID = (SELECT CITY_ID FROM TBL_CITY WHERE CITY_NAME = '%s')"
				+ ", TEL='%s', BUSEO_ID = (SELECT BUSEO_ID FROM TBL_BUSEO WHERE BUSEO_NAME = '%s')"
				+ ", JIKWI_ID = (SELECT JIKWI_ID FROM TBL_JIKWI WHERE JIKWI_NAME = '%s')"
				+ ", BASICPAY=%d, SUDANG=%d WHERE EMP_ID=%s"
				, dto.getEmpname(), dto.getSsn(), dto.getIbsadate()
				, dto.getCityname(), dto.getTel(), dto.getBuseoname()
				, dto.getJikwiname(), dto.getBasicpay(), dto.getSudang(), dto.getEmpid());		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		
		return result;
	}
	
	// 데이터를 삭제하는 기능
	public int remove(String id) throws SQLException
	{
		int result = 0;
		
		MemberDTO dto = new MemberDTO();
		Statement stmt = conn.createStatement();
		String sql = String.format("DELETE TBL_EMP WHERE EMP_ID = %s", id);
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		return result;
	}
	
	// 데이터(지역) 결과 조회
	public ArrayList<MemberDTO> city() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT CITY_NAME, CITY_ID FROM TBL_CITY";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
		
			dto.setCityname(rs.getString("CITY_NAME"));
			dto.setCityid(rs.getString("CITY_ID"));
			
			result.add(dto);
		}		
		
		rs.close();
		stmt.close();
		
		return result;
	}
	// 데이터(부서) 결과 조회
	public ArrayList<MemberDTO> buseo() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT BUSEO_NAME, BUSEO_ID FROM TBL_BUSEO";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
		
			dto.setBuseoname(rs.getString("BUSEO_NAME"));
			dto.setBuseoid(rs.getString("BUSEO_ID"));
			
			result.add(dto);
		}		
		
		rs.close();
		stmt.close();
		
		return result;
	}
	// 데이터(직위) 결과 조회
	public ArrayList<MemberDTO> jikwi() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		Statement stmt = conn.createStatement();
		String sql = "SELECT JIKWI_NAME, JIKWI_ID FROM TBL_JIKWI";
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			MemberDTO dto = new MemberDTO();
		
			dto.setJikwiname(rs.getString("JIKWI_NAME"));
			dto.setJikwiid(rs.getString("JIKWI_ID"));
			
			result.add(dto);
		}		
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 입력한 직위의 기본급 조회
	public String minpay(String jikwi) throws SQLException
	{
		Statement stmt = conn.createStatement();
		String sql = String.format("SELECT MIN_BASICPAY FROM TBL_JIKWI WHERE JIKWI_NAME = '%s'", jikwi);
		ResultSet rs = stmt.executeQuery(sql);
		String result = "";
		
		if (rs.next() == true)
			result = rs.getString(1);
		
		rs.close();
		stmt.close();
		
		return result;
	}
	
	// 데이터베이스 연결 종료 하는 기능
	public void close()
	{
		try
		{
			conn.close();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}	
}
