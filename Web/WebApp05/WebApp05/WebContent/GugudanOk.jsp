<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Gugudan.jsp)로부터 데이터 수신 → dan
	String str = request.getParameter("dan");			// 사용자가 입력한 값을 수신, 문자열로 담은 변수
	String result = "";									// 결과를 담을 변수
	int n = 0;
	
	if (Integer.parseInt(str) < 0)
	{
		result = "0보다 큰 수를 입력해야 합니다.<br> >> 이전 페이지로 돌아가주세요.";
		str = "*";
	}
	else
	{
		try
		{
			n = Integer.parseInt(str);			// 문자열로 담은 변수를 정수형으로 변환
			
			int i = 1;
			int s = 0;								// 구구단의 결과를 담을 변수		
			
			for (i=1; i<10; i++)
			{
				s = n * i;
				result += String.format("%d * %d = %d<br>", n, i, s);
			}		
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GugudanOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 02</h1>
	<hr>
	<p>Gugudan.jsp → GugudanOk.jsp</p>
</div>

<!-- html 주석문 -->
<!-- 브라우저 영역에서 보여지지 않는 주석문 -->

<%-- jsp 주석문 --%>
<%-- 서블릿 컨테이너에게 보여지지 않는 주석문 --%>

<div>
	<h2 style="background-color: grey; color: white; width: 130px; text-align: center;"><%=str %>단</h2>
	<h2><%=result %></h2>
</div>
	
<%--
	for (int i=1; i<=9; i++)
		out.print(n + " * " + i + " = " + (n*i) + "<br>");
--%>

<%-- 	
	  <%for (int i=1; i<=9; i++)
	  {%>
			<%=n %> * <%=i %> = <%=(n*i) %><br>
	<%}%> 
--%>


</body>
</html>