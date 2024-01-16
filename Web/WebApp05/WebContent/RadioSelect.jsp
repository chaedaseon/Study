<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">

	.txt {width: 100px;}

</style>

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelectOk.jsp</p>
</div>

<div>
	<h2>radio, select 데이터 전송</h2>
	
	<form action="RadioSelectOk.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br><br>
		
		성별
		<label><input type="radio" name="gender" value="M">남자</label>
		<label><input type="radio" name="gender" value="F">여자</label>
		<br><br>
		
		전공
		<select name="major">
			<option value="국문학">국문학</option>
			<option value="영문학">영문학</option>
			<option value="컴퓨터공학">컴퓨터공학</option>
			<option value="수학">수학</option>
			<option value="신문방속학">신문방속학</option>
			<option value="경영학">경영학</option>
		</select>
		<br><br>
		
		취미
		<select name="hobby" size="7" multiple="multiple">
			<option value="영화감상">영화감상</option>
			<option value="음악감상">음악감상</option>
			<option value="공원산책">공원산책</option>
			<option value="배낭여행">배낭여행</option>
			<option value="스노클링">스노클링</option>
			<option value="암벽등반">암벽등반</option>
			<option value="종이접기">종이접기</option>
		</select>
		<br><br>
		
		<input type="submit" value="내용 전송" class="btn control">
	</form>
</div>

</body>
</html>