
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%if(session.getAttribute("loginSuc")==null){ %>
	<form action="check.jsp" method="post">
		<input type="text" name="id" placeholder="ID"><br>
		<input type="password" name="pwd" placeholder="PW"><br>
		<input type="submit" value="로그인">
		<input type="button" value="회원가입" onclick="location.href='register.jsp'">
	</form>
<%} else {%>
	
	<%=session.getAttribute("userId") %>님은 이미 로그인 되어있어요.
	<hr>
	<a href="main.jsp">메인화면으로</a>

<%} %>
</body>
</html>