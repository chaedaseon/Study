<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(List.jsp)로부터 넘어온 데이터 수신
	// → num, pageNum
	String pageNum = request.getParameter("pageNum");		//-- 페이지 번호
	String strNum = request.getParameter("num");			//-- 게시물 번호
	int num = Integer.parseInt(strNum);
	
	// 해당 게시물의 조회수 증가
	dao.updateHitCount(num);
	
	// 이전, 다음 게시물 번호 확인
	int beforeNum = dao.getBeforeNum(num);					//	??	103
	int nextNum = dao.getNextNum(num);						//		103	 ??
			
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if (beforeNum != -1)
		dtoBefore = dao.getReadDate(beforeNum);
	
	if (nextNum != -1)
		dtoNext = dao.getReadDate(nextNum);
	
	// 해당 게시물의 상세 내용 가져오기
	BoardDTO dto = dao.getReadDate(num);
	
	// 게시물 본문 라인 수 확인
	int lineSu = dto.getContent().split("/n").length;
	
	// 게시물 내용
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	//-- 즉,
	//   안녕하세요\n반갑습니다\n화요일입니다\n기운냅시다\n안녕히가세요
	//   안녕하세요<br>반갑습니다<br>화요일입니다<br>기운냅시다<br>안녕히가세요
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/article.css">
<script type="text/javascript">

	function deleteForm()
	{
		//alert("함수 호출");
		
		pwdSource = prompt("패스워드를 입력하세요.");
		
		if (pwdSource != "<%=dto.getPwd() %>")
		{
			alert("패스워드가 일치하지 않습니다~!!!");
		}
		else
		{
			alert("삭제가 완료되었습니다.");
			location.href="<%=cp%>/Delete_ok.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>";
		}			
	}

</script>
</head>
<body>

<div id="bbs">
	
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div><!-- #bbs_title -->
	
	<div id="bbsArticle">
	
		<div id="bbsArticle_header">
			<!-- 게시물의 제목입니다. -->
			<%=dto.getSubject() %>
		</div><!-- #bbsArticle_header -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>작성자</dt>
				<!-- <dd>정현욱</dd> -->
				<dd><%=dto.getName() %></dd>
				
				<dt>라인수</dt>
				<!-- <dd>23</dd> -->
				<dd><%=lineSu %></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<!-- <dd>2023-12-19</dd> -->
				<dd><%=dto.getCreated() %></dd>
				
				<dt>조회수</dt>
				<!-- <dd>13</dd> -->
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div id="bbsArticle_content">
			<table style="width: 600px;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150px;">
						<!-- 어쩌구 저쩌구 이러쿵 저러쿵 내용입니다. -->
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div><!-- #bbsArticle_content -->
		
		<div class="bbsArticle_bottomLine">
			<!-- 이전글 : (104) 취미 관련 게시물 -->
			<%
			if (beforeNum != -1)
			{
			%>
				<!-- 이전글 : 있음 -->
				<%-- 이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %> --%>
				<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum %>&num=<%=beforeNum %>">
				이전글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %>
				</a>
			<%
			}
			else
			{
			%>
				이전글 : 없음
			<%
			}
			%>
		</div><!-- .bbsArticle_bottomLine -->
		
		<div class="bbsArticle_noLine">
			<!-- 다음글 : (102) 날씨 관련 게시물 -->
			<%
			if (nextNum != -1)
			{
			%>
				<!-- 다음글 : 있음 -->
				<%-- 다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %> --%>
				<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum %>&num=<%=nextNum %>">
				다음글 : (<%=nextNum %>) <%=dtoNext.getSubject() %>
				</a>
			<%
			}
			else
			{
			%>
				다음글 : 없음
			<%
			}
			%>
		</div><!-- .bbsArticle_noLine -->		
	
	</div><!-- #bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		<!-- From : 211.238.142.151 -->
		From : <%=dto.getIpAddr() %>
	</div><!-- .bbsArticle_noLine -->
	
	<div id="bbsArticle_footer">
		
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=1'">
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=2'">
			
			<!-- 내가 풀이한 내용 : javascript -->
			<!-- <input type="button" value="삭제" class="btn2" onclick="deleteForm()"> -->
			
		</div><!-- #leftFooter -->
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'">
		</div><!-- #rightFooter -->
		
	</div><!-- #bbsArticle_footer -->	
	
	
</div><!-- #bbs -->

</body>
</html>