<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ① 이전 페이지(Send09.jsp)로부터 넘어온 데이터 수신
	// → userName
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	
	// ② 이 페이지에서 수행한 추가 작업
	request.setAttribute("message", "반갑습니다.");
	//-- request 객체의 key(message)의 값 안에
	//   "반갑습니다."를 value 로 넣는 작업 수행
	
	
	// ※
	// ③ 리다이렉트
	response.sendRedirect("Receive09.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09_re.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<div>
	<h2>리다이렉트</h2>
</div>

<div>
	<!-- <p>이름 : 홍길동</p> -->
	<p>이름 : <%=userName %></p>
</div>


</body>
</html>