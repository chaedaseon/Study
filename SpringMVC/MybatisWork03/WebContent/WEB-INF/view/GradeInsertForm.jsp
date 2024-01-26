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
<title>GradeInsertForm.jsp</title>
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
	#errSub1, #errSub2, #errSub3, #errGr1, #errGr2, #errGr3
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
			$("#errSub1").css("display", "none");
			$("#errSub2").css("display", "none");
			$("#errSub3").css("display", "none");
			$("#errGr1").css("display", "none");
			$("#errGr2").css("display", "none");
			$("#errGr3").css("display", "none");
			
			if ($("#sub1").val()=="")
			{
				$("#errSub1").css("display", "inline");
				return;
			}
				
			if ($("#sub2").val()=="")
			{
				$("#errSub2").css("display", "inline");
				return;
			}
			
			if ($("#sub3").val()=="")
			{
				$("#errSub3").css("display", "inline");
				return;
			}
			
			if (Number($("#sub1").val()) < 0 || Number($("#sub1").val()) > 100)
			{
				$("#errGr1").css("display", "inline");
				return;
			}
			
			if (Number($("#sub2").val()) < 0 || Number($("#sub2").val()) > 100)
			{
				$("#errGr2").css("display", "inline");
				return;
			}
				
			if (Number($("#sub3").val()) < 0 || Number($("#sub3").val()) > 100)
			{
				$("#errGr3").css("display", "inline");
				return;
			}
			
			
			$("#formGr").submit();
			
		});
		
		$("#btnRe").click(function()
		{
			$("#errSub1").css("display", "none");
			$("#errSub2").css("display", "none");
			$("#errSub3").css("display", "none");
			$("#errGr1").css("display", "none");
			$("#errGr2").css("display", "none");
			$("#errGr3").css("display", "none");
		});
		
	});

</script>
</head>
<body>

<div>
	<h1>성적 정보 입력</h1>
	<hr>
</div>


<div>
	<form action="gradeinsert.action" method="post" id="formGr">
		<table>
			<tr>
				<th>번호</th>
				<td>
					<input type="text" name="sid" id="sid" readonly="readonly" value="${sid }">
				</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" id="name" readonly="readonly" value="${name }">
				</td>
			</tr>
			<tr>
				<th>과목1</th>
				<td>
					<input type="text" name="sub1" id="sub1">
					<span id="errSub1">성적을 입력해주세요.</span>
					<span id="errGr1">0 ~ 100 사이의 성적을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>과목2</th>
				<td>
					<input type="text" name="sub2" id="sub2">
					<span id="errSub2">성적을 입력해주세요.</span>
					<span id="errGr2">0 ~ 100 사이의 성적을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th>과목3</th>
				<td>
					<input type="text" name="sub3" id="sub3">
					<span id="errSub3">성적을 입력해주세요.</span>
					<span id="errGr3">0 ~ 100 사이의 성적을 입력해주세요.</span>
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" id="btnIn" class="btn" style="width: 48%">추가</button>
					<button type="reset" id="btnRe" class="btn" style="width: 48%">다시입력</button>
				</th>				
			</tr>
			<tr>
				<th colspan="2">
					<button type="button" class="btnStr" onclick="location.href='gradelist.action'">돌아가기</button>
				</th>
			</tr>
		</table>
		
	</form>
</div>

</body>
</html>