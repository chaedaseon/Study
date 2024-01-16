<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect11.jsp
	
	// 이전 페이지(Send11.jsp)로부터 넘어온 데이터 수신
	// → num1, calResult, num2
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	String op = request.getParameter("calResult");
	
	// 연산 처리
	String str = "";
	if (op.equals("1"))			//-- 더하기
		str += String.format("%d", (num1+num2));
	else if (op.equals("2"))	//-- 빼기
		str += String.format("%d", (num1-num2));
	else if (op.equals("3"))	//-- 곱하기
		str += String.format("%d", (num1*num2));
	else if (op.equals("4"))	//-- 나누기
		str += String.format("%.1f", (num1/(double)num2));
	
	// check~!!!
	// 사용자에게 요청할 페이지를 안내
	//response.sendRedirect("Receive11.jsp");
	
	// check~!!!
	// 결과 데이터 재전송 → sendRedirect() 메소드 사용
	// ※ redirect 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//	  : 지정된 URL(location)로 요청을 재전송한다.
	//    즉, 사용자가 다시 해당 요청을 수행할 수 있도록 안내한다.
	response.sendRedirect("Receive11.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
	//-- 클라이언트에게 Receive11.jsp 페이지를 다시 요청할 수 있도록 안내~!!!
	//   이에 더하여... get 방식의 요청 URL 구성을 통해 넘길 데이터 처리~!!!
	
%>