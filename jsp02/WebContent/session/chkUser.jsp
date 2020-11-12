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
		String id="1", pwd="1", nickName="홍길동";
		
		//아이디,비번이 일치하면 
		if(id.equals(request.getParameter("id")) &&
				pwd.equals(request.getParameter("pwd") )){
			//세션을 추가해서
			session.setAttribute("loginUser", nickName);
			//메인으로 보낸다.
			response.sendRedirect("main.jsp");
		}else{//틀리면 다시 로그인창으로.
			response.sendRedirect("login.jsp");
		}
	
	%>

</body>
</html>