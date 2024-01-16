<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MyData"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// Test6.jsp
	//-- 사용자 정의 데이터타입을 취하는 자료구조 생성
	
	List<MyData> lists = new ArrayList<MyData>();

	MyData ob = new MyData("길현욱", 15);
	lists.add(ob);
	
	ob = new MyData("최혜인", 23);
	lists.add(ob);
	
	ob = new MyData("정한울", 24);
	lists.add(ob);
	
	ob = new MyData("문정환", 16);
	lists.add(ob);
	
	ob = new MyData("이윤수", 8);
	lists.add(ob);
	
	ob = new MyData("임하성", 17);
	lists.add(ob);
	
	request.setAttribute("lists", lists);
		
%>

<jsp:forward page="Test6_result.jsp"></jsp:forward>

