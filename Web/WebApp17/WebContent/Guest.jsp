<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest.jsp</title>
<link rel="stylesheet" type="text/css" href="css/MemberScore.css">
<style type="text/css">
	textarea, td {text-align: left;}
</style>

<script type="text/javascript">

	function sendIt()
	{
		// 확인
		//alert("함수 호출");
		
		var f = document.myForm;
		
		//	:
		// 체크 및 검증할 내용의 코드 작성 가능...
		//	:
			
		f.submit();
	}

</script>
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr>
</div>

<div>
	<form action="Guest_ok.jsp" method="post" name="myForm">
		<table class="table">
			<tr>
				<th style="width: 100px;">이름</th>
				<td style="text-align: left;">
					<input type="text" class="txt" name="name">
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td style="text-align: left;">
					<input type="text" class="txt" name="title">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea cols="24.5" rows="5" name="text"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- ① submit 으로 구성 -->
					<!-- <button type="submit" class="btn" style="width: 100%;">방명록 작성</button> -->
					
					<!-- ② button 으로 구성 -->
					<button type="button" class="btn" style="width: 100%;"
					onclick="sendIt()">방명록 작성</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>