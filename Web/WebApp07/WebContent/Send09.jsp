<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Send09.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 09</h1>
	<hr>
</div>

<!-- Send09.jsp → Send09_re.jsp	→ Receive09.jsp -->
<!-- Send09.jsp → Send09_for.jsp	→ Receive09.jsp -->

<!-- 사용자 최초 요청 페이지 -->
<!-- http://localhost:3306/WebApp07/Send09.jsp -->

<div>
	<h2>포워딩 및 리다이렉트</h2>
</div>

<div>
	<!-- action 처리에 대한 분기~!!! -->
	<form action="" method="post" id="testForm">
		이름
		<input type="text" name="userName" class="txt">
		<br><br>
		
		<button type="submit" class="btn" style="width: 150px;"
		onclick="this.form.action='Send09_re.jsp'">리다이렉트</button>
		
		<button type="submit" class="btn" style="width: 150px;"
		onclick="this.form.action='Send09_for.jsp'">포워드</button>
	</form>
</div>

</body>
</html>