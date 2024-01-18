<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			//alert("확인");			
			if ($("#id").val()=="" || $("#pw").val()=="")
			{
				$("#err").html("항목을 모두 입력해야 합니다.").css("display", "inline");
				return;
			}
			
			$("#loginForm").submit();
			
		});
		
	});

</script>
</head>
<body>

<!---------------------------------------------------- 		
	#33. LoginForm.jsp
		 - 관리자 및 일반사원 로그인 폼 페이지
		 - ID(employeeId), PW(ssn2) 입력 폼 구성. 
------------------------------------------------------>

<div>
	
	<div>
		<h1>로그인</h1>
		<hr>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
		
		<form action="login.action" method="post" id="loginForm">
			<table>
				<tr>
					<th>
						<label for="id">ID</label>
					</th>
					<td>
						<input type="text" id="id" name="id" placeholder="아이디" required="required">						
					</td>
				</tr>
				<tr>
					<th>
						<label for="pw">PW</label>
					</th>
					<td>
						<input type="password" id="pw" name="pw" placeholder="패스워드" required="required">
					</td>
				</tr>
				<tr>
					<th></th>
					<td>
						<input type="checkbox" id="admin" name="admin" value="0">
						<label for="admin">admin</label>
					</td>
				</tr>
				
				<tr style="height: 5px;">
					<!-- 공간을 두기 위해 비어있는 tr -->
				</tr>
				
				<tr>
					<th colspan="2">
						<input type="button" value="로그인" id="submitBtn" class="btn"
						style="width: 48%;">
						<input type="reset" value="취소" id="resetBtn" class="btn"
						style="width: 48%;">
						<br><br>
						
						<span id="err" style="color: red; display: none;"></span>
					</th>
				</tr>
			</table>
			
		</form>
		
	</div>



</div>


</body>
</html>