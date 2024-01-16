<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//이전 페이지(TestSession02.jsp)로부터 넘어온 데이터 수신
	// → userId, userPwd
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	String userName = (String)session.getAttribute("userName");
	String userTel = (String)session.getAttribute("userTel");
	
	session.removeAttribute("userName");
	session.removeAttribute("userTel");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<style type="text/css">
	th {width: 100px;}
	td {width: 150px;}
</style>
</head>
<body>

<div>
	<h1>이름, 전화번호, 아이디, 패스워드 출력</h1>
	<h2>(TestSession03.jsp)</h2>
	<hr>
</div>
<img src="image/123.jpg" height="200px">
<div>
	<form>
		<table class="table">
			<tr>
				<th>이름</th>
				<td><%=userName %></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><%=userTel %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=userId %></td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td><%=userPwd %></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>