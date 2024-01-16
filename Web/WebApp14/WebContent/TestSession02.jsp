<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(TestSession01.jsp)로부터 넘어온 데이터 수신
	// → userName, userTel
	
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// check~!!!
	// 추가~!!!
	session.setAttribute("userName", userName);
	session.setAttribute("userTel", userTel);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<style type="text/css">
	input {width: 200px;}
	.btn {width: 280px; height: 40px; font-size: 13pt; font-weight: bold;}
</style>
<script type="text/javascript">

	function insertIt()
	{
		//alert("함수 호출");
		
		var f = document.myForm;
		
		if (!f.userId.value)
		{
			alert("아이디를 입력하세요.");
			f.userId.focus();
			return;
		}
		
		if (!f.userPwd.value)
		{
			alert("패스워드를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();		
	}

</script>
</head>
<body>

<div>
	<h1>아이디, 패스워드 입력</h1>
	<h2>(TestSession02.jsp)</h2>
	<hr>
</div>
<img src="image/123.jpg" height="200px">
<div>
	<form action="TestSession03.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" id="userId" name="userId" class="txt">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="text" id="userPwd" name="userPwd" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" onclick="insertIt()">다음 페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>