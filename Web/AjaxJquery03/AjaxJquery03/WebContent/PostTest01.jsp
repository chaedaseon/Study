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
<title>PostTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	#resultDiv
	{
		width: 240px;
		height: 180px;
		border: 2px solid #499bd7;
		padding: 4px;
		
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// 테스트
			//alert("확인");
			
			// ※ 『post()』
			//    『$.post(url, data, callBack);』
			//    - 매개변수로 전달받은 URL 을 사용하여
			//      서버에 대한 POST 요청을 전송한다.
			//    - 매개변수
			//      ·url      : (String) POST 함수로 연결하는 서버 측 URL
			//      ·date     : (Object) 이름과 값의 쌍으로 프로퍼티를 가진 객체.
			//                   미리 구성 및 인코딩 된 쿼리 스트링.
			//      ·callBack : (Function) 요청이 완료되면 호출되는 함수.
			
			$.post("PostTest01_ok.jsp"
			, {title:$("#title").val(), content:$("#content").val()}
			, function(data)
			{
				$("#resultDiv").html(data);
			});
			
			
		});
		
		
	});

</script>
</head>
<body>

<div>
	<h1>jQuery 의 post() 활용 실습</h1>
	<hr>
</div>

<div>
	제목 <input type="text" id="title" class="txt">
	<br>
	내용 <input type="text" id="content" class="txt">
	<br>
	
	<input type="button" id="sendBtn" value="보내기" class="btn">
</div>
<br><br>

<div id="resultDiv">
</div>

</body>
</html>