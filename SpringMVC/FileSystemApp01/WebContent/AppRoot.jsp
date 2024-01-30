<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<% 

	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	
	File newFile = new File(appRoot, "data/test.txt");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AppRoot.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>관찰</h1>
	<hr />
</div>

<div>
	<h2>웹 어플리케이션 루트 : <%=appRoot %></h2>
	<!-- C:\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp01\ -->
	
	<h2>생성할 파일 위치 : <%=newFile %></h2>
	<!-- C:\SpringMVCStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FileSystemApp01\data\test.txt -->
</div>

</body>
</html>