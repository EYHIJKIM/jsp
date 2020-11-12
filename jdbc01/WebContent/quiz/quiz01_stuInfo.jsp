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
	<h1>인적 사항</h1>

	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jsp", pwd = "1234";
	Connection con = DriverManager.getConnection(url, id, pwd);
	
	
	String stuId = request.getParameter("stuId");
	String sql = "select * from student where stuId =" + stuId;
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	%>
	
	<%while(rs.next()){ %>
	<h3>
	학번 :<%=stuId %>
	<h3>
	<h3>
	이름: <%=rs.getString("name") %>
	<h3>
	<h3>
	국, 영, 수 : <%=rs.getString("kor")%>,<%=rs.getString("eng")%>,<%=rs.getString("math")%>
	<h3>

	<%} %>
	<input type="button" value="뒤로"
								onclick="location.href='quiz01_dbCon.jsp'">
</body>
</html>