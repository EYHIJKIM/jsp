<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
	/*
	
		create table members(
		id varchar2(20) primary key,
		pwd varchar2(20),
		name varchar2(20),
		addr varchar2(100),
		tel varchar2(15)
		);
		
		
		insert into members values('111','111','김영희','강남','01011111111');
		insert into members values('222','222','길동','산골짜기','01022222222');
		insert into members values('333','333','두두','LA','01033333333');
		
		commit;

	*/
	
	
	//db랑 연결
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		
		
		String sql = "select * from members where id = ?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");

		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		//id가 존재하면
		if(rs.next()){
			if(userPwd.equals(rs.getString("pwd"))){
				session.setAttribute("loginSuc", rs.getString("name"));
				session.setAttribute("userId", rs.getString("id"));
				
				%>
				
				<script type="text/javascript">
					alert('<%=rs.getString("name")%>님 반갑습니다')
					location.href="main.jsp"
				</script>
			
			<% } else{ //비밀번호 틀리면 %>
					<script type="text/javascript">
					alert("비밀번호가 틀렸습니다.!")
					location.href="login.jsp"
				</script>

				<%}
				
		} else{	%>
				<script type="text/javascript">
					alert("해당하는 아이디가 존재하지 않습니다!")
					location.href="login.jsp"
				</script>
				
		<%}%>
			
			
				
					
					
					
				
					
					
			
			






















</body>
</html>