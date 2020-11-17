<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#reply.jsp<br>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:requestEncoding value="utf-8"/>

<jsp:useBean id="dao" class="board.BoardDAO"/>
<c:set var="dto" value="${dao.reply_view(param.id) }"/>

<h3>답글 등록 페이지</h3>
<div>
	<form action="reply.jsp" method="post">
		<input type="hidden" name="id" value="${dto.id}">
		<input type="hidden" name="idgroup" value="${dto.idgroup}">
		<input type="hidden" name="step" value="${dto.step}">
		<input type="hidden" name="indent" value="${dto.indent}">
		<input type="hidden" name="name" value="${dto.name}">	
		
		<table border="1">
			<tr> 
				<td>번호</td> <td>${dto.id }</td>
			</tr>
			<tr> 
				<td>조회수</td> <td>${dto.hit}</td>
			</tr>
			<tr> 
				<td>이름</td> <td>${dto.name}</td>
			</tr>
			<%--답글을 달 수 있는 제목, 내용(답글입력칸) --%>
			<tr> 
				<td>제목</td>
				<td><input type="text" name="title" value="${dto.title}"></td>
			</tr>
			<tr> 
				<td>내용</td>
				<td><textarea rows="10" name="content"></textarea></td>
			</tr>
			<tr> 
				<td colspan="2">
					<input type="submit" value="답변">&nbsp;&nbsp;
					<a href="list.jsp">목록이동</a>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>