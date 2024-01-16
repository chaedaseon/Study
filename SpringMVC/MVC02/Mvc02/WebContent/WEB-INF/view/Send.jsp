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
<title>Send.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Spring MVC 데이터 송수신 실습</h1>
	<hr>
</div>

<div>
	<form action="receive.do" method="post">
		이름 <input type="text" name="userName">
		<button type="submit">submit</button>	
	</form>
</div>

	<!-- receive.do -->
	<!-- → 안녕하세요. 홍길동님 반갑습니다. -->

</body>
</html>