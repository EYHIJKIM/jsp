
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<form action="check.jsp" method="post">
	<input type="text" name="id" placeholder="ID"><br>
	<input type="password" name="pwd" placeholder="PW"><br>
	<input type="submit" value="로그인">
</form>
	<input type="button" value="회원가입" onclick="location.href='register.jsp'">


</body>
</html>