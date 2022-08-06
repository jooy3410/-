<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
	String certNumber = CmmUtil.nvl((String)request.getAttribute("certNumber"));
	String user_num = CmmUtil.nvl((String)request.getAttribute("user_num"));
	String user_id = CmmUtil.nvl((String)request.getAttribute("user_id"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 메일 발송</title>

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
         <h3>e-mail로 보낸 인증번호를 확인해주세요.</h3>
      </div>
      <br/>
   </div>
	
	
	<div class="container">
		<div class="signup-content">
			<form method="post" name="f" action="/safe/passChg.do" onsubmit="return certCheck(this);">
				<input type="text" name="user_num" style="display:none" value="<%=user_num %>" readonly>
				<input type="text" name="user_id" style="display:none" value="<%=user_id %>" readonly>
				<div class="form-group">
					<input type="text" name="certNumber" class="form-input" placeholder="인증번호를 입력하세요">
				</div> 
				<div class="form-group">
					<input type="submit"
						name="submit" class="form-submit" value="다음단계" />
				</div>
			</form>
		</div>
	</div>

</body>
<script>
	function certCheck(f){
		if (f.certNumber.value == "") {
			alert("인증번호를 입력하세요.");
			f.certNumber.focus();
			return false;
		} 
		if(f.certNumber.value != "<%=certNumber%>"){
			alert("인증번호가 맞지 않습니다.");
			f.certNumber.focus();
			return false;
		}
	}
</script>
</html>