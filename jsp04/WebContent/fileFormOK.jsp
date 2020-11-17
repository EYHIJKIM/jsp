<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="javax.swing.text.DefaultTextUI"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#fileFormOK.jsp<br>
	<%
		//폴더의 실질적인 위치를 가지고 와서
		//경로를 사용하는 것임.
		String path = application.getRealPath("fileUpDown");
		out.print("path :"+path);
		
		int size = 1024*10; //10M 파일의 크기를 정한거임.
		String file=""; String oriFile="";
	
		//form에서 multipart로 보냈으므로 request로 값을 못받음. 이렇게 받는다.
		MultipartRequest multi 
			= new MultipartRequest(request,path,size,"utf-8",
					new DefaultFileRenamePolicy());//뒤쪽에 넘버링을 붙여준다.
		file = multi.getFilesystemName("file");
		oriFile = multi.getOriginalFileName("file");
		out.print("<br>저장될 파일 이름:"+file);
		out.print("<br>실제 파일 이름:"+oriFile);
		response.sendRedirect("fileForm.jsp");//원래 페이지로 보냄	
	%>

</body>
</html>