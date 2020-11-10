<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#test01.jsp<br>
	 컨텍스트 패스 : <%=request.getContextPath() %><br>
	 요청 방식 : <%=request.getMethod() %><br>
	 요청한 URL : <%=request.getRequestURL() %><br>
	 요청한 URI : <%=request.getRequestURI() %><br>
	 서버의 이름 : <%=request.getServerName() %><br>
	 프로토콜 : <%=request.getProtocol() %><br>
	<hr>
	
	
	<form action="result01.jsp" method="post">
		<input type="text" name="txt"><br>
		1<input type="checkbox" name="chk" value="1번">
		2<input type="checkbox" name="chk" value="2번">
		3<input type="checkbox" name="chk" value="3번">
		<br><input type="submit">
		
	</form>


</body>
</html>