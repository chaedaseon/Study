<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Scriptlet(스크립트릿) 영역 
	String name = "김지민";
	name += "은 홍길동이 아니다.";
	
	int result;
	result = 10 + 20;
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest001.jsp</title>
</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2><%=name %></h2>
	<h2><%=result %></h2>
</div>

</body>
</html>