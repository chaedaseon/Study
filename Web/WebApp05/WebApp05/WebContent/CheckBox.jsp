<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBox.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp → CheckBoxOk.jsp</p>
</div>

<div>
	<form action="CheckBoxOk.jsp" method="post">
		이름 <input type="text" name="name" class="txt">
		<br><br>
		
		메모<br>
		<textarea rows="5" cols="30" name="memo"></textarea>
		<br><br>
		
		이상형<br>
		<label><input type="checkbox" value="조휴일" name="checkbox">조휴일</label>
		<label><input type="checkbox" value="유재석" name="checkbox">유재석</label>
		<label><input type="checkbox" value="류진" name="checkbox">류진</label>
		<label><input type="checkbox" value="윈터" name="checkbox">윈터</label>
		<label><input type="checkbox" value="정우성" name="checkbox">정우성</label>
		<br>
		
		<label><input type="checkbox" value="차은우" name="checkbox">차은우</label>
		<label><input type="checkbox" value="카리나" name="checkbox">카리나</label>
		<label><input type="checkbox" value="서강준" name="checkbox">서강준</label>
		<label><input type="checkbox" value="박은빈" name="checkbox">박은빈</label>
		<label><input type="checkbox" value="고윤정" name="checkbox">고윤정</label>
		<br><br>
		
		<input type="submit" value="전송하기" class="btn control" style="width: 200px;">
				
	</form>
</div>

</body>
</html>