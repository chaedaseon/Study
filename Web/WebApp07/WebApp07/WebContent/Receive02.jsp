<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 스크립릿 영역
	
	// 이전 페이지(Send02.html)로부터 넘어온 데이터 수신
	// → name, kor, eng, mat
	
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String korStr = request.getParameter("kor");
	String engStr = request.getParameter("eng");
	String matStr = request.getParameter("mat");
	
	int kor=0;
	int eng=0;
	int mat=0;
	int sum=0;
	double avg=0;
	
	try
	{
		kor = Integer.parseInt(korStr);
		eng = Integer.parseInt(engStr);
		mat = Integer.parseInt(matStr);
		
		sum = kor + eng + mat;
		avg = sum / 3.0;	
		
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
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	span {font-weight: bold; font-size: 15pt;}
</style>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
	<hr>
</div>

<div style="text-align: center; background-color: #fff1f0; width: 700px; border-radius: 10px; margin: 100px auto;">
	<br>
	<span><%=name %></span>님, 성적 처리가 완료되었습니다.<br>
	회원님의 점수는	국어:<span><%=kor %></span>점, 
	영어:<span><%=eng %></span>점, 
	수학:<span><%=mat %></span>점 입니다.<br>
	총점은 <span style="color: #ff7979;"><%=sum %></span>점, 
	평균은 <span style="color: #8686ff;"><%=String.format("%.1f", avg) %></span>점 입니다.
	<br><br>
</div>

</body>
</html>