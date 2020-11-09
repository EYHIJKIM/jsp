<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>getMethod.jsp</h3>
	
	넘어온 값 : <%= request.getParameter("n") %><br>
	넘어온 값 : <%= request.getParameter("n1") %><br>
	넘어온 값 : <%= request.getParameter("n2") %><br>
</body>
</html>