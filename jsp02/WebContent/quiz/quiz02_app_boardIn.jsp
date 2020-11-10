<%@page import="org.apache.tomcat.util.net.ApplicationBufferHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 입니다</h1>
	<h2>공지사항 입니다</h2>
	jsp application을 이용한 조회수 올리기 문제입니다.
	<a href="quiz02_app_board.jsp">돌아가기</a>
	
	
	
	<%
	
	int count=0;
	//처음 만들어진게 아니라면
		if(application.getAttribute("see")!=null){
			//변수에 see를 넣는다
			count = (int)application.getAttribute("see");
		}
		
		
		count++;
		application.setAttribute("see", count);
	
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	W
</body>
</html>