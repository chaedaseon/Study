/*=======================================================
	Test002.java
	- CallableStatement 를 활용한 SQL 구문 전송 실습
========================================================*/

package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import com.util.DBConn;

import oracle.jdbc.OracleTypes;

public class Test002
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			
			if (conn != null)
			{
				System.out.println("데이터베이스 연결 성공~!!!");
				
				try
				{
					// 쿼리문 준비	check~!!!
					String sql = "{call PRC_MEMBERSELECT(?)}";
					
					// CallableStatement 작업 객체 생성 check~!!!
					CallableStatement cstmt = conn.prepareCall(sql);
					
					// check~!!!
					// 프로시저 내부에서 『sys_refcursor』를 사용하고 있기 때문에
					// OracleTypes.CURSOR 를 사용하기 위한 등록 과정이 필요한 상황.
					// 1. Project Explorer 상에서 해당 프로젝트(JDBC08) 마우스 우클릭.
					// 2. Build Path > Configure Build Path 클릭.
					// 3. Libraries 탭 선택
					// 4. 우측 Add External JAR 버튼 클릭
					// 5. 『ojdbc6.jar』파일 추가 등록 (외부 jar 파일 연결)
					// 6. 『import oracle.jdbc.OracleTypes;』 구문 추가 등록
					cstmt.registerOutParameter(1, OracleTypes.CURSOR);
					cstmt.execute();	// 참조하는 형태의 CURSOR를 사용할 때는 executeQeury() 말고 execute() 사용
					ResultSet rs = (ResultSet)cstmt.getObject(1);
					
					while (rs.next())
					{
						String sid = rs.getString("SID");
						String name = rs.getString("NAME");
						String tel = rs.getString("TEL");
						
						String str = String.format("%3s %7s %12s", sid, name, tel);
						
						System.out.println(str);
					}
					rs.close();
					cstmt.close();
										
				} catch (Exception e)
				{
					System.out.println(e.toString());
				}
			}
			
			DBConn.close();
			
			System.out.println("\n데이터베이스 연결 닫힘~!!!");
			System.out.println("프로그램 종료됨~!!!");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}


// 실행 결과

/*
데이터베이스 연결 성공~!!!
  1     김다슬 010-1111-1111
  2     오수경 010-2222-2222
  3     김경태 010-3333-3333
  4     박범구 010-4444-4444

데이터베이스 연결 닫힘~!!!
프로그램 종료됨~!!!
*/
