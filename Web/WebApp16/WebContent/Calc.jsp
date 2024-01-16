<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
</head>
<body>

<div>
	<h1>JSP 액션 태그 실습</h1>
	<hr>
</div>

<div>
	<!-- 첫 번째 방법 : 스크립릿 영역에서 객체 생성 후 데이터 수신 → Calc ob = new Calc(); -->
	<!-- <form action="Calc_ok1.jsp" method="post" name="myForm"> -->
	
	<!-- 두 번째 방법 : JSP 액션 태그 활용하여 각각의 데이터 수신 → <jsp:setProperty property="op" name="ob"/> -->
	<!-- <form action="Calc_ok2.jsp" method="post" name="myForm"> -->
	
	<!-- 세 번째 방법 : JSP 액션 태그 활용하여 모든 데이터 한 번에 수신 → <jsp:setProperty property="*" name="ob"/> -->
	<form action="Calc_ok3.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th style="width: 150px">첫 번째 정수</th>
				<td>
					<input type="text" name="su1" class="txt">
				</td>
			</tr>
			<tr>
				<th>연산자</th>
				<td>
					<select name="op" style="width: 100%">
						<option value="+">더하기</option>
						<option value="-">빼기</option>
						<option value="*">곱하기</option>
						<option value="/">나누기</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>두 번째 정수</th>
				<td>
					<input type="text" name="su2" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" style="width:100%"> = </button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>