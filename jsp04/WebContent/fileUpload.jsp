<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#fileUpload.jsp<br>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String path = application.getRealPath("fileUpDown"); %>
<c:set var="realPath" value="<%=path %>"/>
<c:set var="req" value="<%=request %>"/>
폴더 경로 : ${realPath }<br>
<jsp:useBean id="file" class="file.FileUpload"/>
<c:set var="files" value="${file.fileUpload(realPath,req) }"/>
<hr>
저장될 파일 이름: ${files[0] }<br>
실제 파일 이름: ${files[1] }<br>

<%response.sendRedirect("fileForm.jsp"); %>






</body>
</html>