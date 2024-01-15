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
<title>JsonTest03.jsp</title>
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

	$(function()
	{
		$("#sendButton").click(function()
		{
			//alert("확인");
			var params = "su1=" + $.trim($("#su1").val())
					+ "&su2=" + $.trim($("#su2").val())
					+ "&oper=" + $.trim($("#oper").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"jsontest03ok.do"
				, data:params
				, dataType: "json"
				, success:function(jsonObj)
				{
					var out = "";
					
					var su1 = jsonObj.su1;
					var su2 = jsonObj.su2;
					var oper = jsonObj.oper;
					var result = jsonObj.result;
					
					out += "연산결과 : " + result;
										
					$("#result").html(out);
					$("#su1").val("");
					$("#su2").val("");
					$("#oper").val("add");					
				}
				, beforeSend:checkInput
				, error:function(e)
				{
					alert(e.responseText);
				}
			});			
			
		});
		
	});
		
	function checkInput()
	{
		if (!$.trim($("#su1").val()))
		{
			alert("첫 번째 정수를 입력해야 합니다.");
			$("#su1").focus();
			
			return false;
		}
		
		if (!$.trim($("#su2").val()))
		{
			alert("두 번째 정수를 입력해야 합니다.");
			$("#su2").focus();
			
			return false;
		}
		
		return true;
	}
</script>


</head>
<body>

<div>
	<h1>jQuery 의 ajax() 활용 실습</h1>
	<p>json control</p>
	<hr>
</div>

<!--  
	jsontest03.do
	JsonTest03Controller.java
	JsonTest03.jsp
	jsontest03ok.do
	JsonTest03OkController.java
	JsonTest03_ok.jsp
	web.xml
-->

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