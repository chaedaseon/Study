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
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>파일 시스템 및 파일 업로드</h1>
	<hr />
</div>

<div>
	<!-- 『enctype="multipart/form-data"』 : 파일을 물리적으로 업로드 하기 위한 속성 -->
	<!-- 『method="post"』 : 파일을 물리적으로 업로드 하기 위한 요청 및 전송 방식 -->
	<form action="Receive.jsp" method="post" enctype="multipart/form-data">
	
		이름 : <input type="text" name="name">
		<br>
		
		<!-- 파일 업로드 대화창 구성 -->
		파일 : <input type="file" name="upload">
		<br>
		
		<!-- submit 액션 처리 -->
		<button type="submit" class="btn">전송</button>

	</form>
</div>

</body>
</html>