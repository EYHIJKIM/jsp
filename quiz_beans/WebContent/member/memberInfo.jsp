<%@page import="members.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
		
			
		<h1>회원 목록</h1>
		<table border="1" align="center">
				<tr align="center">
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
				</tr>
		<% ArrayList<MemberDTO> members = dao.getMemberList(); 
			for(MemberDTO m : members){
			%>
				<tr>
					<td>
					<a href="memberDetail.jsp?tableId=<%=m.getId()%>">
					<%=m.getName()%></a></td>
					<td><%=m.getAddr() %></td>
					<td><%=m.getTel() %></td>
				</tr>

			<%}%>
	</table>

	<%} else{ %>
		<script type="text/javascript">
			alert("잘못된 접근입니다");
			location.href = "login.jsp";
		</script>
	<%} %>
<jsp:include page="../default/footer.jsp"></jsp:include>
</body>
</html>