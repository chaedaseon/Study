<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	request.setAttribute("result", "EL 테스트 및 관찰");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test3.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>EL 관련 실습</h1>
	<hr>
</div>

<div>
	<!-- action 속성 생략 → su1과 su2 데이터를 전송하며 요청하는 페이지는 자기 자신~!!! -->
	<form method="post">
		정수 1 <input type="text" name="su1" class="txt"><br>
		정수 2 <input type="text" name="su2" class="txt"><br>
		<br>
		<button type="submit" class="btn">결과 확인</button>
	</form>
</div>
<br>

<div>
	<h2>폼 데이터 수신</h2>
	
	<!-- 폼의 데이터를 수신하는 방법 1 -->
	<h3><%=request.getParameter("su1") %></h3>
	
	<!-- 폼의 데이터를 수신하는 방법 2 -->
	<h3>${param.su1 }</h3>	
</div>
<br><br>

<div>
	<h2>폼의 데이터를 받아 연산 수행</h2>
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 1 -->
	<%
		String s1 = request.getParameter("su1");
		String s2 = request.getParameter("su2");
		
		int s = 0;
		
		if (s1!=null && s2!=null)
		{
			s = Integer.parseInt(s1) + Integer.parseInt(s2);
		}
	%>
	<h3>합 : <%=s %></h3>
	
	<!-- 폼의 데이터를 받아 연산을 수행하는 방법 2 -->
	<h3>합 : ${param.su1 + param.su2 }</h3>
	<!-- → 파라미터 수신도 알아서... -->
	<!-- → 필요한 캐스팅(형 변환)도 알아서 자동으로 수행... -->
	<!-- → null 을 대하는 방식... : 사용자가 알아보기 쉽게 -->
		
</div>
<br><br>

<div>
	<h2>setAttribute() 로 넘긴 데이터 수신</h2>
	
	<!-- setAttribute() 로 넘긴 데이터를 수신하는 방법 1 -->
	<h3><%=(String)request.getAttribute("result") %></h3>
	
	<!-- setAttribute() 로 넘긴 데이터를 수신하는 방법 2 -->
	<h3>${result }</h3>
	
</div>



</body>
</html>