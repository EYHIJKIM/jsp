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
		flag2 = false;
		msg = "perfect"
		//필수입력 사항들 확인
		if($("#id").val()==""){
			alert("아이디는 필수 입력 사항입니다.")
			$("#id").focus()
			
		}else if($("#pwd").val()==""){
			alert("비밀번호는 필수 입력 사항입니다.")
			$("#pwd").focus()
			
		} else{
			
			if($("#pwd").val()==$("#pwdChk").val()){
				$("#chk").text("일치!")
				flag = true;
			} else{
				$("#chk").text("불일치!")
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