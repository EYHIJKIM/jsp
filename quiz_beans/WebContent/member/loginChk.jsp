<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="members.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


	<jsp:useBean id="userInfo" class="members.MemberDTO" />
	<jsp:useBean id="dao" class="members.MemberDAO" />
	<jsp:setProperty property="*" name="userInfo"/>
	<%
		
		String id = userInfo.getId();
	
		int chk = dao.idPwChk(id, userInfo.getPwd());
		
		
		if(chk==1){//로그인 성공 시
			session.setAttribute("userId", id);
			System.out.print(id);
	%>
		<script type="text/javascript">
			location.href="successLogin.jsp"
		</script>
			
	<%} else if(chk==-1){%>
		<script type="text/javascript">
			alert("등록되지 않은 아이디 입니다.")
			location.href="login.jsp"
		</script>
	
	
	<%} else{ %>
		<script type="text/javascript">
			alert("비밀번호가 일치하지 않습니다.")
			location.href="login.jsp"
		</script>
	
	<%} %>
	

</body>
</html>