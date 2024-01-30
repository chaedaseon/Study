<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Write_ok.jsp */
	
	// ① 주요 속성값들 준비
	// ①-1. 경로
	String root = "/";
	root = pageContext.getServletContext().getRealPath(root);
	
	String savePath = root + "pds" + File.separator + "saveFile";
	//								    └ "\\"
	
	// ①-2. 인코딩방식
	String encType = "UTF-8";
	// ①-3. 최대파일용량
	int maxFileSize = 5*1024*1024;
	
	// ② 위에서 설정한 경로 상 디렉터리가 존재하지 않으면... 생성한다.
	File dir = new File(savePath);
	if (!dir.exists())
		dir.mkdirs();
	
	// ③ MultipartRequest 객체 구성
	MultipartRequest req = null;
	String urlFile = "";
	
	try
	{
		// ※ 인자 리스트
		//    - request요청객체, 파일저장경로, 파일최대크기, 인코딩방식, 중복파일명처리정책
		req = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
		
		// ④ 구성된 MultipartRequest 객체로부터 필요한 값 얻어내기
		//		- getParameter()
		out.println("작성자 : " + req.getParameter("userName") + "<br>");
		out.println("제목 : " + req.getParameter("subject") + "<br>");
		//		- getFilesystemName()
		out.println("서버에 저장된 파일명 : " + req.getFilesystemName("uploadFile") + "<br>");
		//		- getOriginalFileName()
		out.println("업로드한 파일명 : " + req.getOriginalFileName("uploadFile") + "<br>");
		//		- getContentType()
		out.println("파일 타입 : " + req.getContentType("uploadFile") + "<br>");
		
		//		- getFile()
		File f = req.getFile("uploadFile");
		if (f != null)
		{
			// -length()
			out.println("파일 크기 : " + f.length() + "Bytes. <br>");
		}
		
		// ⑤ 다운로드 기능을 수행하기 위한 속성을 get 방식으로 처리
		urlFile = "Download.jsp?saveFileName=" + req.getFilesystemName("uploadFile");
		//-- 속성 구성 1 → 서버에 저장된 파일의 이름
		urlFile += "&originalFileName=" + req.getOriginalFileName("uploadFile");
		//-- 속성 구성 2 → 실제 업로드한 파일의 이름		
	}
	catch (Exception e)
	{
		System.out.println(e.toString());
	}
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Write_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<a href="<%=urlFile %>">파일 다운로드</a>
</div>

</body>
</html>