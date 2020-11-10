<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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

	<h2>request.getParameterNames()메서드 사용</h2>
	<%
		request.setCharacterEncoding("utf-8");
		Enumeration paraNames = request.getParameterNames();
		String[] namesList={};
		
		
		while(paraNames.hasMoreElements()){

			
			String n = (String)paraNames.nextElement();
			
			if(n.equals("season")){ //체크박스일때
				String[] ss = request.getParameterValues(n);
				for(String s : ss){
					out.print(n+":");
					out.print(s+"<br>");
				}

			//체크박스 아닐때
			} else{
			String v = request.getParameter(n);
				out.print(n+":");
				out.print(v+"<br>");
			}
	
	}%>

</body>
</html>