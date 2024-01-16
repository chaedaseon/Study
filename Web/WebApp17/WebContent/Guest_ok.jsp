<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<%-- 
<jsp:setProperty property="name" name="ob"/>
<jsp:setProperty property="title" name="ob"/>
<jsp:setProperty property="text" name="ob"/>
 --%>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<div>
	<h2>작성된 내용</h2>
	<!-- <h3>이름 : 홍길동</h3> -->
	<h3>이름 : <%=ob.getName() %></h3>
	
	<!-- <h3>제목 : 어쩌구저쩌구</h3> -->
	<h3>제목 : <%=ob.getTitle() %></h3>
	
	<!-- <h3>내용 : 이러쿵 저러쿵 궁시렁 궁시렁</h3> -->
	<h3>내용 : <%=ob.getText().replaceAll("\n", "<br>") %></h3>
</div>

</body>
</html>