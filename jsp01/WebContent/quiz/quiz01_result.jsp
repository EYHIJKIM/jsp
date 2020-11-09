<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	입력하신 수는 <%=request.getParameter("putNum") %><br>
	당신은 <%=request.getParameter("gender") %>이군요.

</body>
</html>