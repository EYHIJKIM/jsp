<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#delSession.jsp<br>
		<h1>세션이 삭제 되었습니다.</h1>
<%
	//모든 세션을 바로 삭제하는 것
	session.invalidate();

	//session.removeAttribute("age");

	//5초 후에 모든세션을 종료하겠다는 의미
	session.setMaxInactiveInterval(5);
	
	
%>
		

	<a href="setSession.jsp">setSession(세션설정)이동</a>
	<a href="getSession.jsp">getSession(세션확인)이동</a>

</body>
</html>