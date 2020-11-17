<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>#list.jsp<br>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:useBean id="dao" class="board.BoardDAO"/>
<div align="center" >


<table border="1">
	<caption><font size="6">게 시 판</font></caption>
	<tr>
		<th>번호</th> <th>이름</th> <th>제목</th>
		<th>날짜</th> <th>조회수</th> <th>groupId</th>
		<th>step</th> <th>indent</th>
	</tr>
	<%--포이치로 list 테이블에 담기 --%>
	<c:forEach var="dto" items="${dao.list() }">
		<tr>
			<td>${dto.id }</td> <td>${dto.name }</td>
			
				<td>
					<%--indent가 0이면 동작 안함. 1이라면 동작을 한다
					 --%>
					<c:forEach begin="1" end="${dto.indent }">-></c:forEach>
					
				<%--게시글 제목에 링크걸기 --%>
				<a href="content_view.jsp?id=${dto.id }">${dto.title }</a>
				</td>
			
			<td>${dto.savedate }</td>
			<td>${dto.hit }</td>
			<td>${dto.idgroup }</td>
			<td>${dto.step }</td>
			<td>${dto.indent }</td>	
		</tr>
	</c:forEach>
	<tr>
		<td colspan="8"><a href="write_view.jsp">글작성</a></td>
	</tr>

</table>

</div>




</body>
</html>