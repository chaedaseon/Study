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
<title>UploadForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<div>
	<h1>파일 입력 폼</h1>
	<hr />
</div>


<div>
	<form action="Receive.jsp" method="post" enctype="multipart/form-data">
	
		file : <input type="file" name="file" size="50">
		<br>
		
		text : <input type="text" name="text" size="30">
		<br>
		
		
		<input type="submit" value="upload">
	
	</form>
</div>

</body>
</html>