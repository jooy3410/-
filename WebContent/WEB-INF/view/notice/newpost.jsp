<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<title>새 글 등록</title>

<script src="../summernote/summernote-lite.js"></script>
<script src="../summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="../summernote/summernote-lite.css">


 <!-- CDN 한글화 -->
    <script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
    <!-- 로컬 파일 한글화 -->    
    
    
    
    
    
<script>
$(document).ready(function() {
	  $('#summernote').summernote({
 	    	placeholder: '내용을 입력해 주세요',
	        minHeight: 370,
	        maxHeight: null,
	        focus: true, 
	        lang : 'ko-KR'
	  });
	});
</script>

</head>
<body>

<div class="main" style="margin-top: 100px;"></div>

<h2 style="text-align: center;">새 글 등록</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form action="/board/dopost.do" method="post">
		<div><input type="text" name="post_title" style="width:100%; "placeholder="제목"></div>
	
		<br>
		<textarea id="summernote" name="post_content"></textarea>
		<div><input type="submit"></div>
	</form>
</div>




</body>



</html>