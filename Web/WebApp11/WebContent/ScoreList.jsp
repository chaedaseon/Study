<%@page import="com.test.ScoreDAO"%>
<%@page import="com.test.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;
	
	String scoreCount = "<span> <전체 인원 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명></span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th><th>수학점수</th><th>총점</th><th>평균</th>");
		
		for (ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td>" + score.getSid() + "</td>");
			str.append("<td>" + score.getName() + "</td>");
			str.append("<td>" + score.getKor() + "</td>");
			str.append("<td>" + score.getEng() + "</td>");
			str.append("<td>" + score.getMat() + "</td>");
			str.append("<td>" + score.getTot() + "</td>");
			str.append("<td>" + String.format("%.1f", score.getAvg()) + "</td>");
			str.append("</tr>");
		}
		
		
		str.append("</table>");
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.scoreMsg {font-size: small; color:red; display: none;}
	.nameMsg {font-size: small; color:red; display: none;}
	input {width: 200px;}
	button {width: 208px; font-size: 13pt; font-weight: bold;}
	.table {text-align: center;}
</style>

<script type="text/javascript">

	function formCheck()
	{
		// 확인
		//alert("함수 호출");
		var userName = document.getElementById("userName");
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		
		var nameMsg = document.getElementById("nameMsg");
		var korErr = document.getElementById("korErr");
		var engErr = document.getElementById("engErr");
		var matErr = document.getElementById("matErr");
		
		nameMsg.style.display = "none";
		korErr.style.display = "none";
		engErr.style.display = "none";
		matErr.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			return false;
		}
		
		if (kor.value<0 || kor.value>100 || kor.value=="")
		{
			korErr.style.display = "inline";
			return false;
		}
		
		if (eng.value<0 || eng.value>100 || eng.value=="")
		{
			engErr.style.display = "inline";
			return false;
		}
		
		if (mat.value<0 || mat.value>100 || mat.value=="")
		{
			matErr.style.display = "inline";
			return false;
		}	

		//return false;
		return true;
	}

</script>

</head>
<body>

<div>
	<h1>데이터베이스 연동 성적관리 실습</h1>
	<hr>
</div>

<div>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="nameMsg" id="nameMsg">이름을 입력하세요.</span>
				</td>
			</tr>
			<tr>	
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txt">
					<span class="scoreMsg" id="korErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txt">
					<span class="scoreMsg" id="engErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txt">
					<span class="scoreMsg" id="matErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" class="btn">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div>
	<%=scoreCount %>
	<br><br>
	<%=str.toString() %>
</div>

</body>
</html>