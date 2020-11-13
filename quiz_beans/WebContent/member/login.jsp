<%@page import="members.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../default/header.jsp" %>

<%if(userId==null){ %>
	<h1>로그인 페이지 입니다.</h1>

	<form id="loginForm" action="loginChk.jsp" method="post">
		<input type="text" name="id" placeholder="ID"><br>
		<input type="password" name="pwd" placeholder="PW">
		<input type="submit" value="로그인">
	</form>
	<a href="register.jsp">회원가입  </a>
<%} else{ 
	response.sendRedirect("index.jsp");
}%>	
	
<jsp:include page="../default/footer.jsp" />
</body>
</html>