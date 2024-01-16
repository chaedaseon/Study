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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h2>JSTL 코어(Core)를 활용한 회원 정보 입력</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		
		<!-- (이름, 전화번호, 주소) * 5명 분 -->
		<!-- → submit 액션 처리 -->
		<!-- 내가 한 풀이 -->
		<%-- 
		<c:forEach var="num" begin="1" end="5" step="1">		 
			이름
			<input type="text" name="name${num }" class="txt"><br>
			전화번호
			<input type="text" name="tel${num }" class="txt"><br>
			주소
			<input type="text" name="addr${num }" class="txt"><br>
			<br>
		 </c:forEach>
			<button type="submit" class="btn">입력</button>
		 --%>
		
		<!-- 같이 한 풀이 -->
		<table class="table">
			<tr>
				<th>이름</th>
				<td>
					<!-- 
					<input type="text" name="name1">
					<input type="text" name="name2">
					<input type="text" name="name3">
					<input type="text" name="name4">
					<input type="text" name="name5">
					-->
					<c:set var="i" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<%-- <input type="text" name="name${a }"> --%>
						<input type="text" name="name${i }">
						<c:set var="i" value="${i+1 }"></c:set>					
					</c:forEach>
				</td>				
			</tr>			
			<tr>
				<th>전화번호</th>
				<td>
					<!-- 
					<input type="text" name="tel1">
					<input type="text" name="tel2">
					<input type="text" name="tel3">
					<input type="text" name="tel4">
					<input type="text" name="tel5">
					-->
					<c:set var="i" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<%-- <input type="text" name="tel${a }"> --%>
						<input type="text" name="tel${i }">
						<c:set var="i" value="${i+1 }"></c:set>					
					</c:forEach>
				</td>				
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<!-- 
					<input type="text" name="addr1">
					<input type="text" name="addr2">
					<input type="text" name="addr3">
					<input type="text" name="addr4">
					<input type="text" name="addr5">
					-->
					<c:set var="i" value="1"></c:set>
					<c:forEach var="a" begin="1" end="5" step="1">
						<%-- <input type="text" name="addr${a }"> --%>
						<input type="text" name="addr${i }">
						<c:set var="i" value="${i+1 }"></c:set>					
					</c:forEach>
				</td>				
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" style="width:100%">입력</button>
				</td>
			</tr>
		</table>
		
	</form>	
</div>

</body>
</html>