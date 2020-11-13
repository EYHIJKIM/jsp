<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../default/header.jsp" %>
	<script src="../jquery-3.5.1.min.js"></script>
	
<%
	
	//String userId = (String)session.getAttribute("userId");
	System.out.print(userId);
	
//로그인아이디 세션이 존재한다면
if(userId!=null){ %>
	<h1>로그인 성공</h1>
	<script type="text/javascript">
		//로그인을 성공했을때
		//이거도 헤더로 옮겨야할듯
		

		
		
	</script>
	
<%} else{ %>
	<script type="text/javascript">
		alert("잘못된 접근입니다");
		location.href = "login.jsp";
	</script>


<%} %>

<jsp:include page="../default/footer.jsp"></jsp:include>
</body>
</html>