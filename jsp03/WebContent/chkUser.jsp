<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#chkUser.jsp<br>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String user = request.getParameter("user");
	
	if(user.equals("user")){//user체크박스를 선택한다면%>
		<jsp:forward page="userPage.jsp">
			<jsp:param value="user...."	name="name"/>
		</jsp:forward>
		
	<%} else{//admin 선택시%>
		<jsp:forward page="adminPage.jsp">
			<jsp:param value="admin" name="name"/>
		</jsp:forward>
		
		
	<%}%>



</body>
</html>