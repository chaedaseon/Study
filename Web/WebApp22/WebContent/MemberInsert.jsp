<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// MemberInsert.jsp
	
	// 5명 분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	// 						 MemberDTO
	
	// → MemberList.jsp 에서 출력
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

	// 내가 한 풀이
	/*
	for (int i=1; i<=5; i++) 
	{
		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"+i));
		dto.setTel(request.getParameter("tel"+i));
		dto.setAddr(request.getParameter("addr"+i));
		
		lists.add(dto);
	}
	*/
	
	// 같이 한 풀이
	for (int i=1; i<=5; i++)	// i → 1 2 3 4 5 
	{
		MemberDTO ob = new MemberDTO(request.getParameter("name"+i)
			                        , request.getParameter("tel"+i)
		                            , request.getParameter("addr"+i));
		
		lists.add(ob);
	}

	request.setAttribute("lists", lists);
	
	// ① RequestDispatcher 사용
	
%>
<!-- ② jsp 액션태그 사용 -->
<jsp:forward page="MemberList.jsp"></jsp:forward>

