<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>개인 회원가입</title>




<script type="text/javascript">
	// 회원가입 유효성 체크
	function doRegUserCheck(f){
		
		if(f.user_id.value==""){
			alert("아이디를 입력하세요.");
			f.user_id.focus();
			return false;
		}
		
		if(f.user_name.value==""){
			alert("이름을 입력하세요.");
			f.user_name.focus();
			return false;
		}
		
		if(f.password.value==""){
			alert("비밀번호를 입력하세요.");
			f.password.focus();
			return false;
		}
		
		
		if(f.password2.value==""){
			alert("비밀번호확인을 입력하세요.");
			f.password2.focus();
			return false;
		}
		
		
		if(f.email.value==""){
			alert("이메일을 입력하세요.");
			f.email.focus();
			return false;
		}
		
		if(f.addr1.value==""){
			alert("주소를 입력하세요.");
			f.addr1.focus();
			return false;
		}
		
		if(f.addr2.value==""){
			alert("상세주소를 입력하세요.");
			f.addr2.focus();
			return false;
		}
		
		if(f.pnumber.value==""){
			alert("핸드폰 번호를 입력하세요.");
			f.user_id.focus();
			return false;
		}
		

		
	}
</script>






 <!-- Font Icon -->
    <link rel="stylesheet" href="../fonts1/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../css1/style.css">
	
</head>
<body>  



      
         <form name="f" action="/safe/insertNUserInfo.do" method="post" onsubmit="return doRegUserCheck(this);">
        
        <!-- 부트스트랩 시작 -->
            <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form">
                        <h2 class="form-title">회원가입</h2>
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="user_id" placeholder="아이디"/>
                        </div>
                        
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="user_name" placeholder="이름"/>
                        </div>
                           
                        <div class="form-group">
                            <input type="password" class="form-input" name="password" placeholder="비밀번호"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                       
                           
                        <div class="form-group">
                           <input type="password" class="form-input" name="password2" placeholder="비밀번호 확인"/>
                             <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        
                         
                        
                         <div class="form-group">
                            <input type="email" class="form-input" name="email"  placeholder="Email"/>
                        </div>
                        
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="addr1" placeholder="주소"/>
                        </div>
                        
                        
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="addr2" placeholder="상세주소"/>
                        </div>
                        
                          
                        
                        
                        
                        <div class="form-group">
                            <input type="text" class="form-input" name="pnumber" placeholder="휴대전화"/>
                        </div>
                        
                      
                        
                           
                        <div class="form-group">
                            <input type="submit" name="submit" class="form-submit" value="가입하기"/>
                            
                            
                            
                        </div>
                    </form>
                    
                </div>
            </div>
        </section>

    </div>
     </form>
     
     

    <!-- JS -->
    <script src="../vendor1/jquery/jquery.min.js"></script>
    <script src="../js1/main.js"></script>

</body>
