<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%--
		int num = 123;
		System.out.print(num);
		out.print(num);
	--%>
	
	<hr>
	
	<br><br>
	<!--  <% String word = "JSP"; %> -->
	<h1><%=word %> 시작입니다</h1>
	<h1><% out.print(word); %> 끝입니다</h1>
		<%= word %>
	
	<hr>
	
	<%="자바 명령어로 덧셈 연산" %>
	<br>
	<%
		int a=20;
		int b=10;
		int sum = a+b;
	%>
	<%=a %>+<%=b %>=<%=a+b%>
	<br>
	<%=a+ "+" +b+ "=" +sum %>
	<hr>
	주소 : <input type="text" value="<%="노량진" %>">
	
	<hr>
	
	<%
		int OSum=0;
		int ESum=0;
		for(int i=1;i<101;i++){
			if(i%2==0){ESum+=i;}
			else{OSum+=i;}
		}
	%>
	
	1+2+3+....+100 = <%=OSum+ESum %><br>
	1~100까지의 짝수의 합 : <%=ESum %><br>
	1~100까지의 홀수의 합 : <%=OSum %><br>

	<hr>
	<% int cnt01 =0;%>
	<%=cnt01++%>
	
	
</body>
</html>