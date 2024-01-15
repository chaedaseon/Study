<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(TableOk.jsp)로부터 전송된 데이터 수신
	// → su1, su2
	
	String str1 = request.getParameter("su1");	
	String str2 = request.getParameter("su2");
	
	int su1 = 0;
	int su2 = 0;
	
	// 테이블 안에서 1씩 증가시켜 나갈 변수 선언 및 초기화
	int num = 1;
	
	try
	{
		// 수신된 데이터 형 변환 (문자열 → 정수)
		su1 = Integer.parseInt(str1);
		su2 = Integer.parseInt(str2);
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TableOk.jsp</title>
</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 05</h1>
	<hr>
	<p>Table.jsp → TableOk.jsp</p>
</div>

<div>
	<h2>테이블 생성 결과</h2>
	<table border="1" style="width: 300px; height: 300px; text-align: center; font-weight: bold;">
		<%
		for (int i=1; i<=su2; i++)		// 가로
		{
		%>
		<tr>
			<%
			for (int j=1; j<=su1; j++)	// 세로
			{
			%>
			<td style="font-size: 15pt;">
				<%=num++ %>
			</td>		
			<%
			}
			%>
		</tr>
		<%
		}
		%>
	</table>
</div>

</body>
</html>