<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(RadioSelect.jsp)로부터 데이터 수신
	// → name, gender, major, hobby
	
	
	// 한글 깨짐 방지 처리
	// └ request 객체를 "UTF-8"로 세팅한 후 꺼내야 함~!!!
	request.setCharacterEncoding("UTF-8");					// check~!!!
	

	String name = request.getParameter("name");				//-- 텍스트박스... 단일값 수신
	String gender = request.getParameter("gender");			//-- 라디오버튼... 단일값 수신
		String major = request.getParameter("major");			//-- 선택상자... 단일값 수신	
	//String hobby = request.getParameter("hobby");			//-- 선택상자... 다중 데이터 수신
	String hobby[] = request.getParameterValues("hobby");	// == String[] hobby
	//-- 다중 선택이 가능한 선택상자일 경우...
	//   『getParameterValues()』로 데이터 수신
	//    → 배열 반환
	
	
	// name 수신 및 처리 → 특이사항 없음~!!!
	
	// gender 수신 및 처리
	if (gender.equals("F"))
		gender = "여자";
	else if (gender.equals("M"))
		gender = "남자";
	else
		gender = "확인불가";
	
	// major 수신 및 처리 → 특이사항 없음~!!!
	
	// hobby 수신 및 처리
	String hobbyStr = "";
	for (int i=0; i<hobby.length; i++)
		hobbyStr += String.format(hobby[i] + " / ");
	
	//				↓
	
	// 향상된 for문 foreach문으로도 표현 가능!	
	/* 	
	for (String item : hobby)
		hobbyStr += "[" + item + "]"; 
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelectOk.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 03</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelectOk.jsp</p>
</div>

<div style="font-size: 15pt; font-weight: bold; background-color: #fff0db; border-radius: 10px; width: 600px;">
	이름 : <%=name %><br><br>
	성별 : <%=gender %><br><br>
	전공 : <%=major %><br><br>
	취미 : <%=hobbyStr %>	
</div>

</body>
</html>