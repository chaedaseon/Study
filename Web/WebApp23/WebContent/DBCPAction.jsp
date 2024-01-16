<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBCPConn"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBCPConn.getConnection();

	String result = "";
	
	if (conn != null)
	{
		result = "데이터베이스 연결 성공~!!!";
	}
	else
	{
		result = "데이터베이스 연결 실패 ㅠㅠ";
	}
	
	DBCPConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPAction.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>DBCP를 활용한 데이터베이스 접속 실습</h1>
	<hr>
</div>

<div>
	<!-- 결과 확인 -->
	<h2><%=result %></h2>
</div>

</body>
</html>