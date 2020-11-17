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
		
	<%
	if(userId!=null){//세션이 존재한다면 %>
	<jsp:useBean id="dao" class="members.MemberDAO"/>
	<jsp:useBean id="dto" class="members.MemberDTO"/>
	
	<%
	
		String tableId = request.getParameter("tableId");
		dto = dao.getAMember(tableId);	
	
	%>
	<form action="changeUser.jsp?tableId=<%=tableId %>" method="post">
		이름 <input type="text" name="name" value="<%=dto.getName()%>"><br>
		주소 <input type="text" name="addr" value="<%=dto.getAddr()%>"><br>
		전화번호 <input type="text" name="tel" value="<%=dto.getTel()%>"><br> 
		<input type="submit" value="완료">
		<input type="button" value="취소" onclick="location.href='memberDetail.jsp?tableId=<%=tableId%>'">
	</form>
	
	
	
	
	
		<%} else{ %>
		<script type="text/javascript">
			alert("잘못된 접근입니다");
			location.href = "login.jsp";
		</script>
	<%} %>

</body>
</html>