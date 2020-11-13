<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REGISTER FORM</title>


</head>
<body>
<script src="../jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	
	function loginFormChk(){
		
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
			loginForm.submit()
		}
		

		
	}

	
</script>




<form id="loginForm" action="chkRegister.jsp" method="post">
	<input type="text" name="id" id="id" placeholder="아이디">(*필수항목)<br>
	<input type="password" name="pwd" id ="pwd" placeholder="비밀번호"><br>
	<input type="password" name="pwdChk" id="pwdChk" placeholder="비밀번호 확인">
		<label id="chk">(*필수항목)</label><br>
	
	<input type="text" name="name" id="name" placeholder="이름"><br>
	<input type="text" name="addr" id="addr" placeholder="주소"><br>
	<input type="text" name="tel" id="tel" placeholder="전화번호"><br>
	<input type="button" value="회원가입" onclick="loginFormChk()">
</form>







</body>
</html>