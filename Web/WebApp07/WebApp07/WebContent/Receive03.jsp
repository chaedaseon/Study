<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send03.html)로부터 넘어온 데이터 수신
	// → su1, su2, select
	String str1 = request.getParameter("su1");
	String str2 = request.getParameter("su2");
	String res = request.getParameter("select");
	
	int n1 = 0;
	int n2 = 0;
	
	//int tot = 0;
	
	String result = "";
	
	try
	{
		n1 = Integer.parseInt(str1);
		n2 = Integer.parseInt(str2);
		
		switch (res)
		{
			case "+": 
				//tot = n1 + n2;
				result = String.valueOf(n1 + n2);
				break;
			case "-": 
				//tot = n1 - n2;
				result = String.valueOf(n1 - n2);
				break;
			case "*": 
				//tot = n1 * n2;
				result = String.valueOf(n1 * n2);
				break;
			case "/": 
				//tot = n1 / n2;
				//result = String.valueOf(n1 / n2);
				//└ 위의 두 구문처럼 하면 소수부가 안나옴!
				
				//result = String.valueOf(n1 / (double)n2);
				//└ 소수점 아래 .xxxxx 형태로 나옴!
				
				result = String.format("%.1f", n1 / (double)n2);
				break;
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
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {font-weight:  bold; font-size: 15pt; color: #ff7979;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div style="background-color: #fff1f0; width: 500px; border-radius: 10px; text-align: center;">
	<br>
	입력하신 <span><%=n1 %></span>와(과) <span><%=n2 %></span>의 연산 결과는 <span><%=result %></span> 입니다.<br>
	<br>
</div>

</body>
</html>