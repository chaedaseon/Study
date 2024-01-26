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
<title>StudentList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<style type="text/css">
	* {text-align: center;}
	.btnStr
	{
		width: 200px;
		font-weight: bold;
		font-size: 13pt;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$(".btnCancel").click(function()
		{
			//alert("확인");
			
			if (confirm("선택하신 정보를 정말 삭제하시겠습니까?"))
			{
				$(location).attr("href", "studentdelete.action?sid=" + $(this).val());
			}
			
		});
	});

</script>
</head>
<body>

<div>
	<h1>👩🏻학생 정보 관리🧑🏻</h1>
	<hr>
</div>

<div>
	<button type="submit" class="btnStr" onclick="location.href='studentinsertform.action'">학생 정보 입력</button>
	<button type="submit" class="btnStr" onclick="location.href='gradelist.action'">성적 정보 관리</button>
</div>
<br>

<div>
	<table class="table" style="text-align: center;">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>성적입력여부</th>
			<th>성적입력</th>
			<th>수정 / 삭제</th>
		</tr>
		<!-- 
		<tr>		
			<td>1</td>
			<td>채다선</td>
			<td>010-1111-1111</td>			
		</tr>
		 -->
		<c:forEach var="student" items="${list }">
			<tr>
				<td>${student.sid }</td>
				<td>${student.name }</td>
				<td>${student.tel }</td>				
				<td>${student.sub==1 ? "Y" : "N" }</td>
				<td>
					<c:choose>
					<c:when test="${student.sub==1 }">
						<button type="button" disabled="disabled">성적입력</button>						
					</c:when>
					<c:otherwise>
						<button type="button" class="btn" onclick="location.href='gradeinsertform.action?sid=${student.sid }&name=${student.name}'">성적입력</button>
					</c:otherwise>
					</c:choose>
				</td>
				<td>
					<button type="button" class="btn" onclick="location.href='studentupdateform.action?sid=${student.sid}'">수정</button>
					<c:choose>
						<c:when test="${student.sub==1 }">
							<button type="button" disabled="disabled">삭제</button>
						</c:when>
						<c:otherwise>
							<button type="button" class="btn btnCancel" value="${student.sid }">삭제</button>
						</c:otherwise>	
					</c:choose>		
				</td>
			</tr>	
		</c:forEach>
	</table>
	<br>
	<button type="button" class="btn"><span>💡</span>전체 학생 수 : <span>${count }</span>명</button>
</div>


</body>
</html>