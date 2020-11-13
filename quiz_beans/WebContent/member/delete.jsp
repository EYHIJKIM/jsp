<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>


<%@ include file="../default/header.jsp" %>
<%
	if(userId!=null){
%>
<jsp:useBean id="dao" class="members.MemberDAO" />

<%String tableId = request.getParameter("tableId"); 
	dao.deleteMember(tableId);
%>
<script type="text/javascript">
	alert("삭제 완료!!")
	location.href="logout.jsp";
</script>

<%} else{ %>  
	<script type="text/javascript">
		alert("잘못된 접근입니다");
		location.href = "login.jsp";
	</script>
<%} %>

</body>
</html>