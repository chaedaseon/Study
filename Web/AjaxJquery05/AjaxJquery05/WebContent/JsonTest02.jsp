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
<title>JsonTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// 테스트
			//alert("확인");
			
			// 데이터 구성
			var params = "name=" + $.trim($("#name").val())
					+ "&content=" + $.trim($("#content").val());
			
			$.ajax(
			{
				type:"POST"
				, url:"JsonTest02_ok.jsp"
				, data:params
				, dataType:"json"			//-- check~!!!
				, success:function(jsonObj)
				{
					var out = "";
					
					// 수신된 jsonObj 는 JSON 배열 객체
					// → 배열방만큼(배열의 길이만큼) 반복문 순환					
					for (var i=0; i<jsonObj.length; i++)
					{
						var num = jsonObj[i].num;
						var name = jsonObj[i].name;
						var content = jsonObj[i].content;
						
						out += "<br>===================";
						out += "<br> 번호 : " + num;
						out += "<br> 이름 : " + name;
						out += "<br> 내용 : " + content;
						out += "<br>===================";
					}
					
					$("#result").html(out);
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();					
					
				}
				, beforeSend:function()
				{
					var flag = true;
					
					if (!$.trim($("#name").val()))
					{
						alert("이름을 입력해야 합니다.");
						$("#name").focus();
						flag = false;
					}
					
					if (!$.trim($("#content").val()))
					{
						alert("내용을 입력해야 합니다.");
						$("#content").focus();
						flag = false;
					}
					
					return flag;
				}
				, error:function(e)
				{
					alert(e.responseText);
				}
			});
			
		});
	});

</script>
</head>
<body>

<div>
	<h1>jQuery 의 ajax() 활용 실습</h1>
	<p>json control</p>
	<hr>
</div>

<div>
	이름 <input type="text" id="name" class="txt">
	<br><br>
	
	내용 <input type="text" id="content" class="txt">
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn" class="btn">
</div>
<br><br>

<div id="result">
</div>

</body>
</html>