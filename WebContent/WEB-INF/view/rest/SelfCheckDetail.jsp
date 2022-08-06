<%@page import="poly.dto.RestDTO"%>
<%@page import="poly.dto.SelfCheckDTO" %>
<%@page import="poly.util.CmmUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	RestDTO rDTO = (RestDTO) request.getAttribute("rDTO");
 	SelfCheckDTO r2DTO = (SelfCheckDTO) request.getAttribute("r2DTO");
 	String msg = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">

  <head>
    <title>자가점검표</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    
    <script src="https://kit.fontawesome.com/54d6336788.js"></script>
    <style>
    form { 
margin: 0 auto; 
width: 90%;
}   
    </style>
  </head>
  <body>
	
	
    
  <!-- top -->
<div>
<jsp:include page="/include/top.jsp" ></jsp:include>
</div>
  
  
    
   <script type="text/javascript">
    	var msg = "<%=msg%>";
    	if(msg.length > 0){
    		alert("<%=msg%>");
    		window.history.back();
    	}
    </script>
   
    <div class="hero-wrap hero-wrap-2" style="background-image: url('/images/mask_pos.jpg'); background-attachment:fixed;">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-8 ftco-animate text-center">
            <p class="breadcrumbs"><span class="mr-2">Safe</span></p>
            <h1 class="mb-3 bread">자가 점검표</h1>
          </div>
        </div>
      </div>
    </div>

    <section class="ftco-section contact-section ftco-degree-bg">
      <div class="container">
        <div class="row block-9">
        	<div class="col-12">
            <h2 class="h4 text-center">안심식당 자가점검표</h2>
            </div>
        	<div class="col-12 text-center">
            <p><span>안심식당 번호 : </span> <%=CmmUtil.nvl(rDTO.getSafety_restrnt_no())%> &nbsp;&nbsp;&nbsp; <span>상호명 : </span> <%=CmmUtil.nvl(rDTO.getBizplc_nm())%></p>
          	</div>
        <div class="col-12 text-center">
	
	
	
	
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
        </div>
      </div>
      </div>
    </section>
 
    <!-- bottom -->
<div>
<jsp:include page="/include/footer.jsp" ></jsp:include>
</div>
 
 <script src="../js/main.js"></script>   
    
  </body>
</html>