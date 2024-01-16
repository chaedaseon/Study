<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// LoadingTest_ok.jsp
	
	String name = request.getParameter("name");
	String content = request.getParameter("content");
	
	try
	{
		// 의도적으로 처리 시간 지연
		Thread.sleep(5000);
		
	} catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	
%>
이름 : <%=name%>
<br>
내용 : <%=content%>
<br>