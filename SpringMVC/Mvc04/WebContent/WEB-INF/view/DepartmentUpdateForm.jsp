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
<title>DepartmentUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#submitBtn").click(function()
		{
			//alert("확인");
			if ($("#name").val()=="")
			{
				$("#err").html("부서이름을 입력해 주세요").css("display", "inline");
				$("#name").focus();				
			}
			
			$("#departmentForm").submit();
			
		});
		
	});

</script>
</head>
<body>

<!--------------------------------------
	#53. DepartmentUpdateForm.jsp
		- 부서 데이터 수정 페이지
		- 관리자만 접근 허용
--------------------------------------->

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
	
		<h1>[ 부서 정보 변경 ]</h1>
		<hr>
		
		<form action="departmentupdate.action" method="post" id="departmentForm">
			<table>
				<tr>
					<th>번호</th>
					<td>
						<input type="text" id="id" name="id" value="${department.departmentId }" readonly="readonly">
					</td>
				</tr>				
				<tr>
					<th>이름</th>
					<td>
						<input type="text" id="name" name="name" value="${department.departmentName }">
					</td>
				</tr>				
				<tr>
					<td colspan="2" align="center">
						<br><br>
						
						<button type="button" class="btn" id="submitBtn"
						style="width: 40%; height: 50%;">부서 정보 변경</button>
						<button type="button" class="btn" id="listBtn"
						style="width: 40%; height: 50%;"
						onclick="location.href='departmentlist.action'">부서 리스트</button>
						<br><br>
						
						<span id="err" style="color: red; font-weight: bold; display: none;">							
						</span>
						
					</td>
				</tr>				
			</table>
		</form>
	
	</div>

<!-- 회사 소개 및 어플리케이션 소개 영역 -->
<div id="footer">
</div>


</div>

</body>
</html>