<%@page import="com.test.Calc"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(Calc.jsp)로부터 넘어온 데이터 수신
	// → su1, op, su2
	String strSu1 = request.getParameter("su1");
	String strSu2 = request.getParameter("su2");
	String op = request.getParameter("op");
	
	int su1, su2;
	su1 = su2 = 0;
	String str = "";
	
	if (strSu1.equals("") || strSu2.equals("") || strSu1==null || strSu2==null)
	{
		response.sendRedirect("Calc.jsp");
	}
	else
	{
		su1 = Integer.parseInt(strSu1);
		su2 = Integer.parseInt(strSu2);
		
		// 자바에서 우리가 설계한 클래스를 사용하기 위해... 객체 생성
		Calc ob = new Calc();
		//-- 이클립스 자동완성 기능을 사용하여 구문을 작성할 경우
		//   『@page import="com.test.Calc"』 이 구문도 함께 생성되어 처리됨.
		//   혹은, 자동완성 기능을 사용하지 않을 경우도
		//   『@page import="com.test.Calc"』 이와 같은 구문을 직접 작성해서
		//   해당 클래스를 사용할 수 있도록 처리해 주어야 함.
		//   또는, 생성 구문에 직접 『com.test.Calc ob = new com.test.Calc();』
		//   와 같이 작성하는 것도 가능함.
		
		ob.setSu1(su1);
		ob.setSu2(su2);
		ob.setOp(op);
		
		str = ob.result();		
	}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calc_ok1.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>첫 번째 방법 처리결과</h1>
	<hr>
</div>

<div>
	<!-- 결과 -->
	<h2><%=str %></h2>
</div>

</body>
</html>