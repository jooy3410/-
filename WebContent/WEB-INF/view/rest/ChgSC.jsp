<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.dto.RestDTO"%>
<%@ page import="poly.dto.SelfCheckDTO"%>
<%@ page import="poly.util.CmmUtil"%>
<%
	SelfCheckDTO r2DTO = (SelfCheckDTO) request.getAttribute("r2DTO");
	String safety_restrnt_no = CmmUtil.nvl((String) request.getAttribute("safety_restrnt_no"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가점검표 업데이트</title>

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

.container22 {
    width: 880px;
    position: relative;
    margin: 0 auto;
    }
 
.form-group22 {
    overflow: hidden;
    margin-bottom: 0px;
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


	<form name="f" method="post" action="/rest/updCheck.do" id="submit">
		<div class="main">
        <section class="signup">
        <div class="container22">
		<h2 class="form-title">자가점검표 업데이트</h2>
		
		
		<div class="table">
<!--##################################################################-->
        <div class="row m-1 pt-1">
            <div class="col-3 text-center"><b>점검항목</b></div>
            <div class="col-9 text-center"><b>점검결과 (세가지 중 해당에 체크)</b></div>
         </div>
<hr>
<!--##################################################################-->
         <div class="row m-1 pt-1">
            <div class="col-3 text-center"><b>(밀폐도) 건물 외부 공기로<br>자연환기가 가능한가?
            </b></div>
            <div class="col-2 text-center"><b>창문 출입문 통해<br>상시 환기 가능
            </b></div>
            <div class="col-1 text-center"><b><input type="radio" name="air" value="low"<%if(CmmUtil.nvl(r2DTO.getAir()).equals("low")){ %>checked<%} %>></b></div>
            <div class="col-2 text-center"><b>창문 출입문 통해<br>일 2회 이상<br>환기 가능
            </b></div>

            <div class="col-1 text-center"><b><input type="radio" name="air" value="middle"<%if(CmmUtil.nvl(r2DTO.getAir()).equals("middle")){ %>checked<%} %>></b></div>
            
<div class="col-2 text-center"><b>창문 출입문 통해<br>환기 불가<br>(지하에 위치 등)
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="air" value="high"<%if(CmmUtil.nvl(r2DTO.getAir()).equals("high")){ %>checked<%} %>>
</b></div>
</div>
<hr>



<!--#######################################-->
         

<div class="row m-1 pt-1">
            
<div class="col-3 text-center"><b>(밀집도) 이용자간 거리두기가<br>가능한가?
</b></div>
            
<div class="col-2 text-center"><b>이용자간 항상<br>2m 유지 가능
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="distance" value="low"<%if(CmmUtil.nvl(r2DTO.getDistance()).equals("low")){ %>checked<%} %>>
</b></div>
            
<div class="col-2 text-center"><b>이용자간 1m 이상<br>유지 가능<br>(테이블간, 좌석간)
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="distance" value="middle"<%if(CmmUtil.nvl(r2DTO.getDistance()).equals("middle")){ %>checked<%} %>>
</b></div>


            
<div class="col-2 text-center"><b>이용자간 1m 거리<br>유지 불가<br>(테이블간, 좌석간)
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="distance" value="high"<%if(CmmUtil.nvl(r2DTO.getDistance()).equals("high")){ %>checked<%} %>>
</b></div>

</div>
<hr>

<!--####################################################-->
         

<div class="row m-1 pt-1">
            
<div class="col-3 text-center"><b>(지속도) 이용자의 평균 체류시간은?</b></div>
            
<div class="col-2 text-center"><b>15분 이내</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="time" value="low"<%if(CmmUtil.nvl(r2DTO.getTime()).equals("low")){ %>checked<%} %>>
</b></div>
            
<div class="col-2 text-center"><b>1시간 이내
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="time" value="middle"<%if(CmmUtil.nvl(r2DTO.getTime()).equals("middle")){ %>checked<%} %>>
</b></div>
            
<div class="col-2 text-center"><b>1시간 이상
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="time" value="high"<%if(CmmUtil.nvl(r2DTO.getTime()).equals("high")){ %>checked<%} %>>
</b></div>
         
</div>
<hr>
         
<!--#######################################################-->
            
<div class="row m-1 pt-1">

<div class="col-3 text-center"><b>(군집도) 시설 내 동시 이용<br>인원의 규모는?
</b></div>

            
<div class="col-2 text-center"><b>10명 미만</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="scale" value="low"<%if(CmmUtil.nvl(r2DTO.getScale()).equals("low")){ %>checked<%} %>>
</b></div>
           
<div class="col-2 text-center"><b>10명 이상<br>100명 미만
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="scale" value="middle"<%if(CmmUtil.nvl(r2DTO.getScale()).equals("middle")){ %>checked<%} %>>
</b></div>
            
<div class="col-2 text-center"><b>100명 이상
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="scale" value="high"<%if(CmmUtil.nvl(r2DTO.getScale()).equals("high")){ %>checked<%} %>>
</b></div>
        

</div>
<hr>

<!--#########################################################-->
         
<div class="row m-1 pt-1">
            
<div class="col-3 text-center"><b>(활동도) 침방울(비말) 발생정도는<br>어떠한가?
</b></div>
            
<div class="col-2 text-center"><b>침방울 발생<br>정도 거의<br>없음
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="activity" value="low"<%if(CmmUtil.nvl(r2DTO.getActivity()).equals("low")){ %>checked<%} %>>
</b></div>
            
<div class="col-2 text-center"><b>일상적 대화<br>수준의 침방울<br>발생
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="activity" value="middle"<%if(CmmUtil.nvl(r2DTO.getActivity()).equals("middle")){ %>checked<%} %>>
</b></div>
            
<div class="col-2 text-center"><b>적극적 침방울 발생<br>(노래, 춤, 격한<br>운동, 응원 등)
</b></div>
            
<div class="col-1 text-center"><b><input type="radio" name="activity" value="high"<%if(CmmUtil.nvl(r2DTO.getActivity()).equals("high")){ %>checked<%} %>>
</b></div>
         
</div>
<hr>



<!--#########################################-->
         

<div class="row m-1 pt-1">
            
<div class="col-12 text-center"><b>(관리도) 방열 수칙 준수 정도는? (아래 항목에 체크)
</b></div>
         
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
                     
<div class="col-1 text-center"><b><input type="radio" name="manager" value="a"<%if(CmmUtil.nvl(r2DTO.getManager()).equals("a")){ %>checked<%} %>>
</b></div>
                     
<div class="col-1 text-center"><b><input type="radio" name="manager" value="an"<%if(CmmUtil.nvl(r2DTO.getManager()).equals("an")){ %>checked<%} %>>
</b></div>
                     
<div class="col-10 text-center"><b>방역관리자를 지정하고, 방역지침을 마련하였는가?<span class=font-style>(유증상자 확진자 발생시 대응체계 등 포함)</span>
</b></div>
                  
</div>
<hr>

<!--################################################################-->

                  
<div class="row m-1 pt-1">
                     
<div class="col-1 text-center"><b><input type="radio" name="hdisinfectant" value="a"<%if(CmmUtil.nvl(r2DTO.getHdisinfectant()).equals("a")){ %>checked<%} %>>
</b></div>
                     
<div class="col-1 text-center"><b><input type="radio" name="hdisinfectant" value="an"<%if(CmmUtil.nvl(r2DTO.getHdisinfectant()).equals("an")){ %>checked<%} %>>
</b></div>
                     
<div class="col-10 text-center"><b>화장실 외, 손위생 시설<span class=font-style>(세수대의 비누)</span> 또는 손 소독제가 비치되어 있는가?
</b></div>
                  
</div>
<hr>

<!--################################################################-->
                  
<div class="row m-1 pt-1">
                     
<div class="col-1 text-center"><b><input type="radio" name="mask" value="a"<%if(CmmUtil.nvl(r2DTO.getMask()).equals("a")){ %>checked<%} %>></b></div>
                    
<div class="col-1 text-center"><b><input type="radio" name="mask" value="an"<%if(CmmUtil.nvl(r2DTO.getMask()).equals("an")){ %>checked<%} %>></b></div>
                     
<div class="col-10 text-center"><b>직원은 마스크를 지속 착용하는가?</b></div>
                  
</div>
<hr>

<!--################################################################-->
                  


<div class="row m-1 pt-1">
                     
<div class="col-1 text-center"><b><input type="radio" name="announcement" value="a"<%if(CmmUtil.nvl(r2DTO.getAnnouncement()).equals("a")){ %>checked<%} %>>
</b></div>
                     
<div class="col-1 text-center"><b><input type="radio" name="announcement" value="an"<%if(CmmUtil.nvl(r2DTO.getAnnouncement()).equals("an")){ %>checked<%} %>>
</b></div>
                     
<div class="col-10 text-center"><b>이용자가 마스크를 지속 착용하도록 안내하고 독려하는가? <span class=font-style>(안내문 게시 등)</span>
</b></div>
                  
</div>
<hr>

<!--################################################################-->
                  


<div class="row m-1 pt-1">
                     
<div class="col-1 text-center"><b><input type="radio" name="disinfection" value="a"<%if(CmmUtil.nvl(r2DTO.getDisinfection()).equals("a")){ %>checked<%} %>>
</b></div>
                     
<div class="col-1 text-center"><b><input type="radio" name="disinfection" value="an"<%if(CmmUtil.nvl(r2DTO.getDisinfection()).equals("an")){ %>checked<%} %>>
</b></div>
                     
<div class="col-10 text-center"><b>자주 손이 닿는 곳<span class=font-style>(손잡이, 문고리, 팔걸이 등)</span>과 화장실의 표면은 매일 1회 이상 소독하는가?
</b></div>
                  
</div>
<hr>
<!--################################################################-->
                  


<div class="row m-1 pt-1">
                     
<div class="col-1 text-center"><b><input type="radio" name="namecheck" value="a"<%if(CmmUtil.nvl(r2DTO.getNamecheck()).equals("a")){ %>checked<%} %>>
</b></div>
                     
<div class="col-1 text-center"><b><input type="radio" name="namecheck" value="an"<%if(CmmUtil.nvl(r2DTO.getNamecheck()).equals("an")){ %>checked<%} %>>
</b></div>
                     
<div class="col-10 text-center"><b><span class=font-style>(행정명령 해당 시설만)</span>이용자 명부작성 및 코로나19 증상을 확인하고 있는가?
</b></div>
                  
</div>
<hr>

<!--################################################################-->
               
</div>
		<br>
		<input type="text" style="display: none;" name="safety_restrnt_no"
			id="safety_restrnt_no" value="<%=safety_restrnt_no%>" readonly>
		<input type="submit" value="수정하기" class="form-submit">
		</div>
		</section>
		</div>
	</form>
</body>
</html>