/*================
	Test1.java
=================*/

package com.svt;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test1 extends HttpServlet
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
		
		// ①		
		/*
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + "홍길동" + "</h1>");
		pw.println("<h1>age : " + 19 + "</h1>");		
		pw.println("</div>");
		pw.println("</body>");		
		pw.println("</html>");
		*/
		
		// ②
		/*
		String name = "길현욱";
		int age = 21;
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");		
		pw.println("</div>");
		pw.println("</body>");		
		pw.println("</html>");
		*/
		
		// ③
		
		// 『ServletConfig』
		//-- 컨테이너가 서블릿을 초기화할 때
		//   서블릿 당 하나씩 ServletConfig 을 생성하게 된다.
		ServletConfig config = getServletConfig();
		
		// 『web.xml』에 『init-param』
		String name = config.getInitParameter("name");
		String age = config.getInitParameter("age");
		
		/*
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");		
		pw.println("</div>");
		pw.println("</body>");		
		pw.println("</html>");
		*/
		
		// ④
		
		// 『ServletContext』
		//-- ServletConfig 는 서블릿에 대한 환경을 설정하는 과정에서
		//   필요한 값들을 전달하는 형태로 주로 사용된다면...
		//   ServletContext 는 서블릿에서 사용되는 컨텍스트를
		//   구성하는 형태로 활용된다.
		ServletContext context = getServletContext();
		
		String type = context.getInitParameter("type");
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<title>" + "Test1.java" + "</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<div>");
		pw.println("<h1>name : " + name + "</h1>");
		pw.println("<h1>age : " + age + "</h1>");
		
		pw.println("<h1>type : " + type + "</h1>");
		
		pw.println("</div>");
		pw.println("</body>");		
		pw.println("</html>");
		
		
	}	
}
