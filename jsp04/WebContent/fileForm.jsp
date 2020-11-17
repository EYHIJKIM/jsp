<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#fileForm.jsp<br>
	<form action="fileUpload.jsp" method="post"
		enctype="multipart/form-data">
		파일 : <input type="file" name="file"><br>
		<input type="submit" value="업로드">
	</form>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% String path = application.getRealPath("fileUpDown"); %>
<c:set var="realPath" value="<%=path %>" />
<c:set var="req" value="<%=request %>"/>
<jsp:useBean id="filedown" class="file.FildDownload"/>
<c:forEach var="fileName" items="${filedown.fileList(realPath,req) }">
	<a href="fileDownload.jsp?fileName=${fileName }">${fileName }</a><br>
</c:forEach>




	<%--
		String saveDir = application.getRealPath("fileUpDown");
		File dir = new File(saveDir);
		String fName[] = dir.list(); //해당경로의 파일 이름들(목록)
		for(String s: fName){
			out.print(s+"<br>");
		}
	--%>





</body>
</html>