<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//① 이전 페이지(Send09.jsp)로부터 넘어온 데이터 수신
	// → userName
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	
	// ② 이 페이지에서 수행한 추가 작업
	request.setAttribute("message", "안녕하세요.");
	//-- request 객체의 key(message)의 값 안에
	//   "안녕하세요." 를 value 로 넣는 작업 수행
		
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_for.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>포워드</h2>
</div>

<div>
	<!-- <p>이름 : 홍길동</p> -->
	<p>이름 : <%=userName %></p>
</div>

<!-- ③ 포워드 -->
<jsp:forward page="Receive09.jsp"></jsp:forward>

</body>
</html>