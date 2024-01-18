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
<title>RegList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!-----------------------------------------------------------
	#66. RegList.jsp
		- 지역 리스트 출력 페이지
		- 일반 직원이 접근하는 지역 데이터 출력 페이지
	      (관리자가 접근하는 지역 데이터 출력 페이지는
	       RegionList.jsp 로 구성)
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
	
		<h1>[ 지역 정보 목록 (일반직원 전용) ]</h1>
		<hr>
		
		<br><br>
		
		<table id="customers" class="table">
			 
			<tr>
				<th>지역번호</th>
				<th>지역이름</th>
				<th>총 인원</th>
			</tr>
			
			<c:forEach var="region" items="${regionList }">
				<tr>
					<td>${region.regionId} </td>
					<td>${region.regionName} </td>
					<td>${region.delCheck}명 </td>
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