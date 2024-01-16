<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsptest005.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>HttpServlet 관련 실습</h2>
	
	<!-- ※ 입력 컨트롤을 활용하여 서버로 데이터를 전송하기 위해서는 form 필요! -->
	<!-- ※ form 태그의 action 속성은
	        데이터 전송 및 페이지 요청을 해야하는
	        대상 페이지를 등록하는 기능을 수행한다.
	        (생략 시 데이터 전송 및 페이지 요청을 하게 되는 대상은 자기 자신) -->
	<!-- ※ form 태그의 method 속성은 데이터 전송 및 페이지 요청에 대한 방식
	        "get" → 엽서(내용이 보임), "post" → 편지(봉투 안에 있기에 내용이 안보임)라고 생각하기
	        (생략 시 데이터 전송 및 페이지 요청을 하게 되는 방식은 get) -->
	<form action="/WebApp04/login" method="get">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<!-- name 속성 check~!!! -->
					<input type="text" name="userId" size="10" maxlength="10" class="txt">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<!-- name 속성 check~!!! -->
					<input type="password" name="userPwd" size="10" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<!-- ※ submit 액션 → form 데이터 전송 및 페이지 요청 -->
					<input type="submit" value="로그인" class="btn control"
					style="width: 48%;">
					<input type="reset" value="다시입력" class="btn control"
					style="width: 48%;">
				</td>
			</tr>
		</table>
	</form>
	
</div>

</body>
</html>