<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// Delete_ok.jsp
	
	// 이전 페이지(Article.jsp)로부터 넘어온 데이터 수신
	// → num, pageNum
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);	
	
	int result = dao.deleteDate(num);
	
	// result 결과값에 따른 분기처리 코드 삽입 가능~!!!
	
	DBConn.close();
	
	// 사용자에게 리스트 페이지를 다시 요청할 수 있도록 안내
	response.sendRedirect(cp + "/List.jsp?pageNum=" + pageNum);

// 아래 보여주는 코드 모두 제거
%>

