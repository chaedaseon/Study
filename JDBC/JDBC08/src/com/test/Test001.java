/*=======================================================
	Test001.java
	- CallableStatement 를 활용한 SQL 구문 전송 실습
========================================================*/

package com.test;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.util.Scanner;

import com.util.DBConn;

public class Test001
{
	public static void main(String[] args)
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			Connection conn = DBConn.getConnection();
			
			do
			{
				System.out.print("이름 입력(-1 종료) : ");
				String name = sc.next();
				
				if (name.equals("-1"))
					break;
				
				System.out.print("전화번호 입력 : ");
				String tel = sc.next();
				
				if (conn != null)
				{
					System.out.println("데이터베이스 연결 성공~!!!");
					
					try
					{
						// 쿼리문 준비	check~!!!
						String sql = "{call PRC_MEMBERINSERT(?, ?)}";
						
						// CallableStatement 작업 객체 생성	check~!!!
						CallableStatement cstmt = conn.prepareCall(sql);
						
						// 매개변수 전달
						cstmt.setString(1, name);
						cstmt.setString(2, tel);
						
						int result = cstmt.executeUpdate();
						
						if (result > 0)
							System.out.println("프로시저 호출 및 데이터 입력 완료~!!!");						
						
					} catch (Exception e)
					{
						System.out.println(e.toString());
					}
				}
				
			} while (true);
			
			DBConn.close();
			
			System.out.println("\n데이터베이스 연결 종료~!!!");
			System.out.println("프로그램 종료됨~!!!");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
}

// 실행 결과

/*
이름 입력(-1 종료) : 김다슬
전화번호 입력 : 010-1111-1111
데이터베이스 연결 성공~!!!
프로시저 호출 및 데이터 입력 완료~!!!
이름 입력(-1 종료) : 오수경
전화번호 입력 : 010-2222-2222
데이터베이스 연결 성공~!!!
프로시저 호출 및 데이터 입력 완료~!!!
이름 입력(-1 종료) : 김경태
전화번호 입력 : 010-3333-3333
데이터베이스 연결 성공~!!!
프로시저 호출 및 데이터 입력 완료~!!!
이름 입력(-1 종료) : 박범구
전화번호 입력 : 010-4444-4444
데이터베이스 연결 성공~!!!
프로시저 호출 및 데이터 입력 완료~!!!
이름 입력(-1 종료) : -1

데이터베이스 연결 종료~!!!
프로그램 종료됨~!!!
 
*/
