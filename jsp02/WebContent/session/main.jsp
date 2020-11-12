<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#main.jsp<br>

<%
//로그인이 되어있지 않다면(세션이 존재하지 않는다면)
if(session.getAttribute("loginUser")==null){%>
	<script type="text/javascript">
		alert("로그인 먼저 진행하세요!!!")
		location.href="login.jsp";	
	</script>
<%}%>

	<%=session.getAttribute("loginUser") %>님 안녕하세요!<br>
	<a href="logout.jsp">로그아웃 이동</a>
	<a href="login.jsp">로그인 이동</a>
</body>
</html>