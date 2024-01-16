<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send05.html)로부터 넘어온 데이터 수신
	// → dan
	String str = request.getParameter("dan");
	int num = 0;
	String result = "";
	int i = 0;

	try
	{
		num = Integer.parseInt(str);
		
		for (i=1; i<=9; i++)
		{
			result += num + " * " + i + " = " + (num*i) + "<br>";
		}
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2><%=num %> 단</h2>
	<%=result %>
</div>

</body>
</html>