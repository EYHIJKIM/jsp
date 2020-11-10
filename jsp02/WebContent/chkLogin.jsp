<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#chkLogin<br>
	<%
		//db가 없으니 id,pwd를 미리 정해놓고 확인
		request.setCharacterEncoding("utf-8");
		String id = "1", pwd="2";
		String user_id = request.getParameter("id");
		String user_pwd = request.getParameter("pwd");
		//로그인 성공시
		if(id.equals(user_id) && pwd.equals(user_pwd)){
			//메인으로 보낸다
			response.sendRedirect("main.jsp");
			
		}else{//로그인 실패시 로그인 폼으로 돌려보냄.
			response.sendRedirect("loginForm.jsp");
		}
	%>


</body>
</html>