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
	<H3>저희 사이트에 방문해 주셔서 감사합니다.</H3>



	<%
		Cookie[] cookies = request.getCookies();
	
	//chk가 존재하지 않을 경우에만 팝업창을 띄운다.
	if(cookies !=null){
		for(Cookie c : cookies){
			if(c.getName().equals("chkTrue")){	
				break;
				
			}else{	
				%>
				<script type="text/javascript">
					window.open("quiz03_ck_popup.jsp","",
							"width=500, height=500, top=500, left=500");
				</script>
				<%	
				
			}
		
		}
		}
		
		
	
	%>
	

</body>
</html>