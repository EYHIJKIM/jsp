<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="color:skyblue;">CARE LAB</h1>
	<H3>안녕하세요</H3>
	
	<%
		boolean bool = false;
	
		Cookie cookie = new Cookie("testCookie", "myCookie");
		cookie.setMaxAge(5);
		

		
		//페이지를 요청한 사용자에게 보낼 response에 만든 쿠키를 추가하는 코드
		response.addCookie(cookie);
		Cookie[] cookieArr = request.getCookies();
		
		if(cookieArr !=null){
			for(Cookie c : cookieArr){
				out.print("name : "+c.getName()+"<br>");
				out.print("value : "+c.getValue()+"<hr>");
				if(c.getName().equals("testCookie")){
					bool=true;
				}
			}
		}
	%>
	
	<%if(bool == false){ %>
	<script type="text/javascript">
		window.open("popup.jsp", "",
				"width=300,height=200,top=500,left=500");

	</script>
	<%} %>
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>