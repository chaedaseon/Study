<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 자기 자신 페이지(SendAndReceive07_1.jsp)로부터 넘어온 데이터 수신
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
	
	// 테스트
	//out.print("<h1>selectYear : " + selectYear + "</h1>");
	//out.print("<h1>selectMonth : " + selectMonth + "</h1>");
	
	// 확인한 날짜로 년도 select option 구성
	// <option value="2013">2013</option>
	// <option value="2014">2014</option>
	// <option value="2015">2015</option>
	//				  :
	// <option value="2023" selected="selected">2023</option>
	//				  :
	// <option value="2031">2031</option>
	// <option value="2032">2032</option>
	// <option value="2033">2033</option>
	
	String yOptions = "";
	for (int year=(selectYear-10); year<=(selectYear+10); year++)	// 2013 ~ 2033
	{
		// 관찰1.
		// "<option value=" + 2013 + ">" + 2013 + "</option>"
		// "<option value='2013'>2013</option>"
		//yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 관찰2.
		//if (year==nowYear)
		//	yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		//else
		//	yOptions += "<option value='" + year + "'>" + year + "</option>";
		
		// 상황1. 페이지 최초 요청일 때 	 → sYear는 null      / 현재 년도와 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청이 아닐 때 → sYear는 null 아님 / 선택 년도와 옵션이 같을 때 → selected(○)
		// 상황3. 나머지					 												   → selected(Ⅹ)
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
		// 관찰1.
		//mOptions += "<option value= '" + month + "'>" + month + "</option>";
		
		// 관찰2.
		//if (month==nowMonth)
		//	mOptions += "<option value= '" + month + "'selected='selected'>" + month + "</option>";
		//else
		//	mOptions += "<option value= '" + month + "'>" + month + "</option>";
		
		// 상황1. 페이지 최초 요청일 때    → sMonth는 null      / 현재 월과 옵션이 같을 때 → selected(○)
		// 상황2. 페이지 최초 요청 아닐 때 → sMonth는 null 아님 / 선택 월과 옵션이 같을 때 → selected(○)
		// 상황3. 나머지					 											    → selected(Ⅹ)
		if (sMonth==null && month==nowMonth)
			mOptions += "<option value= '" + month + "'selected='selected'>" + month + "</option>";
		else if (sMonth!=null && month==Integer.parseInt(sMonth))
			mOptions += "<option value= '" + month + "'selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value= '" + month + "'>" + month + "</option>";		
	}
	
	
	// 그려야 할 달력의 1일이 무슨 요일인지 확인 필요
	// (만년 달력)
	
	
	// 각 달의 마지막 날짜 배열 구성
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	// 윤년인지 평년인지 확인
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일 항목 배열 구성
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	// 현재 년도 → 입력 받은 년도 이전 년도까지의 날 수 계산
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	// 현재 월 → 입력받은 월의 이전 월까지의 날 수 추가
	for (int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	
	nalsu++;		// + 1
	
	int week = nalsu%7;						//-- 요일 변수
	int lastDay = months[selectMonth-1];	//-- 마지막 날짜 변수
	
	// 달력 그리기------------------------------------------------------------
	String calStr = "";	
	calStr += "<table border='1'>";				//-- start table
	
	// 요일 이름 발생
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if(i==0)								//-- 일요일
			calStr += "<th style='color:red;'>" + weekNames[i] + "</th>";
		else if (i==6)							//-- 토요일
			calStr += "<th style='color:blue;'>" + weekNames[i] + "</th>";
		else									// 평일
			calStr += "<th style='color:black;'>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";
		
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		week++;		//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다)
					//   요일도 함께 1씩 증가할 수 있도록 처리
		
		//calStr += "<td>" + i + "</td>";
		
		if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==0)
		{
			// 토요일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		}
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay && week%7==1)
		{
			// 일요일인 오늘
			calStr += "<td class='nowSun'>" + i + "</td>";
		}
		else if (selectYear==nowYear && selectMonth==nowMonth && i==nowDay)
		{
			// 평일인 오늘
			calStr += "<td class='nowSat'>" + i + "</td>";
		}
		else if (week%7==0)
		{
			// 오늘이 아닌 토요일
			calStr += "<td class='Sat'>" + i + "</td>";
			
		}
		else if (week%7==1)
		{
			// 오늘이 아닌 일요일
			calStr += "<td class='Sun'>" + i + "</td>";
		}
		else
		{
			// 오늘이 아닌 평일
			calStr += "<td>" + i + "</td>";
		}
		
		if (week%7==0)
			calStr += "</tr><tr>";
	}
	
	// 빈 칸 공백 td 발생
	for (int i=0; i<week; i++, week++)
	{
		if (week%7==0)
			break;
			
		calStr += "<td></td>";
	}
	
	if (week%7!=0)
		calStr += "</tr>";
		
	calStr += "</table>";						//-- end table
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07_1.jsp</title>

<style type="text/css">
	table {text-align: right; font-weight: bold;}
	td.Sat {color: blue;}
	td.Sun {color: red;}
	td.now {background-color: #beffff; font-weight: bold;}					/* 평일인 오늘 */
	td.nowSat {background-color: #beffff; font-weight: bold; color: blue;} /* 토요일인 오늘 */
	td.nowSun {background-color: #beffff; font-weight: bold; color: red;}  /* 일요일인 오늘 */
</style>

<script type="text/javascript">

	function formCalendar(obj)
	{
		// 유효성 검사가 필요할 경우 삽입할 수 있는 영역~!!!
		
		// ...
		
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
		<div>
		<select name="year" id="year" class="s" onchange="formCalendar(this.form)">
			<%=yOptions %>
		</select> 년
		
		<select name="month" id="month" onchange="formCalendar(this.form)">
			<%=mOptions %>
		</select> 월
		</div>
		<br><br>
		<%=calStr %>
	</form>
</div>

</body>
</html>