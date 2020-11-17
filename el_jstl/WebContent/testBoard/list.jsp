<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>#list.jsp<br>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="dao" class="testBoard.BoardDAO"/>
<c:set var="totalPage" value="${dao.getTotalPage()}"/>


<jsp:useBean id="ps" class="testBoard.PageSet" />
${ps.pageSet(param.start)}
<c:set var="listDto" value="${dao.list(ps.startNum,ps.endNum) }" />


<table border="1">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<c:choose>
		<c:when test="${listDto.size() != 0 }">
			<c:forEach var="dto" items="${listDto}">
				<tr>
					<td>${dto.num }</td>
					<td>
						<a href="count.jsp?num=${dto.num }">
							${dto.title }
						</a>
					</td>
					<td>${dto.pdate }</td>
					<td>${dto.count }</td>
				</tr>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr> <th colspan="4">등록된 정보가 없습니다.</th>
		</c:otherwise>
	</c:choose>
	<tr>
		<td colspan="4" align="right">
		
		<%--start에 값 넣어주는 조건문 --%>
		<c:choose>
			<%--만약 start값이 없으면(첫화면) --%>
			<c:when test="${param.start == null }">
				<%--start 값에 1을 넣어줘라 --%>
				<c:set var="start" value="1"/>
			</c:when>
			<c:otherwise>
				<%--아니라면 파라미터 start값을 변수에 넣어준다. --%>
				<c:set var="start" value="${param.start}" />
			</c:otherwise>
		</c:choose>
		
		
		<%--이전버튼 조건 --%>
		<c:choose>
			<%--만약 start가 1보다 크면 --%>
			<c:when test="${start > 1 }">
				<button type="button" onclick=
					"location.href='list.jsp?start=${start-1}'">
					이전
				</button>	<%--이전 버튼을 누르면 start가 -1해서 이동됨 --%>		
			</c:when>
			<c:otherwise>
				<button type="button" disabled>이전</button>
			</c:otherwise>
		</c:choose><%--페이지 조건 끝 --%>

		<c:forEach begin="1" end="${ps.totalNum}" step="1" var="cnt">
			<a href="list.jsp?start=${cnt }">[${cnt}]</a>
		</c:forEach>
		
		
		<%--다음버튼 활성화 조건문 --%>
		<c:choose>
			<%--totalPage보다 start가 작으면 --%>
			<c:when test="${start<totalPage }">
				<%--다음 버튼이 활성화 --%>
				<button type="button" onclick="location.href='list.jsp?start=${start+1}'">
					다음
				</button>			
			</c:when>
			
			<c:otherwise>
				<button type="button" disabled>다음</button>
			</c:otherwise>
		</c:choose>
		
		
		${totalPage}
			<button type="button" onclick="location.href='regForm.jsp'">
			등록</button>
		</td>
	</tr>


</table>





</body>
</html>