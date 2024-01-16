<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// JsonTest03_ok.jsp
	
	int su1 = Integer.parseInt(request.getParameter("su1"));
	int su2 = Integer.parseInt(request.getParameter("su2"));
	String oper = request.getParameter("oper");
	String res = (String)request.getAttribute("result");
	String result = "";
	
	StringBuffer sb = new StringBuffer();
	
	sb.append("{\"result\":\"" + res + "\"}");
		
	result = sb.toString();
	out.println(result);
	
%>