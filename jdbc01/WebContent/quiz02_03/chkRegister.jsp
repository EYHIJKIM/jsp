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

<h1>안녕</h1>
	<%
	//db랑 연결
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id="jsp", pwd = "1234";
			Connection con = DriverManager.getConnection(url,id,pwd);
			
			
			
			String sql = "select id from members where id = ?";
			PreparedStatement pstmt1 = con.prepareStatement(sql);
			pstmt1.setString(1, request.getParameter("id"));	
			
			ResultSet rs = pstmt1.executeQuery();
			
			if(!rs.next()){
				String sql2 = "insert into members values(?,?,?,?,?)";
				Connection con2 = DriverManager.getConnection(url,id,pwd);
				PreparedStatement ps = con2.prepareStatement(sql2);
				ps.setString(1, request.getParameter("id"));
				ps.setString(2, request.getParameter("pwd"));
				ps.setString(3, request.getParameter("name"));
				ps.setString(4, request.getParameter("addr"));
				ps.setString(5, request.getParameter("tel"));
				
				ps.executeUpdate();
			%>
			<script type="text/javascript">
				alert("회원가입을 환영합니다!")
				location.href="login.jsp"			
			</script>
			<%}	else{%>
	
					<script type="text/javascript">
						alert("아이디가 중복되었습니다.")
						location.href="register.jsp"			
					</script>
		
			<%}%>

			
			
			
			
		


</body>
</html>