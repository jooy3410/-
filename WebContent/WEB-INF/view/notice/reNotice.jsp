<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="poly.util.CmmUtil" %>
<%
	String msg = CmmUtil.nvl((String) request.getAttribute("msg"));
	
	String url = CmmUtil.nvl((String) request.getAttribute("url"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
	if(<%=msg.length()>0%>){
		alert("<%=msg%>");
	}
	window.location.replace("<%=url%>");
</script>
</body>
</html>