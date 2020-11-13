<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 정보 수정 및 삭제</h1>
	<%
		
	
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url, id, pwd);
		
		
		String sql = "select * from members where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		String userId = (String)session.getAttribute("userId");
		pstmt.setString(1, userId);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		if(rs.next()){
	%>

<form action="modifyInfo.jsp" method="post">

	<table>
		<tr><td align="right">아이디:</td> 
		<td><input type="text" name = "id" value="<%=userId%>" readonly></td></tr>
		<tr><td align="right">비밀번호:</td>
			<td><input type="text" name = "pwd" value="<%=rs.getString("pwd")%>"></tr>
		<tr><td align="right">이름:</td>
			<td><input type="text" name="name" value="<%=rs.getString("name")%>"></td></tr>
		<tr><td align="right">주소:</td>
			<td><input type="text" name="addr" value="<%=rs.getString("addr")%>"></td></tr>
		<tr><td align="right">전화번호:</td>
			<td><input type="text" name="tel" value="<%=rs.getString("tel")%>"></td></tr>
	</table>

<input type="submit" value="수정">
<input type="button" value="삭제" onclick="location.href='delete.jsp'">
</form>





<%} 
		
		
		rs.close();pstmt.close();con.close();

%>
<script type="text/javascript">




</script>



</body>
</html>