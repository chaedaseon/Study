<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String result = (String)request.getAttribute("result");
	
%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>

<div>
	<h1>최종 결과값 수신</h1>
	<hr>
</div>
 
<div>
	<!-- <h2>결과 처리</h2> -->
	<h2><%=result %></h2>	
</div>

</body>
</html>