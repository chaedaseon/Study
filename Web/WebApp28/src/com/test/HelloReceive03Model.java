/*==================================
	HelloReceive03Model.java
==================================*/

package com.test;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result = "";
		
		request.setCharacterEncoding("UTF-8");
		
		// 데이터 수신
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		// 업무 처리 코드 삽입 가능~!!!
		lastName = "[ " + lastName + " ]";
		
		// 업무 처리가 완료된 데이터 전달
		request.setAttribute("fName", firstName);
		request.setAttribute("lName", lastName);
		
		// 상황에 따른 뷰 선택(지정) 가능~!!!
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
	
	
}
