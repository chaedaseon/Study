<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	
	/* FileRead.jsp */
	
	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	// 1. 파일을 읽기 위해 File 객체를 생성
	File newFile = new File(appRoot, "data/test.txt");
	
	// 2. 파일이 존재하는지의 여부 확인
	//    → 지정된 경로에 파일이 존재하는지의 여부를 확인하여
	//		 존재하는 경우에만 처리하여 FileNotFoundException 방지
	if(newFile.exists())
	{
		// 3-1. 파일을 읽기 위한 FileReader 객체 생성
		FileReader fr = new FileReader(newFile);
		
		// 3-2. FileReader 를 객체에 좀 더 편하게 사용하기 위해 
		//		BufferedReader 로 감싸기
		BufferedReader br = new BufferedReader(fr);
		
		// 4. 실질적으로 파일의 내용을 읽어냄
		String readData;
		while( (readData=br.readLine()) != null) 	// 라인별로 읽어들이는 기능 반복
		{
			out.println(readData + "<br>");
		}
		
		// 5-1. BufferedReader 리소스 반납(닫아줌)
		br.close();
		// 5-2. FileReader 리소스 반납(닫아줌)
		fr.close();
	}
	else		// 지정된 경로에 파일이 존재하지 않았을 경우 
	{
		out.println("정상적으로 파일을 읽어들일 수 없습니다.");
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileRead.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

</body>
</html>