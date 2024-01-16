<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 이전 페이지(SendAndReceive06.jsp → 자기 자신 페이지)로부터 넘어온 데이터 수신
	// → userInput
	
	request.setCharacterEncoding("UTF-8");

	String temp = "";
	
	temp = request.getParameter("userInput");
	
	if (temp == null)
		temp = "없음";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive06.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 06</h1>
	<hr>
</div>

<div>
	<!-- 	
	<form action="Test999.jsp" method="post">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form> 
	-->
	
	<!-- 	
	<form action="" method="post">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	 -->
	<!--  
	<form action="" method="get">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	 -->
	<!-- 
	<form method="get">
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	 -->
	
	<form>
		입력
		<input type="text" id="userInput" name="userInput" class="txt">
		<br>
		
		<button type="submit" class="btn control">테스트</button>
		<button type="reset" class="btn control">취소</button>
	</form>
	
	<!-- check~!!! -->
	<!-- ※ form 의 action 속성을 『action=""』 와 같이 구성하거나
	        action 속성을 생략하여 『<form method="post">』 와 같이 구성하게 되면
	        페이지 요청 및 데이터 전송에 대한 수신처 페이지는 자기 자신이 된다. -->
	
</div>

<div>
	<h2>수신된 데이터 확인</h2>
	<h3>→ <%=temp %></h3>
</div>

</body>
</html>