/*=========================
	Test05.java
==========================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05 extends HttpServlet
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
		
		// ※ 완성형 한글 형태로 전송된 데이터 수신
		
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(AjaxTest05.jsp)로부터 넘어온 데이터 수신
		// → search
		String search = request.getParameter("search");
		
		// 테스트
		//System.out.println(search);
		
		// DB 연결 및 액션 처리
		// ..... WHERE COLUMNNAME LIKE 'search%'와 같은 쿼리문 수행
		// 그에 따른 결과 수신
		
		// 위에서 처리한 결과를 가지고 있는 자료구조 활용
		ArrayList<WordDTO> lists = new ArrayList<WordDTO>();
		
		if (search.equals("가"))
		{
			lists.add(new WordDTO("가습기"));
			lists.add(new WordDTO("가요대전"));
			lists.add(new WordDTO("가방"));
			lists.add(new WordDTO("가다랑어"));
			lists.add(new WordDTO("가위"));
			lists.add(new WordDTO("가죽"));
			lists.add(new WordDTO("가족"));
			lists.add(new WordDTO("가지"));
			lists.add(new WordDTO("가평"));
		}
		else if (search.equals("가습"))
		{
			lists.add(new WordDTO("가습기 손질"));
			lists.add(new WordDTO("가습기 구매"));
			lists.add(new WordDTO("가습기 분해"));
			lists.add(new WordDTO("가습기 교체"));
			lists.add(new WordDTO("가습기 살균제"));
			lists.add(new WordDTO("가습기 고장"));
		}
		else if (search.equals("가방"))
		{
			lists.add(new WordDTO("가방 손질"));
			lists.add(new WordDTO("가방 구매"));
			lists.add(new WordDTO("가방 분해"));
			lists.add(new WordDTO("가방 교체"));
			lists.add(new WordDTO("가방 수리"));
			lists.add(new WordDTO("가방끈"));
			lists.add(new WordDTO("가방 나눔"));
		}
		else if (search.equals("가방끈"))
		{
			lists.add(new WordDTO("가방끈 매듭"));
			lists.add(new WordDTO("가방끈 매듭 묶기"));
			lists.add(new WordDTO("가방끈 매듭 푸는 법"));
			lists.add(new WordDTO("가방끈 길이 조절"));
			lists.add(new WordDTO("가방끈 교체"));
			lists.add(new WordDTO("가방끈 색상"));
		}
		
		request.setAttribute("lists", lists);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test05_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Test05_ok.jsp");
		dispatcher.forward(request, response);
						
	}	
}
