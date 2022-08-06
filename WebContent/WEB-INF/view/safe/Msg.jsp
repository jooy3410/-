<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil"%>
<%@ page import="poly.dto.SafeDTO"%>
<%@ page import="poly.dto.NUserInfoDTO"%>
<%
	//Controller로부터 전달받은 데이터
	String msg = CmmUtil.nvl((String) request.getAttribute("msg"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입을 축하드립니다.</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<script type="text/javascript">
		alert("<%=msg%>");
		window.location.replace("/safe/Login.do")
</script>
</body>
</html>