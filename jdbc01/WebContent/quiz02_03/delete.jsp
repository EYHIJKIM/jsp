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
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String id = "jsp", pwd = "1234";
Connection con = DriverManager.getConnection(url, id, pwd);


String sql = "DELETE FROM members where id = ?";
PreparedStatement pstmt = con.prepareStatement(sql);

String userId = (String)session.getAttribute("userId");
pstmt.setString(1, userId);

pstmt.executeQuery();

session.invalidate();


%>
	<script type="text/javascript">
		alert("삭제 완료!")
		location.href="login.jsp"
	</script>
</body>
</html>