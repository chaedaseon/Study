<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기상청 육상 중기 예보(Weather.jsp)</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com.bootstrapcdn/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>

<!-- 
stnId=108	전국		
stnId=109	서울·경기도		
stnId=105	강원도
stnId=131	충북		
stnId=133	충남		
stnId=146	전북		
stnId=156	전남		
stnId=143	경북		
stnId=159	경남		
stnId=184	제주특별자치도	
-->

<div class="container">

	<h2>
		기상 정보 <small>중기 예보</small>
	</h2>
	
	<div class="panel-group" role="group">
	
		<div class="panel panel-default" role="group">
		
			<div class="panel-heading">지역 선택</div>
			<div class="panel-body">
				<form method="get" role="form">
					<label>
						<input type="radio" name="stnId" value="108" checked="checked"> 전국
					</label>
					<label>
						<input type="radio" name="stnId" value="109"> 서울·경기
					</label>
					<label>
						<input type="radio" name="stnId" value="105"> 강원
					</label>
					<label>
						<input type="radio" name="stnId" value="131"> 충북
					</label>
					<label>
						<input type="radio" name="stnId" value="133"> 충남
					</label>
					<label>
						<input type="radio" name="stnId" value="146"> 전북
					</label>
					<label>
						<input type="radio" name="stnId" value="156"> 전남
					</label>
					<label>
						<input type="radio" name="stnId" value="143"> 경북
					</label>
					<label>
						<input type="radio" name="stnId" value="159"> 경남
					</label>
					<label>
						<input type="radio" name="stnId" value="184"> 제주특별자치도
					</label>
					
					<button type="submit" class="btn btn-default">Submit</button>
				</form>
			</div>
			
		</div><!-- close div.panel.panel-default -->
		<br>
		
		<div class="panel panel-default" role="group">
		
			<div class="panel-heading">기상 정보 출력</div>
			<div class="panel-body">
				<p>
					<b>서울,경기도 육상 중기예보 - 2024년 02월 05일 (월)요일 06:00 발표</b>
				</p>
				<p>
					○ (하늘상태) 11일(일), 14일(수)~15일(목)은 대체로 흐리거나 구름많겠고, 그 밖의 날은 대체로 맑겠습니다.<br />
					○ (기온) 아침 기온은 -7~4도, 낮 기온은 3~10도로 평년(최저기온 -9~-3도, 최고기온 3~6도)과 비슷하거나 높겠습니다.<br />
					○ (해상) 서해중부해상의 물결은 0.5~2.5m로 일겠습니다.<br />
					○ (주말전망) 10일(토)은 대체로 맑겠고, 11일(일)은 구름많겠습니다. 아침 기온은 -5~-1도, 낮 기온은 5~7도가 되겠습니다.
				</p>
				
				<h3>서울</h3>
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>최저/최고 기온</th>
							<th>강수확률</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2024-02-08 00:00</td>
							<td>맑음</td>
							<td>-3 ~ 5</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2024-02-08 12:00</td>
							<td>구름많음</td>
							<td>-3 ~ 5</td>
							<td>30</td>
						</tr>
						<tr>
							<td>2024-02-09 00:00</td>
							<td>맑음</td>
							<td>-3 ~ 5</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2024-02-09 12:00</td>
							<td>맑음</td>
							<td>-3 ~ 5</td>
							<td>10</td>
						</tr>
					</tbody>					
				</table>
				
				<h3>인천</h3>
				<table class="table">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>최저/최고 기온</th>
							<th>강수확률</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2024-02-08 00:00</td>
							<td>맑음</td>
							<td>-4 ~ 3</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2024-02-08 12:00</td>
							<td>구름많음</td>
							<td>-4 ~ 3</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2024-02-09 00:00</td>
							<td>맑음</td>
							<td>-3 ~ 4</td>
							<td>10</td>
						</tr>
						<tr>
							<td>2024-02-09 12:00</td>
							<td>맑음</td>
							<td>-3 ~ 4</td>
							<td>10</td>
						</tr>
					</tbody>					
				</table>
				
			</div>
		
		</div>
	
	</div><!-- close div.panel-group -->

</div><!-- close div.container -->
 
</body>
</html>