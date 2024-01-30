<%@page import="java.io.ObjectOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* ObjectWrite.jsp */

	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	//테스트
	System.out.println(appRoot);
	
	// 파일 객체 생성
	File newFile = new File(appRoot, "objData/data.ser");
	
	// 파일이 존재할 디렉티러가 존재하지 않을 경우는
	// 파일이 위치할 경로까지의 디렉터리들을 생성해준다.
	
	if(!newFile.getParentFile().exists())
	{
		newFile.getParentFile().mkdirs();
	}

		
	// 파일에 넣기 위한 Hashtable 객체를 만들어 데이터에 포함시킨다.
	Hashtable<String, String> h = new Hashtable<String, String>();
	
	h.put("key1", "사과");
	h.put("key2", "수박");
	
	// 파일을 내보내기 위한 스트림 구성
	FileOutputStream fos = new FileOutputStream(newFile);
	
	// Object 를 파일에 기록하기 위해 OjbectOutputStream 객체 생성
	// → 생성한 객체로 FileOutputStream 객체 감싸기
	ObjectOutputStream oos = new ObjectOutputStream(fos);
	
	// ObjectOutputStream 을 이용하여 파일에 Object 를 기록
	oos.writeObject(h);
	
	// 리소스 반납
	oos.close();
	fos.close();
	
//아래 보여주는 템플릿 제거
	
%>