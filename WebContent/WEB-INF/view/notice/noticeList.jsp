<%@page import="static poly.util.CmmUtil.nvl"%>
<%@page import="poly.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    	List<BoardDTO> rList = (List<BoardDTO>)request.getAttribute("rList");
    
    %>
<!DOCTYPE html>
<html>
<head>
<title>공지사항</title>

<link rel="stylesheet" href="../css/style.css">




</head>

<script type= "text/javascript">
function search(){
	//alert("test");
	var title = $("#title").val();
	//alert(title)
		$.ajax({
		url : "/board/searchList.do",
		type : "post",
		data : {
			"title" : title
			},
		success : function(data) {
			console.log(data);
			var resHTML = " ";
			console.log(title);
			console.log(data.length);
			resHTML += '<div class="row m-1 pt-1">';
			resHTML += '<div class="col-3 text-center"><b>글번호 </b></div>';
			resHTML += '<div class="col-3 text-center"><b>제목</b></div>';
			resHTML += '<div class="col-3 text-center"><b>게시자</b></div>';
			resHTML += '<div class="col-3 text-center"><b>게시일</b></div>';
			resHTML += '</div>';
			if(data.length == 0){
				resHTML +=  '<div class="row m-1 pt-1">';
				resHTML += '<div class="col-3 text-center">-</div>';
				resHTML += '<div class="col-3 text-center">-</div>';
				resHTML += '<div class="col-3 text-center">-</div>';
				resHTML += '<div class="col-3 text-center">-</div>';
				resHTML +=  '</div>';
			}else{
				for(var i=0; i< data.length; i++){
					resHTML +=  '<div class="row m-1 pt-1">';
					resHTML += '<div class="col-3 text-center">'+data[i].post_no+'</div>';
					resHTML += '<div class="col-3 text-center">'+data[i].post_title+'</div>';
					resHTML += '<div class="col-3 text-center">'+data[i].reg_id+'</div>';
					resHTML += '<div class="col-3 text-center">'+data[i].reg_dt+'</div>';
					resHTML +=  '</div>';
					console.log(resHTML);
				}
			}
			$("#searchResult").html(resHTML);
			
		}
	})
}

</script>


<body>

<!-- top -->
<div>
<jsp:include page="/include/top.jsp" ></jsp:include>
</div>



<div>
<jsp:include page="/include/center.jsp"></jsp:include>
</div>

	
	
<!-- 빈공간 -->
<div class="main" style="margin-top: 100px;"></div>






<div style="margin:auto;width:800px;">


<!-- div테이블 연습 -->
<form  method="post" action="/newpost.do" >

             <div class="table ">
                  <div class="row m-1 pt-1">
                     <div class="col-3 text-center"><b>글번호 </b></div>
                     <div class="col-3 text-center"><b>제목</b></div>
                     <div class="col-3 text-center"><b>게시자</b></div>
                     <div class="col-3 text-center"><b>게시일</b></div>
                  </div>
                  <hr>
                  
             
             <% for(BoardDTO e : rList) {%>
                  <div class="row m-1 pt-1">
                     <div class="col-3 text-center"><b><%=nvl(e.getPost_no()) %> </b></div>
                     <div class="col-3 text-center"><b><a href="/notice/noticeDetail.do?no=<%=e.getPost_no()%>"><%=nvl(e.getPost_title()) %></a></b></div>
                     <div class="col-3 text-center"><b><%=nvl(e.getReg_id())%></b></div>
                     <div class="col-3 text-center"><b><%=nvl(e.getReg_dt()) %></b></div>
                  </div>
                  <hr>
                <%} %>
             </div>  
                  
                  <%if(session.getAttribute("SS_USER_NUM") != null) {%>
                  <%if(session.getAttribute("SS_USER_NUM").equals("0")) {%>
                  <button type=button onclick="location.href='/notice/newpost.do'">새 글</button>
                  <%} %>
                  <%} %>


</form>

</div>


<!-- 빈공간 -->
<div class="main" style="margin-top: 150px;"></div>


<!-- bottom -->
<div>
<jsp:include page="/include/footer.jsp" ></jsp:include>
</div>



</body>


</html>