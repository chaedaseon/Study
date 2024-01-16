<%@page import="java.sql.Statement"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// ScoreInsert.jsp
	
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");
	
	// 이전 페이지로부터 넘어온 데이터 수신
	String uName = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	// 데이터베이스 연결
	Connection conn = DBConn.getConnection();
	
	// 쿼리문 준비(insert)
	String sql = String.format("INSERT INTO TBL_SCORE(SID, NAME, KOR, ENG, MAT) VALUES(SCORESEQ.NEXTVAL, '%s', %d, %d, %d)", uName, kor, eng, mat);
	
	// 작업 객체 생성 및 쿼리문 실행
	Statement stmt = conn.createStatement();
	int result = 0;
	result = stmt.executeUpdate(sql);
	
	stmt.close();
	DBConn.close();
	
	// 요청 페이지 안내
	if (result < 1)
		response.sendRedirect("ERR.jsp");
	else
		response.sendRedirect("ScoreList.jsp");
	
%>
