<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	MemberDAO dao = null;
	
	String memberCount = "<span id='memberCount'>전체 인원 수 : "; //5명</span>"
	
	try
	{
		dao = new MemberDAO();
		
		memberCount += dao.count() + "명</span>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>전화번호</th></tr>");
		
		// MemberDAO 의 lists() 메소드 호출
		//-- 반복문을 통해 <table> 하위 엘리먼트 생성
		for (MemberDTO member : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + member.getSid() + "</td>");
			str.append("<td class='record'>" + member.getName() + "</td>");
			str.append("<td class='record'>" + member.getTel() + "</td>");
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
			// 데이터베이스 연결 종료
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
<title>MemberList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<style type="text/css">
	.record {text-align: center;}
	th, input {width:200px; border-radius: 6px;}
	button {width: 320px; height: 40px; font-size: 13pt; font-weight: bold;}
	.errMsg {font-size: small; color:red; display: none;}
</style>

<script type="text/javascript">

	function formCheck()
	{
		// 확인
		//alert("함수 호출");
		
		var userName = document.getElementById("userName");
		var nameMsg = document.getElementById("nameMsg");
		
		nameMsg.style.display = "none";
		
		if (userName.value == "")
		{
			nameMsg.style.display = "inline";
			userName.focus();
			return false;
		}
		
		//return false;
		return true;
	}
	
</script>

</head>
<body>

<div>
	<h1>데이터베이스 연동 회원관리 실습</h1>	
	<hr>
</div>

<div>
	<p>DAO, DTO 개념 적용</p>
	<form action="MemberInsert.jsp" method="post" onsubmit="return formCheck();">
		<table class="table">
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName" class="txt">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>
					<input type="text" id="userTel" name="userTel" class="txt">
				</td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2">
					<button type="submit" class="btn" id="btnAdd">회원 추가</button>
				</td>
			</tr>
		</table>
	</form>
</div>
<br><br>

<!-- 
<div>
	<span id="memberCount">전체 인원 수 : 5명</span>
	<table class="table">
		<tr>
			<th>번호</th><th>이름</th><th>전화번호</th>
		</tr>
		<tr>
			<td class="record">1</td>
			<td class="record">고길동</td>
			<td class="record">010-1111-1111</td>
		</tr>
		<tr>
			<td class="record">2</td>
			<td class="record">둘리</td>
			<td class="record">010-2222-2222</td>
		</tr>
		<tr>
			<td class="record">3</td>
			<td class="record">도우너</td>
			<td class="record">010-3333-3333</td>
		</tr>
		<tr>
			<td class="record">4</td>
			<td class="record">희동이</td>
			<td class="record">010-4444-4444</td>
		</tr>
		<tr>
			<td class="record">5</td>
			<td class="record">또치</td>
			<td class="record">010-5555-5555</td>
		</tr>
	</table>
</div>
 -->
 
 <div>
 	<!-- 전체 인원수 확인 -->
	<%=memberCount %>
	
	<!-- 번호 이름 전화번호 항목에 대한 리스트 구성 -->
	<%=str.toString() %>	 	
 </div>
 
</body>
</html>