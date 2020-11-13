<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@include file="../default/header.jsp" %>

	<jsp:useBean id="dao" class="members.MemberDAO" />
	<jsp:useBean id="dto" class="members.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />


	<%	

		request.setCharacterEncoding("utf-8");
		//중복 id가 없으면
		if (dao.getAMember(dto.getId()).getId()==null) {
			dao.registerMember(dto);//db에 넣는다.
			%>
			<script type="text/javascript">
				alert("회원가입 완료!")
				location.href="index.jsp";
			</script>
			
		<%} else {
	%>
		<script type="text/javascript">
			alert("중복된 아이디 입니다!")
			location.href="register.jsp"
		</script>

	<%
		}
	%>
	
	
	

</body>
</html>