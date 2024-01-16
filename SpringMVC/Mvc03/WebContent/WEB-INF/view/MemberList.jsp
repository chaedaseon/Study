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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	* {line-height: 150%;}
	#customers td {text-align: center;}
	#submitBtn
	{
		height: 150%;
		width: 275px;
		font-size: 18px;
		font-weight: bold;
		font-family: 맑은 고딕;
		color: #343;
		margin: 10px;
	}
	#err
	{
		color: red;
		font-size: small;
		display: none;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			// 테스트
			//alert("확인");
			
			// 이름과 전화번호 두 항목 모두 필수 입력 항목이기 때문에... 생략 가능
			$("#err").css("display", "none");
			
			if ($("#name").val()=="" || $("#telephone").val()=="")
			{
				$("#err").css("display", "inline");
				return;
			}
			
			$("#memberForm").submit();			
			
		});	
	});

</script>
</head>
<body>

<div>
	<h1>회원 관리</h1>
	<hr>
</div>

<div>
	<form action="memberinsert.do" method="post" id="memberForm">
		이름
		<input type="text" name="name" id="name" class="control" required="required">
		<br>
		전화
		<input type="text" name="telephone" id="telephone" class="control" required="required">
		<br>
		<button type="button" id="submitBtn">회원 추가</button>
		<span id="err">모든 항목을 입력해야 합니다.</span>
	</form>
	
	<br>
	<%-- EL 표현에 의한 전체 인원 수 출력 부분 --%>
	<%-- <p>전체 인원 수 : 2명</p> --%>
	<p>전체 인원 수 : ${count }명</p>
	
	<table id="customers" style="width: 500px;" class="table">
		<tr>
			<th>번호</th><th>이름</th><th>전화번호</th>
		</tr>		
		<%-- 
		<tr>
			<td>1</td>
			<td>고길동</td>
			<td>010-1212-3434</td>
		</tr>
		<tr>
			<td>2</td>
			<td>마이콜</td>
			<td>010-4455-6677</td>
		</tr>
		--%>
		<%-- EL, JSTL 표현에 의한 회원 명단 출력 부분 --%>
		<c:forEach var="member" items="${memberList}">
		<tr>
			<%-- MemberDTO 객체의 --%>
			<%-- getMid(), getName(), getTelephone() 메소드 호출하는 EL 표현 --%>
			<td>${member.mid }</td>
			<td>${member.name }</td>
			<td>${member.telephone }</td>
		</tr>
		</c:forEach>
	</table>
</div>

</body>
</html>