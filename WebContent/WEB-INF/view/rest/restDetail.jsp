<%@page import="poly.util.CmmUtil"%>
<%@page import="poly.dto.RestDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	RestDTO rDTO = (RestDTO) request.getAttribute("rDTO");
	String val = CmmUtil.nvl((String)request.getAttribute("val"));
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>안심식당 상세정보</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700"
	rel="stylesheet">

<link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="../css/animate.css">

<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/owl.theme.default.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">

<link rel="stylesheet" href="../css/aos.css">

<link rel="stylesheet" href="../css/ionicons.min.css">

<link rel="stylesheet" href="../css/bootstrap-datepicker.css">
<link rel="stylesheet" href="../css/jquery.timepicker.css">


<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
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
     
    <div class="hero-wrap hero-wrap-2" style="background-image: url('/images/mask_pos.jpg'); background-attachment:fixed;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-8 ftco-animate text-center">
            <p class="breadcrumbs"><span class="mr-2">Safe</a>
            <h1 class="mb-3 bread">안심식당</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
          <div class="col-md-12 mb-4">
            <h2 class="h4 text-center">안심식당 정보</h2>
          </div>
  			 <div>
            <p><span>안심식당 번호 : </span> <%=CmmUtil.nvl(rDTO.getSafety_restrnt_no())%></p>
          	</div>
          	<div>
            <p><span>상호명: </span> <%=CmmUtil.nvl(rDTO.getBizplc_nm())%></p>
          	</div>
          	<div>
            <p><span>업종 상세명: </span> <%=CmmUtil.nvl(rDTO.getIndutype_detail_nm())%></p>
          	</div>
          	<div>
            <p><span>지번 주소: </span> <%=CmmUtil.nvl(rDTO.getRefine_lotno_addr())%></p>
          	</div>
          	<div>
            <p><span>도로명 주소: </span> <%=CmmUtil.nvl(rDTO.getRefine_roadnm_addr())%></p>
          	</div>
          	<div>
            <p><span>상세주소: </span> <%=CmmUtil.nvl(rDTO.getDetail_addr())%></p>
          	</div>
          	<div>
            <p><span>전화번호: </span> <%=CmmUtil.nvl(rDTO.getTelno())%></p>
          	</div>
          </div>
          <div class="col-md-6" id="map"></div>
        </div>
      </div>
    </section>
    <footer class="ftco-footer ftco-bg-dark ftco-section img" >
    </footer>
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=364f61f6129e3a90252ccc45e181031b&libraries=services"></script>
	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('<%=CmmUtil.nvl(rDTO.getRefine_lotno_addr())%>', function(result, status) {
	
// 정상적으로 검색이 완료됐으면 
 if (status === kakao.maps.services.Status.OK) {

    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
   
    var marker = new kakao.maps.Marker({
        map: map,
        position: coords
    });	
    
 // 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
    var iwContent = '<div style="padding:5px;"><%=CmmUtil.nvl(rDTO.getBizplc_nm())%></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
          // 마커 위에 인포윈도우를 표시합니다
          infowindow.open(map, marker);  
    });
								
//지도의 중심을 결과값으로 받은 위치로 이동시킵니다					
 map.setCenter(coords);
 }
						});

		// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);
	</script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>