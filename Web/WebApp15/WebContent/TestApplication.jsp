<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 접속자 수
	int n = 0;
	
	String count = (String)application.getAttribute("count");
	
	if (count != null)
		n = Integer.parseInt(count);
	
	n++;
	
	application.setAttribute("count", Integer.toString(n));
	
	String realPath = application.getRealPath("/");
	application.log("접속자 : " + request.getRemoteAddr());
	// localhost 접속 시 콘솔 창 → 정보: 접속자 : 0:0:0:0:0:0:0:1
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestApplication.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>Application 을 활용한 접속자 수 체크</h1>
	<hr>
</div>

<div>
	<h2>총 접속자 : <%=n %></h2>
	웹 서버 실제 경로 : <%=realPath %>
</div>
	
</body>
</html>