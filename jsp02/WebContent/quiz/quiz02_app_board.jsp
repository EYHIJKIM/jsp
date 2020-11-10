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
	int count;
	if(application.getAttribute("see")==null){
		count =0;
		
		
		
		
	}else {
		count = (int)application.getAttribute("see");
	}

	

%>

	<table border="1">
		<tr>
			<th>제목</th>
			<th>조회수</th>
		</tr>
		<tr>
			<td><a href="quiz02_app_boardIn.jsp">안녕하세요</a></td>
			<td><%=count %></td>
		
		</tr>
	
	</table>


</body>
</html>