<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp → TableOk.jsp</p>
</div>

<div>
	<form action="TableOk.jsp" method="post">
		<table class="table">
			<tr>
				<th>가로</th>
				<td>
					<input type="text" name="su1" class="txt">
				</td>
			</tr>
			<tr>
				<th>세로</th>
				<td>
					<input type="text" name="su2" class="txt">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn control" style="width: 340px; font-size: 13pt;">
					결과 확인
					</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>