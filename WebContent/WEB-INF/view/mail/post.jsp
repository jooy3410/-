<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="sendMail.do" method="post">
	<table border="1" style="width:50%;">
		<tr>
			<th>받는 사람<th>
			<th><input type="text" name="toMail" style="width:100%;" required><th>
		<tr>
		<tr>
			<th>메일 제목<th>
			<th><input type="text" name="title" style="width:100%;" required><th>
		<tr>
		<tr>
			<th>메일 내용<th>
			<th><textarea name="contents" style="width:100%;height:500px;" required></textarea><th>
		<tr>
	</table>
	<br>
	<div><input type="submit" value="보내기"></div>
</form>
</body>
</html>