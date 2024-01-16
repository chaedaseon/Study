<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 결과값 변수
	String str = "";

	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비
	String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";
	
	// 작업 객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	// 결과 ResultSet 에 대한 처리 → 반복문 구성
	str += "<table class='table'>";
	str += "<tr>";
	str += "<th id='numTitle'>번호</th>";
	str += "<th id='nameTitle'>이름</th>";
	str += "<th id='telTitle'>전화번호</th>";
	str += "</tr>";
	
	while (rs.next())
	{
		str += "<tr>";
		str += "<td class='contentTd'>" + rs.getString("SID") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("NAME") + "</td>";
		str += "<td class='contentTd'>" + rs.getString("TEL") + "</td>";
		str += "</tr>";
	}
	
	str += "</table>";
	
	rs.close();
	stmt.close();
	DBConn.close();	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test002.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	input {width: 200px;}
	button {width: 208px; height: 50px; font-weight: bold; font-size: 15pt;}
	#numTitle {width: 50px;}
	#nameTitle {width: 100px;}
	#telTitle {width: 160px;}
	.errMsg {font-size: small; color: red; display: none;}
	.contentTd {text-align: center;}
</style>

<script type="text/javascript">

	// 필수 입력 항목(→ 이름)에 대한 기본적인 입력 확인
	function formCheck()
	{
		// 확인
		//alert("함수 호출");
		
		var uName = document.getElementById("userName");
		var nameErr = document.getElementById("nameErr");
		
		nameErr.style.display = "none";
		
		if (uName.value == "")
		{
			nameErr.style.display = "inline";
			return false;
		}
		
		//return false;
		return true;
	}

</script>

</head>
<body>

<div>
	<h1>데이터베이스 연결 및 데이터 처리</h1>
	<hr>
</div>

<div>
	<!-- 데이터 입력 -->
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameErr">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>
			<tr>
				<th></th>
				<td>
					<button type="submit" id="btnAdd" class="btn control">데이터 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<div>
	<!-- 처리 결과 -->
	<!-- 	
	<table class="table">
		<tr>
			<th id="numTitle">번호</th>
			<th id="nameTitle">이름</th>
			<th id="telTitle">전화번호</th>
		</tr>
		<tr>
			<td class="contentTd">5</td>
			<td class="contentTd">박나영</td>
			<td class="contentTd">010-5555-5555</td>
		</tr>
		<tr>
			<td class="contentTd">6</td>
			<td class="contentTd">정현욱</td>
			<td class="contentTd">010-6666-6666</td>
		</tr>
	</table> 
	-->
	<%=str %>
</div>

</body>
</html>