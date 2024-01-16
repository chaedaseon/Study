<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리) -->
<%
	String str = "";
	if (ob.getCheck() != null)
	{
		for (String temp : ob.getCheck())
		{
			str += temp + " ";
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
	<hr>
</div>

<div>
	<!-- 내용 -->
	<form>
		<table class="table">
			<tr>
				<th>이름</th>
				<td><%=ob.getName() %></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><%=ob.getAge() %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=ob.getRadio() %></td>
			</tr>
			<tr>
				<th>이상형</th>
				<!-- FriendDTO.java의 checkRes()로 checkbox의 다중값을 수신 -->
				<%-- <td><%=ob.checkRes() %></td> --%>
				
				<!-- Friend_ok.jsp의 스크립릿 영역에서 다중값 수신 -->
				<td><%=str %></td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>