<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		#result01.jsp<br>
	<%
	request.setCharacterEncoding("utf-8");
	
	
	Enumeration paramEnum = request.getParameterNames();
	while(paramEnum.hasMoreElements()){
		String n = (String)paramEnum.nextElement();
		out.print(n+"<br>");
	}
	
	
	
	
	
	
	String[] chk = request.getParameterValues("chk");
	
	//chk배열에 체크박스 값을 하나씩 넣어줌
	if(chk!=null){
		for(int i=0;i<chk.length;i++){
			
			//out은 화면에 띄우는 것이므로 오류로그는 콘솔(sysout)로 표현해야 함.
			//out.print(chk[i]);
			System.out.print(chk);
		}
	
	//포이치문으로도 가능
		out.print("<hr>");
		for(String s: chk){
			out.print(s);
		}
	} else{%>
		<table border='1'>
			<tr><th>값 없음</th></tr>
		</table>
	<% }%>
		

</body











>
</html>