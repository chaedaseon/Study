/*=========================
	Test04.java
==========================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test04 extends HttpServlet
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
		
		// 한글 깨짐 방지 처리
		request.setCharacterEncoding("UTF-8");
		
		// 이전 페이지(AjaxTest04.jsp)로부터 넘어온 데이터 수신
		// → addr
		String addr = request.getParameter("addr");
		
		// ※ 여기서도 마찬가지로 우편번호 데이터베이스가 있다고 가정하고...
		//    대신 직접 자료구조(ArrayList) 구성
		ArrayList<ZipCodeDTO> db = new ArrayList<ZipCodeDTO>();
		
		if (addr.indexOf("서교") > -1)
		{
			db.add(new ZipCodeDTO("04047", "서울특별시 마포구 독막로3길 40 (서교동, 서교동다세대주택)"));
			db.add(new ZipCodeDTO("04048", "서울특별시 마포구 독막로7길 34 (서교동, 서교빌딩)"));
			db.add(new ZipCodeDTO("04029", "서울특별시 마포구 동교로 116 (서교동, 서교동교회)"));
			db.add(new ZipCodeDTO("04030", "서울특별시 마포구 동교로 144-9 (서교동, 서교빌라)"));
			db.add(new ZipCodeDTO("04031", "서울특별시 마포구 동교로 162-6 (서교동, 서교동다세대빌라)"));
			db.add(new ZipCodeDTO("04035", "서울특별시 마포구 동교로12길 41-12 (서교동, 서교마임)"));
		}
		else if (addr.indexOf("연남") > -1)
		{
			db.add(new ZipCodeDTO("03984", "서울특별시 마포구 동교로 241 (연남동, 연남파크빌딩)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로 263-6 (연남동, 연남동주택)"));
			db.add(new ZipCodeDTO("03980", "서울특별시 마포구 동교로 273-20 (연남동, 연남빌라)"));
			db.add(new ZipCodeDTO("03990", "서울특별시 마포구 동교로27길 44-5 (연남동, 연남원룸)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로41길 36 (연남동, 연남동주민커뮤니티센터)"));
			db.add(new ZipCodeDTO("03984", "서울특별시 마포구 동교로41길 41 (연남동, 연남동41빌딩)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로45길 30 (연남동, 연남동주택)"));
			db.add(new ZipCodeDTO("03983", "서울특별시 마포구 동교로47길 26 (연남동, 연남동고깔집)"));
		}
		else if (addr.indexOf("망원") > -1)
		{
			db.add(new ZipCodeDTO("04019", "서울특별시 마포구 동교로8안길 23 (합정동, 망원정)"));
			db.add(new ZipCodeDTO("03954", "서울특별시 마포구 마포나루길 386 (망원동, 망원한강수영장)"));
			db.add(new ZipCodeDTO("03954", "서울특별시 마포구 마포나루길 407 (망원동, 망원2호)"));
			db.add(new ZipCodeDTO("04085", "서울특별시 마포구 마포나루길 594 (합정동, 망원수상훈련장)"));
			db.add(new ZipCodeDTO("04006", "서울특별시 마포구 망원로 12 (망원동, 망원아트빌라)"));
			db.add(new ZipCodeDTO("04007", "서울특별시 마포구 망원로 28 (망원동, 망원1-1공영주차장)"));
			db.add(new ZipCodeDTO("04007", "서울특별시 마포구 망원로 34-15 (망원동, 망원동다세대주택)"));
		}
		
		request.setAttribute("lists", db);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("WEB-INF/view/Test04_ok.jsp");
		//RequestDispatcher dispatcher = request.getRequestDispatcher("Test04_ok.jsp");
		dispatcher.forward(request, response);
						
	}	
}
