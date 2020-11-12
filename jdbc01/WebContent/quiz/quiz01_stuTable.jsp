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


	<%
		/*

		create user jsp identified by 1234;
		grant dba to jsp;
	
		create table student(
			  학번 varchar2(20),
			  이름 varchar2(20),
			  국어 varchar2(20),
			  영어 varchar2(20),
			  수학 varchar2(20)
			);
	
		insert into student values('1','김영희','100','100','100');
		insert into student values('2','홍길동','10','13','15');
		insert into student values('3','박희자','65','26','55');
		
		
		
		
		
		
		
		*/
		
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id="jsp", pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		
		String sql = "select * from student";
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();


		
		/*
		while(rs.next()){
			stuId = rs.getString("stuId");
			name = rs.getString("name");
			kor= rs.getString("kor");
			eng = rs.getString("eng");
			math = rs.getString("math");
			
		}
		*/
		
	%>


<table border="1">
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
	</tr>
	
<%while(rs.next()){ %>
	<tr>
		<td><%=rs.getString("stuId")%></td>
		<td><a href="quiz01_stuInfo.jsp?stuId=<%=rs.getString("stuId")%>"><%=rs.getString("name")%></a></td>
		<td><%=rs.getString("kor")%></td>
		<td><%=rs.getString("eng")%></td>
		<td><%=rs.getString("math")%></td>	
	</tr>
<%} %>	

	
</table>

	






















</body>
</html>