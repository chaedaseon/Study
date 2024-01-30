<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
	// 이전 페이지(Send.jsp)로부터 넘어온 데이터 수신
	// → name, upload
	
	String name = request.getParameter("name");
	String upload = request.getParameter("upload");
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>

	<!-- 이름 : 어쩌구<br> -->
	이름 : <%=name %><br>
	<!-- 파일 : 어쩌구<br> -->	
	파일 : <%=upload %><br>	
	
</div>

<!-- 

	※ 『Send.jsp』 의 form 엘리먼트 enctype 속성의 속성값을
	   『enctype="multipart/form-data"』 와 같이 구성할 경우
	   form 의 내용을 바이너리 값의 형태로 전송한다는 의미로 활용되며,
	   이와 같은 방식을 통해 전송할 경우 수신된 데이터는

		이름 : null
		파일 : null 	
		
		로 확인된다.
		
		==> 이는, 바이너리 값을 getParameter() 를 통해 수신할 수 없다는 뜻이다.

-->

</body>
</html>