<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#fileDownload.jsp<br>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="fileDownload" class="file.FildDownload" />
<%--request, response객체 변수에 담기 --%>
<c:set var="req" value="<%=request %>" />
<c:set var="res" value="<%=response %>" />

<%--위에서 만들었던 메소드 실행해보자 --%>
${fileDownload.fileDown(req,res)}


</body>
</html>