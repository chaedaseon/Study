<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend.jsp</title>
<link rel="stylesheet" type="text/css" href="css/basic.css">

<script type="text/javascript">

	function sendIt()
	{
		var f = document.myForm;
		
		if (!f.name.value)
		{
			alert("이름을 입력하세요.");
			f.name.focus();
			return;
		}		
		
		f.submit();
	}
	
</script>
</head>
<body>

<div>
	<h1>데이터 입력</h1>
	<hr>
</div>

<!-- com.test.FriendDTO -->
<!-- Friend_ok.jsp -->

<div>
	<form action="Friend_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" class="txt" name="name" id="name">
				</td>
			</tr>
			<tr>
				<th>나이</th>
				<td>
					<input type="text" class="txt" name="age">
				</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<label>
						<input type="radio" name="radio" value="남자" checked="checked"> 남자
					</label>
					<label>
						<input type="radio" name="radio" value="여자"> 여자
					</label>
				</td>
			</tr>
			<tr>
				<th>이상형</th>
				<td>
					<label>
						<input type="checkbox" name="check" value="원빈"> 원빈
					</label>
					<label>
						<input type="checkbox" name="check" value="천우희"> 천우희
					</label>
					<label>
						<input type="checkbox" name="check" value="카리나"> 카리나
					</label>
					<br>
					<label>
						<input type="checkbox" name="check" value="정우성"> 정우성
					</label>					
					<label>
						<input type="checkbox" name="check" value="이동욱"> 이동욱
					</label>
					<label>
						<input type="checkbox" name="check" value="한소희"> 한소희
					</label>
					<br>
					<label>
						<input type="checkbox" name="check" value="정해인"> 정해인
					</label>
					<label>
						<input type="checkbox" name="check" value="수지"> 수지
					</label>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" class="btn" style="width:100%;"
					onclick="sendIt()">등록</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>