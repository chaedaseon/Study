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
<title>GradeList.jsp</title>
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
				$(location).attr("href", "gradedelete.action?sid=" + $(this).val());
			}
			
		});
	});

</script>
</head>
<body>

<div>
	<h1>📚성적 정보 관리📚</h1>
	<hr>
</div>

<div>
	<button type="submit" class="btnStr" onclick="location.href='studentlist.action'">학생 정보 관리</button>
</div>
<br>

<div>
	<form action="gradeinsertform.action" method="post">
		<table class="table" style="text-align: center;">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>과목1</th>
				<th>과목2</th>
				<th>과목3</th>
				<th>총점</th>
				<th>평균</th>
				<th>등급</th>
				<th>입력 / 수정 / 삭제</th>				
			</tr>
			<!-- 
			<tr>
				<td>5</td>
				<td>채다선</td>
				<td>90</td>
				<td>90</td>
				<td>90</td>
				<td>90</td>
				<td>90</td>
				<td>합격</td>			
			</tr>
			 -->
			<c:forEach var="grade" items="${list }">
				<tr>
					<td>${grade.sid }</td>
					<td>${grade.name }</td>
					<td>${grade.sub1==-1 ? "" : grade.sub1 }</td>				
					<td>${grade.sub2==-1 ? "" : grade.sub2 }</td>				
					<td>${grade.sub3==-1 ? "" : grade.sub3 }</td>				
					<td>${grade.tot==-1 ? "" : grade.tot }</td>				
					<td>${grade.avg==-1 ? "" : grade.avg }</td>				
					<td>${grade.tot==-1 ? "판정불가" : grade.ch }</td>
					<c:choose>	
					<c:when test="${grade.tot==-1 }">
					<td>
						<button type="button" class="btn" onclick="location.href='gradeinsertform.action?sid=${grade.sid }&name=${grade.name}'">성적입력</button>
					</td>
					</c:when>
					<c:otherwise>
					<td>
						<button type="button" class="btn" onclick="location.href='gradeupdateform.action?sid=${grade.sid}&name=${grade.name }'">수정</button>
						<button type="button" class="btn btnCancel" value="${grade.sid }">삭제</button>
					</td>
					</c:otherwise>
					</c:choose>			
				</tr>			
			</c:forEach>	
		</table>
	</form>
</div>

</body>
</html>