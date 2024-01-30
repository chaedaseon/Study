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
<title>Write.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>파일업로드 - 단일파일업로드 및 다운로드</h1>
	<hr>
</div>

<div>
	<form action="Write_ok.jsp" method="post" enctype="multipart/form-data">
	
		작성자 : <input type="text" name="userName"><br>
		제목 : <input type="text" name="subject"><br>
		파일 : <input type="file" name="uploadFile"><br>
		<br>
		
		<button type="submit" class="btn">파일올리기</button>
	
	</form>
</div>

</body>
</html>