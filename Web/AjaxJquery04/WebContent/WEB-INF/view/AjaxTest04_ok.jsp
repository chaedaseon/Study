<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// AjaxTest04_ok.jsp → XML 구성
	
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	response.setContentType("text/xml");
	
%><?xml version="1.0" encoding="UTF-8"?>
<root>
	<status>true</status>
	<%
	for (int i=1; i<=2; i++)
	{
	%>
	<records id="<%=i%>">
		<title><%=title %></title>
		<content><%=content %></content>
	</records>
	<%
	}
	%>
</root>