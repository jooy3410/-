<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<jsp:include page="/include/top.jsp" ></jsp:include>
</div>

<div>
<jsp:include page="/WEB-INF/view/notice/newpost.jsp"></jsp:include>
</div>

<!-- 빈공간 -->
<div class="main" style="margin-top: 150px;"></div>


<!-- bottom -->
<div>
<jsp:include page="/include/footer.jsp" ></jsp:include>
</div>


</body>
</html>