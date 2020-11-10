<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#firstPage<br>
	<%
		pageContext.setAttribute("name","page man");
		request.setAttribute("name", "request man");
		session.setAttribute("name", "session man");
		application.setAttribute("name", "application man");
	%>
	<h3>firstPage</h3>
	하나의 페이지 속성 : <%=pageContext.getAttribute("name") %><br>
	하나의 요청 속성 : <%=request.getAttribute("name") %><br>
	하나의 세션 속성 : <%=session.getAttribute("name") %><br>
	하나의 어플 속성 : <%=application.getAttribute("name") %><br>
	
	<hr>
	<a href="secondPage.jsp">secondPage이동</a>
	
	<%
		//리퀘스트 값을 해당 페이지로 전달.
		request.getRequestDispatcher(
				"secondPage.jsp").forward(request, response);
	%>
	
	
	
</body>
</html>