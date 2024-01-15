<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"
%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// check~!!!
	response.setContentType("text/xml");
	//-- AJAX 객체에 데이터를 반환할 때
	//   브라우저가 이 데이터를 XML 로 인식해야 하기 때문에
	//   MINE 타입을 XML 로 선언한다.
	
	// ※ (수신해서 처리해야 하는) 데이터가 한 개 이상일 경우...
	//    XML 이나 JSON 과 같이 구조화시킬 수 있는 데이터의 형태로
	//    전달하는 것이 처리 과정에서 용이하다.
	//    우편번호에 대한 검색 결과는
	//    당연히 다량의 데이터를 전송해야 하기 때문에
	//    일반 텍스트가 아닌 XML 형태로 반환하려고 하는 것이다.
	
%><?xml version="1.0" encoding="UTF-8"?>
<list>
	<c:forEach var="item" items="${lists }">
		<item>
			<zipcode>${item.zipCode }</zipcode>
			<address>${item.address }</address>
		</item>
	</c:forEach>
</list>







