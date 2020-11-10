<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
</head>
<body>


	<%
		Cookie cookie = new Cookie("chkTrue", "NoShow");
		cookie.setMaxAge(10);
		response.addCookie(cookie);

	%>	
	
	<script>
		window.close();
	</script>
	


</body>
</html>