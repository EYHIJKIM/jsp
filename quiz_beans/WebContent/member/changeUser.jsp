<%@page import="members.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file="../default/header.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
if(userId!=null){
%>
<jsp:useBean id="dao" class="members.MemberDAO" />
<jsp:useBean id="dto" class="members.MemberDTO" />

<jsp:setProperty property="name" name="dto"/>
<jsp:setProperty property="addr" name="dto"/>
<jsp:setProperty property="tel" name="dto"/>


<%
	String tableId= request.getParameter("tableId");
	dto.setId(tableId);
	dao.updateMember(dto);
	
%>

<script type="text/javascript">
	alert("수정이 완료되었습니다");
	location.href="memberDetail.jsp?tableId=<%=tableId%>";
</script>
<%} else{ %>  
	<script type="text/javascript">
		alert("잘못된 접근입니다");
		location.href = "login.jsp";
	</script>
<%} %>

</body>
</html>