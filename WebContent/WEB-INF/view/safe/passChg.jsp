<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
	String user_num = CmmUtil.nvl((String)request.getAttribute("user_num"));
	String user_id = CmmUtil.nvl((String)request.getAttribute("user_id"));
%>
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
		<div class="signup-content">
			<form method="post" name="f" action="/safe/passReset.do" onsubmit="return passCheck(this);">
			
				<input type="text" name="user_num" style="display: none" value="<%=user_num%>" readonly> 
				<input type="text" name="user_id" style="display: none" value="<%=user_id%>" readonly>
				<br> 
			
				<div class="form-group">
					<input type="password" class="form-input" name="password"
						placeholder="변경할 비밀번호">
				</div> 
				
				<div class="form-group">
					<input type="password" class="form-input" name="password2"
						placeholder="비밀번호 확인">
				</div> 
				
				<div class="form-group">
					<input type="submit"
						name="submit" class="form-submit" value="다음 단계" />
				</div>
			</form>
		</div>
	</div>
	
	<script>
	function passCheck(f){
		if (f.password.value == "") {
			alert("인증번호를 입력하세요.");
			f.password.focus();
			return false;
		} 
		if (f.password2.value == "") {
			alert("인증번호를 입력하세요.");
			f.password2.focus();
			return false;
		} 
		if(f.password.value != f.password2.value) {
				alert("비밀번호 확인과 일치하지 않습니다.");
				return false;
			}
		}
	</script>
	<script src="../js/jquery-3.5.1.min.js"></script>
</body>
</html>