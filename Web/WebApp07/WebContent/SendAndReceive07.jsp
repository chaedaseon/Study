<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	//자기 자신 페이지(SendAndReceive07_1.jsp)로부터 넘어온 데이터 수신
	// → year, month
	String sYear = request.getParameter("year");
	String sMonth = request.getParameter("month");
	
	// 달력(Calendar) 객체 생성
	//java.util.Calendar cal = java.util.Calendar.getInstance();
	Calendar cal = Calendar.getInstance();

	// 현재 년, 월, 일 확인
	int nowYear = cal.get(Calendar.YEAR);			//-- 2023
	int nowMonth = cal.get(Calendar.MONTH)+1;		//-- 12
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//-- 11		
	
	// 표시할 달력의 년, 월 구성 → 페이지 최초 요청을 감안한 코드
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	// 페이지에 대한 요청이 최초 요청이 아닐 경우
	// → Line 6 ~ 7 을 통해 수신한 데이터로 표시할 달력의 년, 월 구성
	if (sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}	
	
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)	// 2013 ~ 2033
	{					 											
		if (sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		else if (sYear!=null && year==Integer.parseInt(sYear))
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
	}
	
	// 확인한 날짜로 월 select option 구성
	// <option value="1">1</option>
	// <option value="2">2</option>
	// <option value="3">3</option>
	//				 :
	// <option value="12" selected="selected">12</option>
	
	String mOptions = "";
	for (int month=1; month<=12; month++)							// 1 ~ 12
	{					 											    
		if (sMonth==null && month==nowMonth)
			mOptions += "<option value= '" + month + "'selected='selected'>" + month + "</option>";
		else if (sMonth!=null && month==Integer.parseInt(sMonth))
			mOptions += "<option value= '" + month + "'selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value= '" + month + "'>" + month + "</option>";		
	}
	
	cal.set(selectYear, selectMonth-1, 1);
	int w = cal.get(Calendar.DAY_OF_WEEK);
	
	String result = "";	
	result += "<table border='1'>";				//-- start table
	
	// 요일 이름 발생
	result += "<tr>";
	result += "<th>일</th>";
	result += "<th>월</th>";
	result += "<th>화</th>";
	result += "<th>수</th>";
	result += "<th>목</th>";
	result += "<th>금</th>";
	result += "<th>토</th>";
	result += "</tr>";
	result += "<tr>";
	for (int i=1; i<w; i++)
	{
		result += "<td>" + " " + "</td>";
	}
	for (int i=1; i<=cal.getActualMaximum(cal.DATE); i++)
	{
		result += "<td>" + i + "</td>";
		w++;
		
		if (w%7==1)
		{
			result += "</tr><tr>";
		}
	}

	result += "</tr>";
	result += "</table>";						//-- end table
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>

<style type="text/css">
	table {text-align: center; font-weight: bold;}
	td {width: 40px; height: 40px;}
	th {background-color: #ffe1e1;}
	* {margin: auto; font-weight: bold; text-align: center;}
	h1 {text-align: left;}
</style>

<script type="text/javascript">

	function formChange(obj)
	{
		obj.submit();
	}

</script>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--
	○ 데이터 송수신 실습 07
	   
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 페이지 레이아웃은 연도와 월을 입력받아
	     화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 할 수 있도록 한다.
	   - 전송한 내용을 스스로 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 연도 선택 기본 구성은 현재의 연도를 기준으로
	     이전 10년, 이후 10년 으로 구성한다.
	     (기본적으로 만년달력 형태로 구성하는데
	      현재의 연, 월은 달력 객체로부터 확인할 수 있도록 한다.)
	   - 월 선택 기본 구성은 1월 부터 12월 까지로 구성한다.
	   
	       2013
	        :
	     [ 2023 ▼ ] 년 [ 12 ▼ ] 월
	        :
	       2033
	       
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     ---------------------------
	     
	   - 연도 select 나 월 select 의 내용이 변화되면
	     해당 연 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소는
	     http:// localhost:3306/WebApp07/SendAndReceive07.jsp 로 한다.
	  
	 ○ SendAndReceive07.jsp
	 
-->

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<form action="" method="get">
	<!-- <form action="" method="post"> -->
		<br><br>
		<div>
		<select name="year" id="year" class="s" onchange="formChange(this.form)">
			<%=yOptions %>
		</select> 년
		
		<select name="month" id="month" onchange="formChange(this.form)">
			<%=mOptions %>
		</select> 월
		</div>
		<br><br>
		<%=result %>
	</form>
</div>

</body>
</html>