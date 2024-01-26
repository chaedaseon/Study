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
<title>StudentUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	h1 {text-align: center;}
	table {margin: auto;}
	.btnStr
	{
		width: 200px;
		font-weight: bold;
		font-size: 10pt;
	}
	#errName, #errTel
	{
		font-size: small; 
		color: red; 
		font-weight: bold; 
		display: none;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#btnIn").click(function()
		{
			$("#errName").css("display", "none");
			$("#errTel").css("display", "none");
			
			if ($("#name").val()=="")
			{
				$("#errName").css("display", "inline");
				return;
			}
				
			if ($("#tel").val()=="")
			{
				$("#errTel").css("display", "inline");
				return;
			}
			
			$("#formSt").submit();
			
		});
		
		$("#btnRe").click(function()
		{
			$("#errName").css("display", "none");
			$("#errTel").css("display", "none");
		});
		
	});

</script>
</head>
<body>

<div>
	<h1>학생 정보 수정</h1>
	<hr>
</div>

<div>
	<form action="studentupdate.action" method="post" id="formSt">
		<table>
			<tr>
				<th>번호</th>
				<td>
					<input type="text" name="sid" id="sid" value="${search.sid }" readonly="readonly">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" id="name" value="${search.name }">
					<span id="errName">이름을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="tel" name="tel" id="tel" value="${search.tel }">
					<span id="errTel">전화번호를 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" id="btnIn" class="btn" style="width: 48%">수정</button>
					<button type="reset" id="btnRe" class="btn" style="width: 48%">다시입력</button>
				</th>				
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" class="btnStr" onclick="location.href='studentlist.action'">돌아가기</button>
				</th>
			</tr>
		</table>
	</form>
</div>

</body>
</html>