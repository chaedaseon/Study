/*=========================
	Test03.java
==========================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03 extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	
	// 사용자의 http 프로토콜 요청이 GET 방식일 경우 호출되는 메소드
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	// 사용자의 http 프로토콜 요청이 POST 방식일 경우 호출되는 메소드
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// GET 방식이든 POST 방식이든
		// 어떤 방식의 요청에도 모두 처리할 수 있는 사용자 정의 메소드
		
		// 이전 페이지(AjaxTest03.jsp)로부터 넘어온 데이터 수신
		// → id
		String id = request.getParameter("id");
		
		// 내가 풀이한 내용 --> String 배열 사용 -----------------------------------
		/*
		String[] ids = {"superman", "batman", "admin"};
		String result = "사용가능한 아이디입니다.";
		
		for(int i=0; i<ids.length; i++)
		{
			if (id.equals(ids[i]))
			{
				result = "이미 존재하는 아이디입니다.";
				break;
			}
		}
		*/
		
		// id 가 cds 일 경우...
		// Model → DB 액션 처리 요청 → DAO (처리 요청)
		//                               ---------------
		//                               DTO, Connection 활용
		//
		// → SELECT COUNT(*) AS COUNT FROM MEMBER WHERE ID = 'cds';
		//           -----------------                         ---
		//               수신 처리                             넘겨주는 데이터
		//               --==>> 1 or 0
		
		// ※ DB 구성을 별도로 하지 않았기 때문에 
		//    컬렉션 자료구조로 대신함~!!!
		
		// 같이 풀이한 내용 --> ArrayList<String> 사용 ------------------------------
		ArrayList<String>db = new ArrayList<String>();
		db.add("superman");
		db.add("batman");
		db.add("admin");
		
		int result = 0;
		
		for (String item : db)
		{
			if (item.equals(id))
				result = 1;
		}
		
		// 최종 result 에 1 이 남아있으면... 이미 존재하는 id			→ 사용 불가
		// 1 로 바뀌지 않고 0 이 계속 남아있으면... 존재하지 않는 id	→ 사용 가능				
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test03_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Test03_ok.jsp");
		dispatcher.forward(request, response);
				
	}	
}
