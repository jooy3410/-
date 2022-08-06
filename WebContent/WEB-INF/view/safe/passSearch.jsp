<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<link rel="stylesheet" href="../css/style.css">
<script src="https://kit.fontawesome.com/54d6336788.js"
	crossorigin="anonymous"></script>
	
<style>
.navbar-icon {
	color: black;
	font-weight: 700;
	font-size: 27px;
	text-transform: uppercase;
	letter-spacing: 1px;
	line-height: 1;
}

.navbar-icon i {
	color: #167ce9;
	font-size: 30px;
}

h3 {
    width: 630px;
}
</style>

<!-- Font Icon -->
<link rel="stylesheet"
	href="../fonts1/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="../css1/style.css">

</head>

<body>

	<!--메인 로고 자리-->

	<div class="container" align="center">
		<div class="form-group">
			<a class="navbar-icon" href="/index.do"><i
				class="fas fa-utensils"></i>&nbsp;안심식당 <br></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation"></button>
		</div>
	</div>
	
	<div class="container">
	<br>
	<div class="text-center">
			<h3>비밀번호가 기억나지 않아 답답하셨나요?<br>
			아이디를 입력하시면, 해결방법을 알려드릴게요.</h3>
		</div>
		<br/>
	</div>
	
	<div class="container">
		<div class="signup-content">
			<form name="f" action="/safe/passCert.do" method="post" onsubmit="return radioCheck(this);">
				
				<div class="form-group text-right"> 사업자
				<input type="radio" id="2" name="UserKind" value="1">&nbsp; 개인회원 
				<input type="radio" id="2" name="UserKind" value="2">
				</div>
				<div class="form-group">
					<input type="text" class="form-input" name="user_id" placeholder="아이디를 입력하세요">
				</div>
				
				<div class="form-group">
					<input type="submit" name="submit" class="form-submit" value="다음단계" />
				</div>
				
			</form>
		</div>
	</div>	
			
	<script>
	function radioCheck(f){
		if (f.user_id.value == "") {
			alert("아이디를 입력하세요.");
			f.user_id.focus();
			return false;
		}
		if($('input:radio[name=UserKind]').is(':checked') == false){
			alert("회원유형을 선택해주세요")
			return false;
		}
	}
	</script>
	<script src="../js/jquery-3.5.1.min.js"></script>
</body>
</html>