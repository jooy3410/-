<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.SafeDTO"%>
<%@ page import="poly.dto.NUserInfoDTO"%>
<%@ page import="poly.util.EncryptUtil"%>
<%
	String user_num = CmmUtil.nvl((String) request.getAttribute("user_num"));
	SafeDTO rDTO = (SafeDTO) request.getAttribute("rDTO");
	NUserInfoDTO r2DTO = (NUserInfoDTO) request.getAttribute("r2DTO");
	String res = (String) request.getAttribute("res");
	String password = CmmUtil.nvl((String) request.getAttribute("password"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>

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
    <link rel="stylesheet" href="../fonts1/material-icon/css/material-design-iconic-font.min.css">

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
				aria-expanded="false" aria-label="Toggle navigation">
				</button></div></div>
				
			<script type="text/javascript">
				
			<%if (res.length() != 1) {%>
				alert("비밀번호가 맞지 않습니다.");
			<%}%>
				
			</script>

			<!-- 비밀번호 확인 -->
			<%
				if (res.compareTo("1") != 0) {
			%>
			
						<div class="container">
						<div class="signup-content">
							<form name="f" action="/safe/ChgUserInfo.do?res=<%=res%>"
								method="post" onsubmit="return doRequestURL(this);">

								<div class="form-group">
									<input type="password" class="form-input" name="passwordC"
										placeholder="비밀번호를 입력해주세요."><br><br> <input type="submit" name="submit"
										class="form-submit" value="제출" />
								</div>
							</form>
							<%
								}
							%>

						</div>
					</div>

	<!-- 비밀번호 확인 끝-->

	<!-- 사업자 회원정보 수정 -->
	<%
		if (res.equals("1") && user_num.equals("1")) {
	%>
	<form name="f" action="/safe/chgUserInfo.do" method="post"
		onsubmit="return doRegUserCheck(this);">
		<div class="main">
        <section class="signup">
        <div class="container">
        <div class="signup-content">
		<h2 class="form-title">사업자 회원 정보 수정</h2>

		<div class="form-group">
			<input type="text" class="form-input" name="user_id"
				value="<%=CmmUtil.nvl(rDTO.getUser_id())%>" placeholder="아이디"
				readonly />
		</div>


		<div class="form-group">
			<input type="text" class="form-input" name="user_name"
				value="<%=CmmUtil.nvl(rDTO.getUser_name())%>" placeholder="이름"
				readonly />
		</div>

		<div class="form-group">
			<input type="password" class="form-input" name="password"
				placeholder="비밀번호" /> <span toggle="#password"
				class="zmdi zmdi-eye field-icon toggle-password"></span>
		</div>



		<div class="form-group">
			<input type="password" class="form-input" name="password2"
				placeholder="비밀번호 확인" /> <span toggle="#password"
				class="zmdi zmdi-eye field-icon toggle-password"></span>
		</div>



		<div class="form-group">
			<input type="email" class="form-input" name="email"
				value="<%=EncryptUtil.decAES128CBC((CmmUtil.nvl(rDTO.getEmail())))%>"
				placeholder="Email" />
		</div>


		<div class="form-group">
			<input type="text" class="form-input" name="addr1"
				value="<%=CmmUtil.nvl(rDTO.getAddr1())%>" placeholder="주소" />
		</div>



		<div class="form-group">
			<input type="text" class="form-input" name="addr2"
				value="<%=CmmUtil.nvl(rDTO.getAddr2())%>" placeholder="상세주소" />
		</div>

		<div class="form-group">
			<input type="text" class="form-input" name="safety_restrnt_no"
				value="<%=CmmUtil.nvl(rDTO.getSafety_restrnt_no())%>"
				placeholder="안심식당 번호" readonly />
		</div>

		<div class="form-group">
			<input type="text" class="form-input" name="storename"
				value="<%=CmmUtil.nvl(rDTO.getStorename())%>" placeholder="상호명"
				readonly />
		</div>



		<div class="form-group">
			<input type="text" class="form-input" name="bnumber"
				value="<%=CmmUtil.nvl(rDTO.getBnumber())%>" placeholder="사업자번호"
				readonly />
		</div>






		<div class="form-group">
			<input type="text" class="form-input" name="pnumber"
				value="<%=CmmUtil.nvl(rDTO.getPnumber())%>" placeholder="휴대전화" />
		</div>




		<div class="form-group">
			<input type="submit" name="submit" class="form-submit"
				value="수정하기" />



		</div>
		
		</div>
		</div>
		</section>
		</div>
	</form>
	<%
		}
	%>
	<!-- 사업자 회원정보 수정 끝! -->

	<!-- 개인 회원정보 수정 -->
	<%
		if (res.equals("1") && user_num.equals("2")) {
	%>
	<form name="f" action="/safe/chgUserInfo.do" method="post"
		onsubmit="return doRegUserCheck(this);">
		<div class="main">
        <section class="signup">
        <div class="container">
        <div class="signup-content">
		<h2 class="form-title">개인 회원 정보 수정</h2>

		<div class="form-group">
			<input type="text" class="form-input" name="user_id"
				value="<%=CmmUtil.nvl(r2DTO.getUser_id())%>" placeholder="아이디"
				readonly />
		</div>


		<div class="form-group">
			<input type="text" class="form-input" name="user_name"
				value="<%=CmmUtil.nvl(r2DTO.getUser_name())%>" placeholder="이름"
				readonly />
		</div>

		<div class="form-group">
			<input type="password" class="form-input" name="password"
				placeholder="비밀번호" /> <span toggle="#password"
				class="zmdi zmdi-eye field-icon toggle-password"></span>
		</div>



		<div class="form-group">
			<input type="password" class="form-input" name="password2"
				placeholder="비밀번호 확인" /> <span toggle="#password"
				class="zmdi zmdi-eye field-icon toggle-password"></span>
		</div>



		<div class="form-group">
			<input type="email" class="form-input" name="email"
				value="<%=EncryptUtil.decAES128CBC((CmmUtil.nvl(r2DTO.getEmail())))%>"
				placeholder="Email" />
		</div>


		<div class="form-group">
			<input type="text" class="form-input" name="addr1"
				value="<%=CmmUtil.nvl(r2DTO.getAddr1())%>" placeholder="주소" />
		</div>



		<div class="form-group">
			<input type="text" class="form-input" name="addr2"
				value="<%=CmmUtil.nvl(r2DTO.getAddr2())%>" placeholder="상세주소" />
		</div>





		<div class="form-group">
			<input type="text" class="form-input" name="pnumber"
				value="<%=CmmUtil.nvl(r2DTO.getPnumber())%>" placeholder="휴대전화" />
		</div>




		<div class="form-group">
			<input type="submit" name="submit" class="form-submit"
				value="수정하기" />
		</div>
		</div>
		</div>
		</section>
		</div>
	</form>
	<%
		}
	%>
	<!-- 개인 회원정보 수정 -->

	<script type="text/javascript">
		// 회원가입 유효성 체크
		function doRegUserCheck(f) {

			if (f.user_id.value == "") {
				alert("아이디를 입력하세요.");
				f.user_id.focus();
				return false;
			}

			if (f.user_name.value == "") {
				alert("이름을 입력하세요.");
				f.user_name.focus();
				return false;
			}

			if (f.password.value == "") {
				alert("비밀번호를 입력하세요.");
				f.password.focus();
				return false;
			}

			if (f.password2.value == "") {
				alert("비밀번호확인을 입력하세요.");
				f.password2.focus();
				return false;
			}

			if (f.email.value == "") {
				alert("이메일을 입력하세요.");
				f.email.focus();
				return false;
			}

			if (f.addr1.value == "") {
				alert("주소를 입력하세요.");
				f.addr1.focus();
				return false;
			}

			if (f.addr2.value == "") {
				alert("상세주소를 입력하세요.");
				f.addr2.focus();
				return false;
			}

			if (f.user_name.value == "") {
				alert("상호명을 입력하세요.");
				f.user_name.focus();
				return false;
			}

			if (f.user_name.value == "") {
				alert("사업자번호을 입력하세요.");
				f.user_name.focus();
				return false;
			}

			if (f.pnumber.value == "") {
				alert("핸드폰 번호를 입력하세요.");
				f.user_id.focus();
				return false;
			}

		}
	</script>
	<script src="../js/jquery-3.5.1.min.js"></script>
</body>
</html>