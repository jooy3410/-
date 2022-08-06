<%@page import="poly.dto.RestDTO"%>
<%@page import="java.util.List"%>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   String safety_restrnt_no = CmmUtil.nvl((String) request.getAttribute("safety_restrnt_no"));


%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>안심식당 상세정보</title>
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">




<!-- 왼쪽상단 안심식당 아이콘 스타일 적용 -->
<style>

form { 
margin: 0 auto; 
width: 90%;
}
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

.nav-item .dropdown{
	display: none;
	position: absolute;
	background-color: white;
	min-width: 500px;
  	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  	z-index: 1;
}

.nav-item:hover ul{
	
	display: block;
}

</style>

<script type="text/javascript">
      function getSelectValue(f) {
         f.textValue.value = f.selectBox.options[f.selectBox.selectedIndex].text;
         f.optionValue.value = f.selectBox.options[f.selectBox.selectedIndex].value;
      }
   </script>
</head>
<body>



<!-- top -->
<div>
<jsp:include page="/include/top.jsp" flush="true"></jsp:include>
</div>


   <div class="hero-wrap hero-wrap-2"
      style="background-image: url('/images/mask_pos.jpg'); background-attachment: fixed;">
      <div class="overlay"></div>
      <div class="container">
         <div
            class="row no-gutters slider-text align-items-center justify-content-center"
            data-scrollax-parent="true">
            <div class="col-md-8 ftco-animate text-center">
               <p class="breadcrumbs">
                  <span class="mr-2">Safe</span>
                     <h1 class="mb-3 bread">안심식당</h1>
            </div>
         </div>
      </div>
   </div>

   <section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
         <div class="row block-9">
            <form name="f" method="post" action="/rest/selfCheck.do" id="submit">
               <div class="table">
<!--##################################################################-->
<hr>
<div class="row m-1 pt-1">
<div class="col-3 text-center"><b>점검항목</b></div>
<div class="col-9 text-center"><b>점검결과 (세가지 중 해당에 체크)</b></div>
</div>
<hr>
<!--##################################################################-->

<div class="row m-1 pt-1">
<div class="col-3 text-center"><b>(밀폐도) 건물 외부 공기로<br>자연환기가 가능한가?
</b></div>

<div class="col-2 text-center"><b>창문 출입문 통해
<br>상시 환기 가능
</b></div>

<div class="col-1 text-center"><input type="radio" name="air" value="low">
</b></div>

<div class="col-2 text-center"><b>창문 출입문 통해
<br>일 2회 이상
<br>환기 가능
</b></div>

<div class="col-1 text-center"><b>
<input type="radio" name="air" value="middle">
</b></div>

<div class="col-2 text-center"><b>
창문 출입문 통해
<br>환기 불가
<br>(지하에 위치 등)
</b></div>

<div class="col-1 text-center"><b>
<input type="radio" name="air" value="high">
</b></div>

</div>
<hr>



<!--#######################################-->

<div class="row m-1 pt-1">

<div class="col-3 text-center"><b>(밀집도) 이용자간 거리두기가<br>가능한가?
</b></div>

<div class="col-2 text-center"><b>이용자간 항상<br>2m 유지 가능
</b></div>

<div class="col-1 text-center"><input type="radio" name="distance" value="low">
</b></div>

<div class="col-2 text-center"><b>이용자간 1m 이상
<br>유지 가능
<br>(테이블간, 좌석간)
</b></div>

<div class="col-1 text-center"><b><input type="radio" name="distance" value="middle">
</b></div>

<div class="col-2 text-center"><b>이용자간 1m 거리
<br>유지 불가
<br>(테이블간, 좌석간)
</b></div>

<div class="col-1 text-center"><b>
<input type="radio" name="distance" value="high">
</b></div>

</div>
<hr>

<!--####################################################-->
<div class="row m-1 pt-1">

<div class="col-3 text-center"><b>(지속도) 이용자의 평균 체류시간은?</b></div>

<div class="col-2 text-center"><b>15분 이내</b></div>

<div class="col-1 text-center"><input type="radio" name="time" value="low"></b></div>


<div class="col-2 text-center"><b>1시간 이내</b></div>

<div class="col-1 text-center"><b><input type="radio" name="time" value="middle"></b></div>

<div class="col-2 text-center"><b>1시간 이상</b></div>

<div class="col-1 text-center"><b><input type="radio" name="time" value="high"></b></div>

</div>
<hr>

<!--#######################################################-->

<div class="row m-1 pt-1">

<div class="col-3 text-center"><b>(군집도) 시설 내 동시 이용<br>인원의 규모는?
</b></div>

<div class="col-2 text-center"><b>10명 미만</b></div>

<div class="col-1 text-center"><b><input type="radio" name="scale" value="low"></b></div>

<div class="col-2 text-center"><b>10명 이상<br>100명 미만
</b></div>

<div class="col-1 text-center"><b><input type="radio" name="scale" value="middle"></b></div>

<div class="col-2 text-center"><b>100명 이상</b></div>

<div class="col-1 text-center"><b><input type="radio" name="scale" value="high"></b></div>

</div>
<hr>

<!--#########################################################-->
<div class="row m-1 pt-1">


<div class="col-3 text-center"><b>(활동도) 침방울(비말) 발생정도는<br>어떠한가?
</b></div>


<div class="col-2 text-center"><b>침방울 발생<br>정도 거의<br>없음
</b></div>


<div class="col-1 text-center"><b><input type="radio" name="activity" value="low"></b></div>


<div class="col-2 text-center"><b>일상적 대화<br>수준의 침방울<br>발생
</b></div>


<div class="col-1 text-center"><b><input type="radio" name="activity" value="middle"></b></div>


<div class="col-2 text-center"><b>적극적 침방울 발생<br>(노래, 춤, 격한<br>운동, 응원 등)
</b></div>


<div class="col-1 text-center"><b><input type="radio" name="activity" value="high"></b></div>


</div>
<hr>



<!--#########################################-->

<div class="row m-1 pt-1">
<div class="col-12 text-center"><b>(관리도) 방열 수칙 준수 정도는? (아래 항목에 체크)</b></div>
</div>
<hr>

<!--#####################################################-->

<div class="row m-1 pt-1">

<div class="col-1 text-center"><b>준수</b></div>

<div class="col-1 text-center"><b>미준수</b></div>

<div class="col-10 text-center"><b>방역 수칙 항목</b></div>

</div>
<hr>


<!--#########################################################-->

<div class="row m-1 pt-1">

<div class="col-1 text-center"><b><input type="radio" name="manager" value="a"></b></div>

<div class="col-1 text-center"><b><input type="radio" name="manager" value="an"></b></div>

<div class="col-10 text-center"><b>방역관리자를 지정하고, 방역지침을 마련하였는가?<span class=font-style>(유증상자
확진자 발생시 대응체계 등 포함)</span></b></div>
</div>
<hr>

<!--################################################################-->

<div class="row m-1 pt-1">

<div class="col-1 text-center"><b><input type="radio" name="hdisinfectant" value="a"></b></div>

<div class="col-1 text-center"><b><input type="radio" name="hdisinfectant" value="an"></b></div>

<div class="col-10 text-center"><b>화장실 외, 손위생 시설<span class=font-style>(세수대의 비누)</span>
또는 손 소독제가 비치되어 있는가?
</b></div>

</div>
<hr>

<!--################################################################-->

<div class="row m-1 pt-1">


<div class="col-1 text-center"><b><input type="radio" name="mask" value="a"></b></div>

<div class="col-1 text-center"><b><input type="radio" name="mask" value="an"></b></div>

<div class="col-10 text-center"><b>직원은 마스크를 지속 착용하는가?</b></div>

</div>
<hr>

<!--################################################################-->


<div class="row m-1 pt-1">

<div class="col-1 text-center"><b><input type="radio" name="announcement" value="a"></b></div>

<div class="col-1 text-center"><b><input type="radio" name="announcement" value="an"></b></div>

<div class="col-10 text-center"><b>이용자가 마스크를 지속 착용하도록 안내하고 독려하는가? <span
class=font-style>(안내문 게시 등)</span></b></div>

</div>
<hr>

<!--################################################################-->

<div class="row m-1 pt-1">

<div class="col-1 text-center"><b><input type="radio" name="disinfection" value="a"></b></div>

<div class="col-1 text-center"><b><input type="radio" name="disinfection" value="an"></b></div>

<div class="col-10 text-center"><b> 자주 손이 닿는 곳<span class=font-style>(손잡이, 문고리,
팔걸이 등)</span>과 화장실의 표면은 매일 1회 이상 소독하는가?
</b></div>

</div>
<hr>
<!--################################################################-->


<div class="row m-1 pt-1">

<div class="col-1 text-center"><b><input type="radio" name="namecheck" value="a"></b></div>

<div class="col-1 text-center"><b><input type="radio" name="namecheck" value="an"></b></div>

<div class="col-10 text-center"><b><span class=font-style>(행정명령 해당 시설만)</span>이용자 명부작성

및 코로나19 증상을 확인하고 있는가?
</b></div>
</div>
<hr>

<!--################################################################-->


</div>
               <br><input type="text" style="display:none;" name="safety_restrnt_no" id="safety_restrnt_no" value="<%=safety_restrnt_no %>" readonly>
               <input type="submit" value="제출">
            </form>
         </div>
      </div>
   </section>
   
<!-- bottom -->
<div>
<jsp:include page="/include/footer.jsp" flush="true"></jsp:include>
</div>

</body>
</html>