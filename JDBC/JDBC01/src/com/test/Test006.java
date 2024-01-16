/*====================================
 	Test006.java
 	- 테이블 내의 데이터 읽어오기 
====================================*/

// EMP 테이블을 대상으로
// EMPNO, ENAME, JOB, SAL 항목을 확인하는 프로그램 구성

package com.test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.DBConn;

public class Test006
{
	public static void main(String[] args) throws ClassNotFoundException, SQLException
	{
		Connection conn = DBConn.getConnection();
		
		if (conn != null)
		{
			System.out.println(">> 데이터베이스 연결 성공~!!!");
			
			try
			{
				Statement stmt = conn.createStatement();
				
				String sql = "SELECT EMPNO, ENAME, JOB, SAL FROM EMP";
				
				ResultSet rs = stmt.executeQuery(sql);
				
				while (rs.next())
				{
					String empno = rs.getString("EMPNO");
					String ename = rs.getString("ENAME");
					String job = rs.getString("JOB");
					String sal = rs.getString("SAL");
					
					String str = String.format("%5s %8s %10s %5s", empno, ename, job, sal);
					System.out.println(str);
				}				
				rs.close();
				stmt.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
		else
		{
			System.out.println(">> 데이터 베이스 연결 실패~!!!");
		}		
		DBConn.close();
		
		System.out.println(">> 데이터베이스 연결 닫힘~!!!");
		System.out.println(">> 프로그램 종료됨~!!!");		
	}
}

// 실행 결과
/*
>> 데이터베이스 연결 성공~!!!
 7369    SMITH      CLERK   800
 7499    ALLEN   SALESMAN  1600
 7521     WARD   SALESMAN  1250
 7566    JONES    MANAGER  2975
 7654   MARTIN   SALESMAN  1250
 7698    BLAKE    MANAGER  2850
 7782    CLARK    MANAGER  2450
 7788    SCOTT    ANALYST  3000
 7839     KING  PRESIDENT  5000
 7844   TURNER   SALESMAN  1500
 7876    ADAMS      CLERK  1100
 7900    JAMES      CLERK   950
 7902     FORD    ANALYST  3000
 7934   MILLER      CLERK  1300
>> 데이터베이스 연결 닫힘~!!!
>> 프로그램 종료됨~!!!
*/
