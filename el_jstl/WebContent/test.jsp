<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		//jsp로 할때는 이렇게 배열로 받았었음.
		//String[] se = request.getParameterValues("se");
	%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:forEach var="s" items="${paramValues.se }">
		${s }<br>	
	</c:forEach>





</body>
</html>