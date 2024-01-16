<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// MemberDelete.jsp
	
	// 이전 페이지(MemberSelect.jsp)로부터 넘어온 데이터 수신
	// → sid
	
	String sid = request.getParameter("sid");

	MemberDAO dao = new MemberDAO();
	
	String strAddr = "";
	
	try
	{
		dao.connection();
		
		// 참조 레코드 수 확인
		int checkCount = dao.refCount(sid);
		//-- TBL_MEMBER 테이블에서 제거하고자 하는 데이터의
		//   SID 를 참조하는 TBL_MEMBERSCORE 테이블 내의 데이터 갯수 확인
		//   (현재는 0 or 1)
		
		if (checkCount==0)		//-- 제거 가능
		{
			dao.remove(sid);
			strAddr = "MemberSelect.jsp";
		}
		else					//-- 제거 붉
		{
			//dao.remove(sid);
			strAddr = "Notice.jsp";
			//-- TBL_MEMBERSCORE 테이블의 데이터가
			//   TBL_MEMBER 테이블의 SID 를 참조하고 있는 경우로
			//   삭제가 불가능한 상황
			//-- 제거하지 못하는 사유를 안내하는 페이지로 이동
			//   + 리스트로 돌아가기 기능 추가
		}
		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try
		{
			dao.close();
		}
		catch (Exception e)
		{
			System.out.println(e.toString());
		}		
	}
	
	// check~!!!
	// 사용자가 다시 요청해야 할 페이지 안내
	response.sendRedirect(strAddr);
	
	
// 나머지 보여주는 코드들 모두 제거	
%>
