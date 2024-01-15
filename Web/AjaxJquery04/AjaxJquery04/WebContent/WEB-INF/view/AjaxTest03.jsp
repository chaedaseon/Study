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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
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
				// 데이터 전송 방식
				type:"POST"
				// 요청하는 페이지 주소(URL)
				, url:"ajaxtest03ok.do"
				// 넘겨줄 데이터
				, data:params
				// 데이터 전달이 성공적일 때 
				, success:function(args)
				{
					$("#result").html(args);
					$("#su1").val("");
					$("#su2").val("");
					$("#oper").val("add");
				}
				// 데이터를 보내기 전 확인 사항
				, beforeSend:checkSu
				//        ↓
				// beforeSend에 함수를 따로 호출하지 않는 경우 아래구문과 같이 작성
				/*
				, beforeSend:function()
				{
					return true;
				}
				*/
				// 에러 발생 시
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
		
	});
	
	function checkSu()
	{
		if (!$("#su1").val())
		{
			alert("첫 번째 숫자를 입력하세요.");
			$("#su1").focus();
			return false;
		}
		
		if (!$("#su2").val())
		{
			alert("두 번째 숫자를 입력하세요.");
			$("#su2").focus();
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>

<!--  
	ajaxtest03.do
	AjaxTest03Controller.java
	AjaxTest03.jsp
	ajaxtest03ok.do
	AjaxTest03OkController.java
	AjaxTest03_ok.jsp
	web.xml
-->

<div>
	<h1>jQuery 의 ajax() 활용 실습</h1>
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