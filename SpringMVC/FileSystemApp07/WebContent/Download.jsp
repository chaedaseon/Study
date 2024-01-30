<%@page import="com.test.util.FileManager"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	/* Download.jsp */
	
	String root ="/";
	root = pageContext.getServletContext().getRealPath(root);
	
	String savePath = root + "pds" + File.separator + "saveFile";
	
	String saveFileName = request.getParameter("saveFileName");
	String originalFileName = request.getParameter("originalFileName");
	
	// check~!!!
	// 파일 다운로드
	out.clear();		//-- 기존 출력 스트림 클리어~
	boolean flag = FileManager.doFileDownload(saveFileName, originalFileName, savePath, response);
	
%>