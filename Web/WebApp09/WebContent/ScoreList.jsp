<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(select)
	String sql = "SELECT SID, NAME, KOR, ENG, MAT, (KOR+ENG+MAT) AS TOT, ROUND(((KOR+ENG+MAT)/3),1) AS AVG FROM TBL_SCORE ORDER BY SID";
	
	// 작업 객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	// 반복문 구
	ResultSet rs = stmt.executeQuery(sql);
	String str = "";
	
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th>번호</th>";
	str += "<th>이름</th>";
	str += "<th>국어점수</th>";
	str += "<th>영어점수</th>";
	str += "<th>수학점수</th>";
	str += "<th>총점</th>";
	str += "<th>평균</th>";
	str += "</tr>";
	while (rs.next())
	{
		str += "<tr>";
		str += "<td>" + rs.getString("SID") + "</td>";
		str += "<td>" + rs.getString("NAME") + "</td>";
		str += "<td>" + rs.getString("KOR") + "</td>";
		str += "<td>" + rs.getString("ENG") + "</td>";
		str += "<td>" + rs.getString("MAT") + "</td>";
		str += "<td>" + rs.getString("TOT") + "</td>";
		str += "<td>" + rs.getString("AVG") + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.errMsg {font-size: small; font-weight: bold; color: red; display: none;}
	.errSc {font-size: small; font-weight: bold; color: red; display: none;}
	input {width: 200px;}
	button {width: 208px; font-size: 13pt; font-weight: bold;}
	.table {text-align: center;}
	.tbl {margin: auto;}
</style>

<script type="text/javascript">

	function formCheck()
	{
		//alert("호출 확인");
		
		var uName = document.getElementById("userName");
		var nameErr = document.getElementById("nameErr");
		
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		var korErr = document.getElementById("korErr");
		var engErr = document.getElementById("engErr");
		var matErr = document.getElementById("matErr");
		
		nameErr.style.display = "none";
		korErr.style.display = "none";
		engErr.style.display = "none";
		matErr.style.display = "none";
		
		if (uName.value=="")
		{
			nameErr.style.display = "inline";
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
		
		return true;
		//return false;
	}

</script>

</head>
<body>

<!--
	○ WebApp09
	
	   - 여러 명의 이름, 국어점수, 영어점수, 수학점수를 입력받아
	     총점과 평균을 계산하여 리스트를 출력해줄 수 있는 프로그램을 구현한다.
	   - 리스트 출력 시 번호 오름차순 정렬하여 출력할 수 있도록 한다.
	   - 데이터베이스 연동하여 처리한다.
	     (TBL_SCORE, SCORESEQ 활용)
	   - 즉, 성적 처리 프로그램을 데이터베이스 연동하여
	     JSP 로 구성할 수 있도록 한다.
	    	     
	 데이터베이스 연결 및 데이터 처리    
	 ---------------------------------------------------------------------
	 성적 처리
	 
	 이름(*)	[ textbox ] → 이름 입력 확인
	 국어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	 영어점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	 수학점수	[ textbox ] → 0 ~ 100 사이의 정수가 입력되었는지 확인
	 
	 < 성적 추가 > 			→ button
	 
	 번호	이름		국어점수 영어점수 수학점수		총점	평균
	  1	   임하성		   90       80       70			xxx		xx.x
	  2	   이윤수		   80       70       60			xxx		xx.x
	  
	 ---------------------------------------------------------------------
	  
	○ WebApp09_scott.spl
	   ScoreList.jsp
	   ScoreInsert.jsp
	   com.util.DBConn.java
	   
-->

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<br>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table class="tbl">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor" class="txt">
					<span class="errSc" id="korErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng" class="txt">
					<span class="errSc" id="engErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat" class="txt">
					<span class="errSc" id="matErr">0 ~ 100 사이의 정수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div>
	<form>
		<!-- 처리 결과 -->
		<%=str %>
	</form>
</div>

</body>
</html>