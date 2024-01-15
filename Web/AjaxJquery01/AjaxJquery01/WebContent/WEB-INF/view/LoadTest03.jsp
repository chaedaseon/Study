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
<title>LoadTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	.txtNum
	{
		width: 100px;
		text-align: right;
	}
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$(".btn").click(function()
		{
			//alert("확인");
			var su1 = $("#su1").val();
			var su2 = $("#su2").val();
			var oper = $("#oper").val();
			
			// 방법 1. 같이 한 풀이
			//var url = "loadtest03.do?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper;
			//$("#result").load(url);				// responseText
			
			// 방법 2. 내가 한 풀이
			$("#result").load("loadtest03.do?su1=" + su1 + "&su2=" + su2 + "&oper=" + oper);			
			
		});
	});

</script>

</head>
<body>

<div>
	<h1>jQuery 의 load() 활용 실습</h1>
	<hr>
</div>

<div>
	<input type="text" id="su1" class="txt txtNum">
	
	<select id="oper">
		<option value="add">덧셈</option>
		<option value="sub">뺄셈</option>
		<option value="mul">곱셈</option>
		<option value="div">나눗셈</option>
	</select>
	
	<input type="text" id="su2" class="txt txtNum">
	
	<input type="button" value=" = " id="sendButton" class="btn">	
</div>
<br>

<!-- 
loadtest03send.do → Test03Send.java → LoadTest03.jsp
											  ↓
                                        loadtest03.do → LoadTest03.java → LoadTest03_ok.jsp
 -->
<div id="result">
</div>
<br>
<br>

<div>
	<input type="radio" name="rdo">rdo1
	<input type="radio" name="rdo">rdo2
</div>

<div>
	<input type="checkbox" name="chk">chk1
	<input type="checkbox" name="chk">chk2
</div>

<div>
	<input type="text">
</div>

</body>
</html>