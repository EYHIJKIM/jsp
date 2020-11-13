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
	<jsp:useBean id="dao" class="members.MemberDAO" />
	<jsp:useBean id="dto" class="members.MemberDTO" />
	
	<%
	
		response.setCharacterEncoding("utf-8");
		String tableId = request.getParameter("tableId");
		dto = dao.getAMember(tableId);
	%>
	
	
<%if(userId!=null){ %>
		<h1>개인 정보</h1>
		<table align="center">
		<tr>
			<th>아이디</th>
			<td><%=dto.getId() %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=dto.getPwd() %></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getAddr() %></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getTel() %></td>
		</tr>
<%if(tableId.equals(userId)){ %>
		<tr>
			<td><input type="button" value="수정" onclick="location.href='modifyInfo.jsp?tableId=<%=tableId%>'"></td>
			<td><input type="button" value="삭제" onclick="location.href='delete.jsp?tableId=<%=tableId%>'"></td>
		</tr>
<%} %>
		</table>
<%} else{ %>  
	<script type="text/javascript">
		alert("잘못된 접근입니다");
		location.href = "login.jsp";
	</script>
		  


<%} %>

</body>
</html>