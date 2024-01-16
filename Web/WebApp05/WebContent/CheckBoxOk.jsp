<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지로부터 데이터 수신
	// → name, memo, checkbox
	
	// 한글 깨짐 방지 처리
	request.setCharacterEncoding("UTF-8");

	// 이름 데이터 수신
	String name = request.getParameter("name");
	
	// 메모 데이터 수신		check~!!!
	String memo = request.getParameter("memo");
	// memo = memo.replace("\n", "<br>");
	memo = memo.replaceAll("\n", "<br>");
	//-- JDK 1.5 이후부터 『replaceAll()』 메소드 사용 가능
	//   『replaceAll()』 을 통해 처리한 결과를 다시 memo 변수에 대입
	//    "안녕하세요\n반갑습니다\n이윤수입니다."
	//	  → "안녕하세요<br>반갑습니다<br>이윤수입니다."
	
	// 이상형 데이터 수신
	//String check = request.getParameter("checkbox");			// (Ⅹ)
	
	// ※ 같은 name 속성의 값을 가진 데이터 여러 개를 받는 경우
	//    (즉, 다중 데이터로 수신하는 경우)
	//    이를 배열로 처리해야 한다. → 『getParameterValues()』
	
	String[] check = request.getParameterValues("checkbox");
	
	// ※ 배열 데이터를 수신하여 처리할 경우...
	//    수신된 데이터가 전혀 없는 경우는
	//    배열의 값 자체가 null 이 되어버리기 때문에
	//    null 에 대한 확인(검사) 과정이 필요하다.		check~!!!
	
 	String checkStr = "";
	if (check != null)
	{
		for (int i=0; i<check.length; i++)
			checkStr += "[" + check[i] + "]";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckBoxOk.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP를 이용한 데이터 송수신 실습 04</h1>
	<hr>
	<p>CheckBox.jsp → CheckBoxOk.jsp</p>
</div>

<div>
	<h2>수신 데이터 확인</h2>
	<br>
	이름 : <%=name %>
	<br><br>
	메모 : <%=memo %>
	<br><br>
	이상형 : <%=checkStr %>
</div>

</body>
</html>