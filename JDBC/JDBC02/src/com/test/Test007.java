/*===================================
 	Test007.java
 	- DBConn 에 대한 단위 테스트 
===================================*/

package com.test;

import java.sql.Connection;

import com.util.DBConn;

public class Test007
{
	public static void main(String[] args)
	{
		try
		{
			Connection conn = DBConn.getConnection();
			
			if (conn == null)
			{
				System.out.println("데이터베이스 연결 실패 ㅠㅠ");
			}
			else
			{
				System.out.println("데이터베이스 연결 성공~!!!");
			}
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try
			{
				DBConn.close();
				
			} catch (Exception e)
			{
				System.out.println(e.toString());
			}
		}
	}
}


// 실행 결과
// 데이터베이스 연결 성공~!!!
