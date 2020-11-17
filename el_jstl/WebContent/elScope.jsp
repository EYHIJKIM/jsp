<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#elScope.jsp<br>

<%
	pageContext.setAttribute("name", "page man");
	request.setAttribute("name", "request man");
	session.setAttribute("name", "session man");
	application.setAttribute("name", "application man");
%>

name : ${name }<br>
page : ${pageScope.name }<br>
request : ${requestScope.name }<br>
session : ${sessionScope.name }<br>
application : ${applicationScope.name }<br>
<a href="scopeTest.jsp">이동</a>
<%-- 
	<%=request.getAttribute("name") %>
	<%=session.getAttribute("name") %>
--%>

</body>
</html>