/*=========================
	Test002.java
	- 쿼리문 전송 실습
==========================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Scanner;

import com.util.DBConn;

public class Test002
{
	public static void main(String[] args)
	{
		try
		{
			Scanner sc = new Scanner(System.in);
			Connection conn = DBConn.getConnection();
			
			do
			{
				System.out.print("번호 입력(-1 종료) : ");
				String sid = sc.next();
				
				if (sid.equals("-1"))
					break;
				
				System.out.print("이름 입력 : ");
				String name = sc.next();
				
				System.out.print("전화번호 입력 : ");
				String tel = sc.next();
				
				if (conn != null)
				{
					System.out.println("데이터베이스 연결 성공~!!!");
					
					try
					{
						String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL)"
								+ " VALUES(?, ?, ?)";
						
						PreparedStatement pstmt = conn.prepareStatement(sql);
						
						//pstmt.setString(1, sid);
						pstmt.setInt(1, Integer.parseInt(sid));
						pstmt.setString(2, name);
						pstmt.setString(3, tel);
						
						int result = pstmt.executeUpdate();
						if (result > 0)
							System.out.println("회원 데이터 입력 완료~!!!");
						
						pstmt.close();
						
					} catch (Exception e)
					{
						System.out.println(e.toString());
					}
				}
				
			} while (true);
			
			DBConn.close();
			
			System.out.println();
			System.out.println("데이터베이스 연결 닫힘~!!!");
			System.out.println("프로그램 종료됨~!!!");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}	
}

// 실행 결과

/*
번호 입력(-1 종료) : 6
이름 입력 : 길현욱
전화번호 입력 : 010-7777-7777
데이터베이스 연결 성공~!!!
회원 데이터 입력 완료~!!!
번호 입력(-1 종료) : 7
이름 입력 : 이윤수
전화번호 입력 : 010-8888-8888
데이터베이스 연결 성공~!!!
회원 데이터 입력 완료~!!!
번호 입력(-1 종료) : -1

데이터베이스 연결 닫힘~!!!
프로그램 종료됨~!!!

*/
