<%@page import="com.test.NewsDTO"%>
<%@page import="com.test.NewsDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 이전 페이지로부터 넘어온 데이터 수신
	String stnId = request.getParameter("stnId");

	if (stnId==null)
		stnId = "40300001";

	NewsDAO dao = new NewsDAO(stnId);
	StringBuffer sb = new StringBuffer();
	
	// 카테고리 추출
	String title = dao.NewsCategory();
	
	int idx = 1;
	
	// 뉴스 타이틀 추출	
	sb.append("<table class='table'>");
	sb.append("<tr><th>no.</th><th>title</th><th>description</th><th>link</th><th>category</th><th>pubDate</th></tr>");
	
	for (int i=1; i<dao.NewsTitle().size(); i++)
	{
		for (NewsDTO news : dao.NewsInfo(String.format("%s", idx++)))
		{
			//sb.append(String.format("<h3>title> %s</h3>", news.getTitle()));
			//sb.append(String.format("link> %s<br>", news.getLink()));
			//sb.append(String.format("category> %s<br>", news.getCategory()));
			//sb.append(String.format("description> %s<br>", news.getDescription()));
			//sb.append(String.format("author> %s<br>", news.getAuthor()));
			//sb.append(String.format("pubDate> %s<br>", news.getPubDate()));
			sb.append(String.format("<tr><td>%s</td>", idx-1));
			sb.append(String.format("<td>%s</td>", news.getTitle()));
			sb.append(String.format("<td>%s</td>", news.getDescription()));
			sb.append(String.format("<td><a href='%s'>뉴스 URL</a></td>", news.getLink()));
			sb.append(String.format("<td>%s, %s</td>", news.getAuthor(), news.getCategory()));
			sb.append(String.format("<td>%s</td></tr>", news.getPubDate()));
		}		
	}
	
	sb.append("</table>");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매일경제 - 전체뉴스(NewsInfo.jsp)</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	th, h2, .footer {text-align: center;}
	h2 {font-weight: bold;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		// 확인
		//alert("확인");
		
		$(":radio[value='<%=stnId%>']").attr("checked", "checked");
		
	});

</script>

</head>
<body>

<div class="container">
	<div style="text-align: center;">
		<br>
		<svg "1.1" id="mkLogo" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0" y="0" width="130" h="30" viewBox="0 0 130 30" xml:space="preserve">
			<g style="fill:#000;">
			<path d="M121 1.2c0 .2.1.3.3.3.7 0 1.3.6 1.4 1.4V29h1.9c1.5-.1 2.6-1.3 2.6-2.8V.8h-5.8c-.3 0-.4.2-.4.4M26.1 1.2c0 .2.1.3.3.3.7 0 1.3.6 1.3 1.4v4.8h-2.8V.8h-5.7c-.2 0-.3.2-.3.3 0 .2.1.3.3.3.7 0 1.3.6 1.3 1.4V29h1.9c1.4-.1 2.5-1.3 2.4-2.7V10.9h2.8V29h2.2c1.4 0 2.3-1.2 2.3-2.8V.8h-5.8c-.1 0-.2.2-.2.4M114.4.8c-.2 0-.3.2-.3.3 0 .2.1.3.3.3.7 0 1.3.6 1.3 1.3v6h-4.5c-.7 0-.7.3-.5.7l1.4 2.2h3.6V29h2c1.4-.1 2.5-1.3 2.4-2.7V.8h-5.7zM88.4.9c-.2 0-.3.2-.3.3 0 .2.1.3.3.3.8 0 1.4.6 1.4 1.4v1.5h-5c-.7 0-.7.3-.5.7l1.2 2h4.3v2.1h-5c-.7 0-.7.3-.5.7l1.2 2h4.3v3.3h1.9c1.6-.1 2.8-1.4 2.7-3V.9h-6zM82.3.8h-14c-.7 0-.7.3-.5.7l1.4 2.3H78c-1.1 5.6-6.3 9.7-10.4 10.9-.3 0-.4.3-.4.5s.4.4.6.4c5.8.2 14-3.9 15.8-12.7.3-1.3-.5-2.1-1.3-2.1"></path>
			<path d="M106.7 13.9c.4.7 4.3 6.2 5.1 7.1s1.3 1.2 1.5.2v-4.5c.1-.3-.1-.6-.4-.7-1.8-1.1-3.5-2.5-5-4 1.4-2.1 3.9-7.5 3.9-9.6.1-.8-.6-1.5-1.4-1.6h-11c-.7 0-.7.3-.5.7l1.5 2.4h5.7c-.5 5.9-4.3 13.5-8.1 16.5-.3.2-.4.4-.3.7.1.2.4.2.8.1 1.1-.3 4.9-2.8 8.2-7.3M9 3.9h4v13.7H9V3.9zM2.9 1.2c0 .2.1.3.3.3.7 0 1.3.6 1.4 1.4v14.6c-.1 1.7 1.3 3.2 3 3.3h6.8c1.7 0 3-1.4 3-3V.8H3.2c-.2 0-.3.2-.3.4M83.2 26.8c-3.4 0-6.6-2.2-6.6-4.7s3.2-4.4 6.6-4.4 6.6 2 6.6 4.4-3.2 4.7-6.6 4.7m0-12c-6.7 0-11.1 3.3-11.1 7.4s4.4 7.6 11.1 7.6 11.1-3.6 11.1-7.6-4.4-7.4-11.1-7.4M57 1.1c0 .2.1.3.3.3.7 0 1.4.6 1.4 1.3V14h2.2c1.6-.1 2.8-1.4 2.7-3V.8h-6.3c-.2 0-.3.1-.3.3M44.9 11.3c-2.4.1-4.4-1.8-4.5-4.1.2-2.5 2.4-4.3 4.9-4.1 2.2.2 3.9 1.9 4.1 4.1-.1 2.3-2.1 4.2-4.5 4.1m0-11.1c-5.7 0-9.1 3.1-9.1 6.9s3.4 6.9 9.1 6.9S54 11 54 7.2s-3.4-7-9.1-7M64 25.9H46.6v-2.2h14.3c1.6-.1 2.8-1.4 2.7-3v-5.1H40.9c-.5 0-.6.3-.4.7l1.4 2.3h17v2.2H40.5c-.2 0-.3.1-.3.3 0 .2.1.3.3.3.8 0 1.4.6 1.4 1.4V26c0 1.7 1.3 3 2.9 3.1H64v-3.2z"></path>
			</g>
		</svg>
		<span style="color: #FF7A00; font-weight: bold;">뉴스</span>
	</div>
	<div class="panel-group">		
		<hr>		
			<form method="get" role="form">
			<div style="display: flex; justify-content: space-around; align-items: baseline;">
			<label>
				<input type="radio" name="stnId" value="40300001" checked="checked"> 전체뉴스
			</label>
			<label>
				<input type="radio" name="stnId" value="30100041"> 경제
			</label>
			<label>
				<input type="radio" name="stnId" value="30200030"> 정치
			</label>
			<label>
				<input type="radio" name="stnId" value="50400012"> 사회
			</label>
			<label>
				<input type="radio" name="stnId" value="30300018"> 국제
			</label>
			<label>
				<input type="radio" name="stnId" value="50100032"> 기업·경영
			</label>
			<label>
				<input type="radio" name="stnId" value="50200011"> 증권
			</label>
			<label>
				<input type="radio" name="stnId" value="50300009"> 부동산
			</label>
			<label>
				<input type="radio" name="stnId" value="30000023"> 문화·연예
			</label>
			<label>
				<input type="radio" name="stnId" value="71000001"> 스포츠
			</label>
			<label>
				<input type="radio" name="stnId" value="50700001"> 게임
			</label>
			<label>
				<input type="radio" name="stnId" value="30800011"> 영문뉴스
			</label>
			
			<button type="submit" class="btn btn-default">검색</button>
			</div>
			<hr>
			</form>
		</div>
	
	<div class="panel">
		<!-- 
		title> 美보스턴미술관서 보물급 ‘고려 사리구’ 돌아온다...100년만의 귀환<br>
		link> https://www.mk.co.kr/news/culture/10937478<br>
		author> 매일경제 <br>
		pubDate> Tue, 06 Feb 2024 10:08:49 +09:00<br>
		description> 조계종·문화재청, 현지 반환 협상 성과 사리 4과는 기증, 사리구는 임시대여 작년 김건희 여사 방문으로 재협상 물꼬 미국 보스턴미술관이 소장하고 있는 고려시대 스님의 사리와 이를 ..
		-->
		<%=sb.toString() %>
		
	</div>
	<div class="footer">
		copy＠매일경제_daseon
		<hr>
	</div>
</div>

</body>
</html>