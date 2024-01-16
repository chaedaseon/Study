<%@page import="com.test.MemberScoreDTO"%>
<%@page import="com.test.MemberScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberScoreUpdate.jsp
	
	// 이전 페이지(MemberScoreUpdateForm.jsp)로부터 넘어온 데이터 수신
	// → kor, eng, mat + sid
	
	String sid = request.getParameter("sid");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	
	// MemberScoreDAO 인스턴스 생성
	MemberScoreDAO dao = new MemberScoreDAO();
	
	try
	{
		// 데이터베이스 연결
		dao.connection();
		
		MemberScoreDTO score = new MemberScoreDTO();
		
		score.setSid(sid);
		score.setKor(Integer.parseInt(kor));
		score.setEng(Integer.parseInt(eng));
		score.setMat(Integer.parseInt(mat));				
		
		// dao 의 modify() 메소드 호출 → 데이터 수정(update 쿼리문 수행)
		// → MemberScoreDTO 매개변수 필요
		dao.modify(score);
		
		// 위 메소드 호출 결과 반환값을 활용한 분기 처리 가능~!!!
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			// 데이터베이스 연결 종료
			dao.close();
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}		
	}
			
	response.sendRedirect("MemberScoreSelect.jsp");
%>
