<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
		
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String sql = "update members set pwd=?,name=?,addr=?,tel=? where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(5, request.getParameter("id"));
		pstmt.setString(1, request.getParameter("pwd"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("addr"));
		pstmt.setString(4, request.getParameter("tel"));
		
		pstmt.executeUpdate();

	%>




</body>
</html>