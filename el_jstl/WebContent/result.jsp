<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#result.jsp

	<h4>request 객체 사용</h4>
	<%=request.getParameter("id") %><br>
	<%=request.getParameter("pwd") %><br>
	<h4>el param사용	</h4>
	${param.id }<br>
	${param.pwd }<br>
	
</body>
</html>