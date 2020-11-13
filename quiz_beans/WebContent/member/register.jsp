<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script src="../jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	function regiFormChk(){
		
		flag = false;
		//필수입력 사항들 확인
		
		inputId = $("#id").val()
		inputPw = $("#pwd").val()
		inputPwChk = $("#pwdChk").val()
		
		//id텍스트창이 비어있으면
		if(inputId==""){
			alert("아이디는 필수 입력 사항입니다.")
			$("#id").focus()
			
		//비밀번호 텍스트창이 비어있으면
		}else if(inputPw==""){
			alert("비밀번호는 필수 입력 사항입니다.")
			$("#pwd").focus()
		
		//필수사항을 다 입력했다면
		} else{
			//비밀번호-비번확인이 똑같은지 확인.
			if(inputPw==inputPwChk){
				$("#chk").text("일치!")
				flag = true;
			} else{
				$("#chk").text("불일치!").
				flag = false;
			}
		}
			
		
		console.log(flag)
		if(flag){
			registerForm.submit()
		}

		
	}

</script>

<form id="registerForm" action="regChk.jsp" method="post">
	아이디 <input type="text" id="id" name="id">(*필수사항)<br>
	비밀번호 <input type="password" id="pwd" name="pwd">(*필수사항)<br>
	비밀번호확인 <input type="password" id="pwdChk">
		<label id="chk"></label>
	<br>
	
	이름 <input type="text" name="name"><br>
	주소 <input type="text" name="addr"><br>
	전화번호 <input type="text" name="tel"><br>
	<input type="button" value="회원가입" onclick="regiFormChk()">
</form>



</body>
</html>