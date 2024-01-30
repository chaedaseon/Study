<%@page import="java.util.Enumeration"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* ObjectRead.jsp */


	String appRoot = "/";
	appRoot = pageContext.getServletContext().getRealPath(appRoot);
	
	File newFile = new File(appRoot, "objData/data.ser");
	
	// 파일이 존재하는지 확인한 후 처리
	if( (newFile.exists()))
	{
		// 파일을 읽어들이기 위해 FileInputStream 객체 생성
		FileInputStream fis = new FileInputStream(newFile);
		
		// 파일에서 Object 를 읽어들이기 위해 ObjectInputStream 객체 생성
		ObjectInputStream ois = new ObjectInputStream(fis);
		
		// ObjectInputStream 을 이용하여 파일로부터 Object 읽어오기
		// 읽어온 Object 를 원래의 형(타입)으로 캐스팅
		Hashtable h = (Hashtable)ois.readObject();
		
		ois.close();
		fis.close();
		
		Enumeration e = h.keys();
		while(e.hasMoreElements())
		{
			String key = (String)e.nextElement();
			String value = (String)h.get(key);
			%>
			<%=key %> 의 값은 <%=value %> 입니다.<br>
			<% 
		}
		
		
	}
	else
	{
		out.println("해당 파일이 존재하지 않습니다~!!!");
	}



// 아래 보여주기 위한 템플릿은 모두 제거

%>