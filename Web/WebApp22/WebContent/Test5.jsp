<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test5.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSTL 코어(Core) forEach문 실습</h1>
	<hr>
</div>

<div>
	<table class="table">
		
		<!-- JSTL 코어(Core) 반복문 -->
		<%-- <c:forEach var ="변수" begin="시작값" end="끝값" step="증가값"> --%>
		<c:forEach var ="a" begin="1" end="9" step="1">	    <!-- a → 1 2 3 4 5 6 7 8 9 -->
		<tr>
			<c:forEach var="b" begin="1" end="9" step="1">  <!-- b → 1 2 3 4 5 6 7 8 9 -->
			<td style="width: 20px;">
				${a*b }
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
		
	</table>
</div>

</body>
</html>