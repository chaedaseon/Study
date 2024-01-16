<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send01.html)로부터 전송된 데이터 수신
	// → name, tel
	
	// 한글 수신을 위한 인코딩 방식 지정
	//-- 웹은 UTF-8 을 기본 인코딩 방식으로 삼고 있음.
	//   그러므로 기본 설정은 UTF-8 로 구성하는 것이 좋음.
	//   (하지만, 데이터를 전송하는 페이지에서 EUC-KR 과 같이 다른 인코딩 방식으로
	//    처리해서 전송하고 있는 상황이라면... 그에 맞는 인코딩 방식이 지정되어야
	//    한글이 깨지지 않음.
	//    또한, 지금 하고 있는 이 처리는... 데이터를 수신해서 꺼내는 처리보다
	//    먼저 수행되어야 한글이 깨지지 않은 상태로 수신할 수 있음.)
	request.setCharacterEncoding("UTF-8");


	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive01.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 01</h1>
	<hr>
</div>

<div>
	<h2>가입 확인</h2>
	<span style="color: blue; font-weight: bold;"><%=name %></span>님,
	회원 가입이 완료되었습니다.<br>
	회원님께서 등록하신 전화번호는
	<span style="color: red; font-weight: bold;"><%=tel %></span> 입니다. <br>
</div>	       

</body>
</html>