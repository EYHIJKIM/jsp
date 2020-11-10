<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="UserController.java" method="post">
	<h3>아이디 입력</h3>
	<input type="text" name="id" placeholder="ID입력">
	<input type="button" name="idChk" value="중복체크" >
	
	<h3>비밀번호 입력</h3>
	<input type="text" name="pw" placeholder="PW">
	
	<h3>비밀번호 확인</h3>
	<input type="text" name="pwChk" placeholder="PW">

	<h3>이름 입력</h3>
	<input type="text" name="pwChk" placeholder="NAME">
	
	<input type="submit" value="Join in">
</form>
	

</body>
</html>