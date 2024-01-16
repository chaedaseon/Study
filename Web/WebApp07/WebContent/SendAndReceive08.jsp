<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	Calendar cal = Calendar.getInstance();

	String selectYear = request.getParameter("year");
	String selectMonth = request.getParameter("month");
	
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int year=nowYear;
	int month=nowMonth;
	
	if (selectYear!=null || selectMonth!=null)
	{
		year = Integer.parseInt(selectYear);
		month = Integer.parseInt(selectMonth);
	}
	
	
	int[] months =  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	if (year%4==0 && year%100!=0 || year%400==0)
		months[1] = 29;
	
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	int su = (year-1)*365 + (year-1)/4 - (year-1)/100 + (year-1)/400;
	
	for (int i=0; i<month-1; i++)
		su += months[i];
	
	su++;
	
	int week = su%7;
	int lastDay = months[month-1];
	
	String result = "";
	result += "<table border='1'>";
	result += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		result += "<th>" + weekNames[i] + "</th>";
	}
	result += "</tr><tr>";
	for (int i=0; i<week; i++)
	{
		result += "<td></td>";
	}
	for (int i=1; i<=lastDay; i++)
	{
		week++;
		result += "<td>" + i + "</td>";
		
		if (week%7==0)
		{
			result += "</tr><tr>";
		}
	}
	for (int i=0; i<week; i++, week++)
	{
		if (week%7==0)
			break;
		
		result += "<td></td>";
	}
	
	if (week%7!=0)
		result += "</tr>";
	result += "</table>";
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive08.jsp</title>

<style type="text/css">
	input {width: 60px; text-align: center;}
	a {text-decoration: none;}
</style>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--
	○ 데이터 송수신 실습 08
	
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 단독 페이지로 구성한다.
	   - submit 버튼 없이 이벤트 처리를 한다.
	   
	   ◀ 2023년 12월 ▶
	   
	   -------------------------
	   -------------------------
	   -------------------------
	   -------------------------
	   -------------------------
	   
	   
	   - 『◀』 이나 『▶』 클릭 시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구현한다.
	     
	   - 사용자 최초 요청 주소는
	     http:// localhost:3306/WebApp07/SendAndReceive08.jsp 로 한다.
	  
	 ○ SendAndReceive08.jsp 
-->

<div>
	<h1>데이터 송수신 실습 08</h1>
	<hr>
</div>

<div>
	<form action="" method="get">
		<a href="SendAndReceive08.jsp?year=<%=month==1? year-1:year %>&month=<%=month==1? 12: month-1 %>" id="btn1">◀</a>
		<%=year%> 년
		<%=month%> 월
		<a href="SendAndReceive08.jsp?year=<%=month==12? year+1:year %>&month=<%=month==12? 1: month+1 %>" id="btn2">▶</a>
		<br><br>
		<%=result %>
	</form>
</div>

</body>
</html>