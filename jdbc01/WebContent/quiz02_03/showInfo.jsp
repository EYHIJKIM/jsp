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
		String userId = (String)session.getAttribute("userId");
	
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url, id, pwd);
		
		
		String sql = "select * from members where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		
		ResultSet rs = pstmt.executeQuery();
		
		
		while(rs.next()){
	%>

<form action="modifyInfo.jsp" method="post">
	아이디 : <input type="text" name = "id" value="<%=userId%>" readonly><br>
	비밀번호 : <input type="text" name = "pwd" value="<%=rs.getString("pwd")%>"><br>
	이름 : <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
	주소 : <input type="text" name="addr" value="<%=rs.getString("addr")%>"><br>
	전화번호 : <input type="text" name="tel" value="<%=rs.getString("tel")%>"><br>

<input type="submit" value="수정">
</form>
<input type="button" value="삭제" onclick="location.href='logout.jsp'">




<%} 
		
		
		rs.close();pstmt.close();con.close();

%>
<script type="text/javascript">




</script>



</body>
</html>