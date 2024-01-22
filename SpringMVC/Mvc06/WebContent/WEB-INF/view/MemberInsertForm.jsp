<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>입력폼</h1>
	<hr>
</div>

<div>
	<form action="memberinsert.action" method="post">
		<label>
			아이디
			<input type="text" name="id"><br>
		</label>
		<label>
			패스워드
			<input type="password" name="pw"><br>
		</label>
		<label>
			이름
			<input type="text" name="name"><br>
		</label>
		<label>
			전화
			<input type="tel" name="tel"><br>
		</label>
		<label>
			이메일
			<input type="email" name="email"><br>
		</label>
		<br>
		
		<button type="submit" class="btn">입력완료</button>
		<button type="reset" class="btn">다시입력</button>
	
	
	</form>
</div>

</body>
</html>