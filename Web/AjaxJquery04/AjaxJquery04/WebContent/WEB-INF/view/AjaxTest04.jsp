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
<title>AjaxTest04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendButton").click(function()
		{
			//alert("확인");
			
			var params = "title=" + $.trim($("#title").val()) 
					+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"ajaxtest04ok.do"
				, data:params
				, dataType:"xml"
				, success:function(args) 
				{
					var out = "";
					$(args).find("records").each(function()
					{
						var item = $(this);
						var num = item.attr("id");
						var title = item.find("title").text();
						var content = item.find("content").text();
						
						out += ">> id = " + num + "<br>- title = " + title + "<br>- content = " + content + "<br>";
						
					});
					
					$("#resultDiv").html(out);
					$("#title").val("");
					$("#content").val("");
					$("#title").focus();
				}
				, beforeSend:checkText
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
		
	});
	
	function checkText()
	{
		if (!$("#title").val())
		{
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}
		
		if (!$("#content").val())
		{
			alert("제목을 입력하세요.");
			$("#content").focus();
			return false;
		}
		
		return true;
	}

</script>
</head>
<body>

<!--  
	ajaxtest04.do
	AjaxTest04Controller.java
	AjaxTest04.jsp
	ajaxtest04ok.do
	AjaxTest04OkController.java
	AjaxTest04_ok.jsp			-- xml
	web.xml
-->

<div>
	<h1>jQuery 의 ajax() 활용 실습</h1>
	<p>xml control</p>
	<hr>
</div>

<div>
	제목
	<input type="text" id="title" class="txt">
	<br><br>
	
	내용
	<input type="text" id="content" class="txt">
	<br><br>
	
	<input type="button" value="등록하기" id="sendButton" class="btn">
</div>
<br>

<div id="resultDiv">
</div>

</body>
</html>