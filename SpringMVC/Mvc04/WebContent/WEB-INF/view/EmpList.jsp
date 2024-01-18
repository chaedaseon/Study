<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<!-----------------------------------------------------------
	#37. EmpList.jsp
		- 직원 리스트 출력 페이지
		- 일반 직원이 접근하는 직원 데이터 출력 페이지
	      (관리자가 접근하는 직원 데이터 출력 페이지는
	       EmployeeList.jsp 로 구성)
	    - 제한된 항목
	    - 입력 / 수정 / 삭제 기능 없음
------------------------------------------------------------>

<div>
	<!-- 메뉴 영역 -->
	<div>
		<c:import url="EmployeeMenu.jsp"></c:import>
	</div>
	
	<!-- 콘텐츠 영역 -->
	<div id="content">
	
		<h1>[ 직원 정보 목록 (일반직원 전용) ]</h1>
		<hr>
		
		<!-- 직원 추가 div 제거~!!! -->
		<br><br>
		
		<table id="customers" class="table">
			 
			<tr>
				<!-- 항목 6 EA -->
				<th>번호</th>
				<th>이름</th>
				<th>지역</th>
				<th>부서</th>
				<th>직위</th>
				<th>등급</th>
			</tr>
			<!--
			<tr>
				<td>1</td>
				<td>고길동</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>관리자</td>
			</tr>
			
			<tr>
				<td>2</td>
				<td>도우너</td>
				<td>서울</td>
				<td>개발부</td>
				<td>사원</td>
				<td>일반사원</td>
			</tr>
			-->
			
			<c:forEach var="employee" items="${employeeList }">
				<tr>
					<td>${employee.employeeId} </td>
					<td>${employee.name} </td>
					<td>${employee.regionName} </td>
					<td>${employee.departmentName} </td>
					<td>${employee.positionName} </td>
										
					<%-- <td>${employee.grade} </td> --%>
					<td>${employee.grade==0 ? "관리자" : "일반사원"} </td>
				</tr>
			</c:forEach>
			
		</table>		
	</div>
	
	<!-- 회사 소개 및 어플리케이션 소개 영역 -->
	<div id="footer">
	</div>

</div>



</body>
</html>