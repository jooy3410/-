<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>







<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>로그인 및 회원가입</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="../fonts1/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="../css1/style.css">
<script src="../js/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function doLoginSafeUserCheck(f) {
	var user_id = f.user_id.value;
	var password = f.password.value;
	
	
	if (f.user_id.value == "") {
		alert("아이디를 입력하세요.");
		f.user_id.focus();
		return false;
	}
	if (f.password.value == "") {
		alert("비밀번호를 입력하세요.");
		f.password.focus();
		return false;
	}
	if($('input:radio[name=UserKind]').is(':checked') == false){
		alert("회원유형을 선택해주세요")
		return false;
	}
	if(document.getElementById("1").checked){
		document.f.action = "/safe/getUserSafeLoginCheck.do";
		document.f.submit();
	}
	else if(document.getElementById("2").checked){
		document.f.action = "/safe/getNUserLoginCheck.do";
		document.f.submit();
	}
}
		/* function doLoginSafeUserCheck(f){
			if (f.user_id.value == "") {
				alert("아이디를 입력하세요.");
				f.user_id.focus();
				return false;
			}
			if (f.password.value == "") {
				alert("비밀번호를 입력하세요.");
				f.password.focus();
				return false;
			}
			if(document.getElementById("1").checked){
				document.f.action = "location.href='/safe/getUserSafeLoginCheck.do'";
				document.f.submit();
			}
			else if(document.getElementById("2").checked){
				document.f.action = "location.href='/safe/getUserSafeLoginCheck.do'";
				document.f.submit();
			}
		}) */
	//로그인을 위한 입력정보와 유효성 체크하기
	
</script>

</head>
<body>






	<div class="main">

		<section class="signup">
			<!-- <img src="images/signup-bg.jpg" alt=""> -->
			<div class="container">
				<div class="signup-content">
					<form name="f" method="post"
						id="signup-form"
						class="signup-form" onsubmit="return doLoginSafeUserCheck(this);">
						<h2 class="form-title">로그인</h2>
						사업자 <input type="radio" id="1" name="UserKind" value="1" checked>
						개인회원 <input type="radio" id="2" name="UserKind" value="2">


						<div class="form-group">
							<input type="text" id="user_id" class="form-input" name="user_id"
								placeholder="아이디" />
						</div>




						<div class="form-group">
							<input type="password" id="password" class="form-input" name="password"
								placeholder="비밀번호" /> <span toggle="#password"
								class="zmdi zmdi-eye field-icon toggle-password"></span>
						</div>





						<div class="form-group">
							<input type="submit" class="form-submit" value="LOGIN" />
						</div>



					</form>



					<p class="loginhere">

						<a href="/safe/choice.do" class="loginhere-link">회원가입</a> &nbsp;
						<a href="/safe/passSearch.do" class="loginhere-link">비밀번호 찾기</a>
					</p>
				</div>
			</div>
		</section>

	</div>



	<!-- JS -->
	<script src="../js/jquery-3.5.1.min.js"></script>
	<script src="../vendor1/jquery/jquery.min.js"></script>
	<script src="../js1/main.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>