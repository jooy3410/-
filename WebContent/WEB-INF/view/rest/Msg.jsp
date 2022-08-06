<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%
	//Controller로부터 전달받은 데이터
	String msg = CmmUtil.nvl((String) request.getAttribute("msg"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자가점검표 등록</title>
<script type="text/javascript">
	alert("<%=msg%>");
</script>
</head>
<body>
	<script type="text/javascript">
	window.location.replace("/index.do")
	</script>
</body>
</html>