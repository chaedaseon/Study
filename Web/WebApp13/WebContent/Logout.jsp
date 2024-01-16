<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Logout.jsp
	//-- 세션의 내용을 없애 로그아웃 처리
	//   이후... 클라이언트가 다시 요청할 페이지 안내
	
	// 기존 세션에 저장되어 있는 일부 항목을 제거하고 세션을 초기화
	session.removeAttribute("userId");
	session.removeAttribute("userName");
	//-- 세션의 사용자아이디와 이름 삭제
	
	// 기존 세션에 저장되어 있는 모든 항목을 제거하고 세션을 초기화
	session.invalidate();
	
	// 클라이언트에게 다시 로그인 페이지를 요청할 수 있도록 안내
	response.sendRedirect("TestSession01.jsp");
	
%>