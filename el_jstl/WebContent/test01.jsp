<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	/(div), %(mod), ==(eq), !=(ne), <(lt), >(gt), <=(le), >=(ge)
	||(or), &&(and), !(not)
<hr>	
	<!--  ${5 / 2 } => ${ 5 div 2 }-->
<hr>
	
	${5+2 }<br>
	${5==2 }


<hr>
	정수형 : ${ 10 }<br>
	실수형 : ${ 10.123 }<br>
	논리형 : ${true}<br>
	null : ${null }<br>
	<%String s = null; %>
	<hr>
	null =>	<%= s %><br>
	null => ${s }
	
	
<hr>
	${ "el 표현" }<br>
	<%out.print("스크립트릿 표현"); %><br>
	<%="표현식" %>


</body>
</html>