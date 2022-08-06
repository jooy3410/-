<%@page import="poly.dto.BoardDTO"%>
<%@page import="static poly.util.CmmUtil.nvl" %>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    
    BoardDTO rDTO = (BoardDTO)request.getAttribute("rDTO");
    
    String val = CmmUtil.nvl((String)request.getAttribute("val"));
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=nvl(rDTO.getPost_title()) %></title>




<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">


<link rel="stylesheet" href="../css/style.css">

<script src="https://kit.fontawesome.com/54d6336788.js"
	crossorigin="anonymous"></script>


<!-- 왼쪽상단 안심식당 아이콘 스타일 적용 -->
<style>
.navbar-icon {
	color: black;
	font-weight: 700;
	font-size: 22px;
	text-transform: uppercase;
	letter-spacing: 1px;
	line-height: 1;
}

.navbar-icon i {
	color: #167ce9;
	font-size: 30px;
}

.nav-item .dropdown {
	padding-left: 0px;
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
	border-radius: 10px/10px;
}

.dropdown-content a {
	float: none;
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	text-align: center;
	border-radius: 7px/7px;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.nav-item:hover ul {
	display: block;
}
</style>




</head>
<body>




<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<!--메인 로고 자리-->
			<a class="navbar-icon" href="/index.do"><i
				class="fas fa-utensils"></i>&nbsp;안심식당 <br></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="/index.do" class="nav-link">홈</a></li>
					<li class="nav-item"><a href="/notice/noticeList.do"
						class="nav-link">공지사항</a></li>
					<li class="nav-item"><a href="/rest/about.do" class="nav-link">소개</a></li>
					<li class="nav-item"><a href="/rest/restPaging.do"
						class="nav-link">안심식당</a></li>
					<li class="nav-item"><a href="/rest/selfCheckList.do"
						class="nav-link">자가점검표</a></li>
					<li class="nav-item">
						<%
							if (session.getAttribute("SS_USER_NUM") == null) {
							} else {
						%> <a class="nav-link"
						style="margin-top: 0;">마이페이지</a>
						<ul class="dropdown">
							<div class="dropdown-content">
								<a href="/safe/ChgUserInfo.do">회원정보 수정</a>
							</div>
							<%
								if (session.getAttribute("SS_USER_NUM").equals("1") && session.getAttribute("SS_VAL").equals("0")) {
							%><div
								class="dropdown-content">
								<a href="/rest/SelfCheck.do">자가점검표 등록</a>
							</div>
							<%
								}
							%>
							<%
								if (session.getAttribute("SS_USER_NUM").equals("1") && session.getAttribute("SS_VAL").equals("1")) {
							%><div
								class="dropdown-content">
								<a href="/rest/ChgSC.do">자가점검표 변경</a>
							</div>
							<%
								}
							%>
						</ul> <%
 	}
 %>
					</li>
					<li style="margin-top: 12px;" class="nav-item cta">
						<%
							if (session.getAttribute("SS_USER_NUM") == null) {
								out.println("<a href='/safe/Login.do'>로그인</a>");
							} else {
								out.println("<a href='/safe/logout.do'>로그아웃</a>");
							}
						%>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->




<!-- 빈공간 -->
<div class="main" style="margin-top: 100px;"></div>


<div style="width: 60%; margin: auto;">


	<h4><%=nvl(rDTO.getPost_title()) %></h4>
	
	<hr>
	<div style="text-align:right;">작성자 : <%=nvl(rDTO.getReg_id()) %></div>
	<div>
		<p><%=nvl(rDTO.getPost_content()) %></p>
	</div>
	<hr>
	<div style="float:left;">
		<button onclick="location.href=' /notice/noticeList.do'">뒤로</button>
	</div>
	
	<%if(session.getAttribute("SS_USER_NUM") != null) {%>
                  <%if(session.getAttribute("SS_USER_NUM").equals("0")) {%>
	<div style="float:right;">
		<button onclick="confirmDelete();">삭제</button>
	</div>
	<div style="float:right;">
		<button onclick="location.href=' /notice/editPost.do?no=<%=rDTO.getPost_no()%>'">편집</button>
	
	
	</div>
	<%} %>
             <%} %>

	<script type="text/javascript">
	function confirmDelete(){
	if(confirm("삭제하시겠습니까?")){
		location.href = "/board/deletePost.do?no=<%=rDTO.getPost_no()%>";
	}
	}
	</script>
	
	
	</div>
	
	
	<!-- 빈공간 -->
<div class="main" style="margin-top: 150px;"></div>


<!-- 빈공간 -->
<div class="main" style="margin-top: 150px;"></div>



	

</body>
</html>