<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send04.html)로부터 넘어온 데이터 수신
	// → id, pwd, name, tel, gender, city, subject
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String city = request.getParameter("city");
	String[] subjects = request.getParameterValues("subject");
	
	String subject = "";
	if (subjects != null)
	{
		for (int i=0; i<subjects.length; i++)
			subject += "[" + subjects[i] + "] ";
	}
	else
		subject = "없음";
	
	// ※ 추후에는 수신된 데이터를... 쿼리문을 통해 DB에 입력하는
	//    처리 과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">

	th {width: 100px; background-color: #fff1f0;}
	td {width: 200px; text-align: center;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<div>
	<h2>가입 승인 내역</h2>
	<div style="font-weight:  bold;">
	<table border="1">
		<tr>
			<th colspan="2" style="font-size: 15pt;">회원 정보</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=id %></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><%=pwd %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=name %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=tel %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=gender %></td>
		</tr>
		<tr>
			<th>지역</th>
			<td><%=city %></td>
		</tr>
		<tr>
			<th>수강과목</th>
			<td><%=subject %></td>
		</tr>
	</table>
	</div>
</div>

</body>
</html>