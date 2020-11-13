<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../jquery-3.5.1.min.js"></script>
	<style type="text/css">

		h1{
			text-align: center;
		}
		h1.title{
			color:#FCDE86;
			font-family: fantasy;
		}
		
		ul li{
			text-decoration: none;
			list-style: none;
			display: inline;
			margin:10px;
		}
		
	</style>
<%
	String path = request.getContextPath(); 
	String userId = (String)session.getAttribute("userId");
	
	//세션이 존재한다면(로그인중이라면)
	if(userId!=null){
%>
	<script type="text/javascript">
		function init(){
			$("#loginTxt").text("로그아웃")
			$("#loginOrLogout").attr("href","<%=path%>/member/logout.jsp")		
		}
	</script>
<%} %>

</head>
<body onload="init()">
<header align="center">
	<h1 class="title">CARE LAB</h1>
	<br>
	<hr>
		<ul align="right">
			<li><a href="<%=path %>/member/index.jsp">HOME</a></li>
			<li><a href="<%=path %>/member/memberInfo.jsp">회원 정보</a>
			<li><a id="loginOrLogout" href="<%=path %>/member/login.jsp">
				<span id="loginTxt">로그인</span>
			</a></li>

		</ul>
	<hr>
	
	
	
</header>
</body>
</html>