<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.dto.PagingDTO"%>
<%@ page import="poly.dto.RestDTO"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<title>자가점검표</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function search() {
		document.getElementById("paging").style.visibility = "hidden";
		var name = {
			"name" : $('#bizplc_nm').val()
		};
		if ($('#bizplc_nm').val() == "") {
			$('#bizplc_nm').focus();
			return false;
		}
		console.log("name : " + name);
		$
				.ajax({
					url : "/rest/restSearch.do",
					type : "get",
					data : name,
					success : function(data) {
						
						var back = "뒤로가기";
						var resHTML = '';
						
						
						console.log(data);
						
						 resHTML += '<div class="row m-1 pt-1">';
		                 resHTML += '<div class="col-2 text-center"><b>No. </b></div>';
		                 resHTML += '<div class="col-5 text-center"><b>상호명</b></div>';
		                 resHTML += '<div class="col-5 text-center"><b>주소</b></div>';
		                 resHTML += '</div><hr>';


		                 if (data.length == 0) {
		                     resHTML += '<div class="row m-1 pt-1">';
		                     resHTML += '<div class="col-2 text-center"><b>-</b></div>';
		                     resHTML += '<div class="col-5 text-center"><b>-</b></div>';
		                     resHTML += '<div class="col-5 text-center"><b>-</b></div>';
		                     resHTML += '</div><hr>';
		                     alert("찾을 수 없는 상호명입니다.");
		                  } else {
		                     var cnt = parseInt('0');
		                     for (var i = 0; i < data.length; i++) {

								

		                    	resHTML += '<div class="row m-1 pt-1">';
								resHTML += '<div class="col-2 text-center"><b>' + ++cnt;
								resHTML += '</b></div>';
								resHTML += '<div class="col-5 text-center"><b><a href="/rest/SelfCheckDetail.do?no='
										+ data[i].safety_restrnt_no
										+ '">'
										+ data[i].bizplc_nm + '</a></b></div>';
								resHTML += '<div class="col-5 text-center"><b>' + data[i].refine_lotno_addr
										+ '</b></div>';
								resHTML += '</div><hr>';
							}
							
							
						}
		                 
		                 <%--뒤로가기버튼--%>
						
		                 	resHTML += '<div class="row m-1 pt-1">';
							resHTML += '<div class="col-12 text-left"><a href="/rest/selfCheckList.do">' + back + '</b></div>';
							resHTML += '</div>';
							
							
						$("#searchResult").html(resHTML);
						
					}

				})
	}
</script>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "/rest/selfCheckList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>

<%
	PagingDTO pDTO = (PagingDTO) request.getAttribute("paging");

	int nowPage = pDTO.getNowPage();

	int startPage = pDTO.getStartPage();

	int endPage = pDTO.getEndPage();

	int cntPerPage = pDTO.getCntPerPage();

	int lastPage = pDTO.getLastPage();

	int num = 1;

	List<RestDTO> viewAll = (List<RestDTO>) request.getAttribute("viewAll");
%>


</head>


<body>
<!-- top -->
<div>
<jsp:include page="/include/top.jsp"></jsp:include>
</div>


<div>
<jsp:include page="/include/center.jsp"></jsp:include>
</div>


<div class="main" style="margin-top: 100px;"></div>


<!-- paging -->
<section class="ftco-section pt-0">
		<div class="container">
			<div>
				<select id="cntPerPage" name="sel" onchange="selChange()">
					<option value="20" <%if (cntPerPage == 20) {%> selected <%}%>>20줄
						보기</option>
					<option value="50" <%if (cntPerPage == 50) {%> selected <%}%>>50줄
						보기</option>
					<option value="100" <%if (cntPerPage == 100) {%> selected <%}%>>100줄
						보기</option>
					<option value="150" <%if (cntPerPage == 150) {%> selected <%}%>>150줄
						보기</option>
				</select>
			</div>
			<div class="row">
				
				
				
				 <div class="table " id="searchResult">
                  
                    <div class="row m-1 pt-1">
                     <div class="col-2 text-center"><b>No. </b></div>
                     <div class="col-5 text-center"><b>상호명</b></div>
                     <div class="col-5 text-center"><b>주소</b></div>
                    
                  </div>
                  <hr>
                  
                  
                  
                  
                  
                  
                               <%for (RestDTO e : viewAll) {%>
                  <div class="row m-1 pt-1">
                     <div class="col-2 text-center"><b><%=num%> 
                     <%
                        num++;
                     %>
                     </b></div>
                     <div class="col-5 text-center"><b>
                     <a href="/rest/SelfCheckDetail.do?no=<%=e.getSafety_restrnt_no()%>"><%=e.getBizplc_nm()%></a></b></div>
                     <div class="col-5 text-center"><b><%=e.getRefine_lotno_addr()%></b></div>
                  </div>
                  <hr>
                <%} %>
             </div> 
                  
                  
                  
                  
<div class="col text-center">
            <div class="block-27">
               <div id="paging">
                  <ul>
                     <%
                        if (startPage != 1) {
                     %>
                     <li><a
                        href="/rest/selfCheckList.do?nowPage=<%=startPage - 1%>&cntPerPage=<%=cntPerPage%>">&lt;</a>
                        <%
                           }
                        %> <%
    for (int i = startPage; i <= endPage; i++) {
 %> <%
    if (i == nowPage) {
 %>
                     <li class="active"><span><%=i%></span></li>
                     <%
                        }
                     %>
                     <%
                        if (i != nowPage) {
                     %>
                     <li><a
                        href="/rest/selfCheckList.do?nowPage=<%=i%>&cntPerPage=<%=cntPerPage%>"><%=i%></a></li>
                     <%
                        }
                     %>
                     <%
                        }
                     %>
                     <%
                        if (endPage != lastPage) {
                     %>
                     <li><a
                        href="/rest/restPaging.do?nowPage=<%=endPage + 1%>&cntPerPage=<%=cntPerPage%>">&gt;</a></li>
                     <%
                        }
                     %>
                     
                  </ul>
                  <div style="display: inline-block; margin: 0;">
                     <div class="input-group">
                        <input type="text" placeholder="상호명" name="bizplc_nm"
                           id="bizplc_nm" style="height: 40px !important;" /> <input
                           type="button" onClick="JavaScript:search();" value="검색" />
                     </div>
                  </div>
               </div>
            </div>
         </div>
      

   </section>

<!-- bottom -->
<div>
<jsp:include page="/include/footer.jsp"></jsp:include>
</div>


</body>
</html>