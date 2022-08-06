<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입 선택화면</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="../fonts1/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="../css1/style.css">
</head>
<body>

    <div class="main">

        <section class="signup">
            
            <div class="container">
                <div class="signup-content">
                    
                       <h2 class="form-title" style="
    								margin-top: 100px;
   									margin-bottom: 50px;
									">선택해 주세요</h2>
                        
                       

                        
                      
                        <div class="form-group" style="
    								margin-bottom: 50px;">
                            <button type="button" onclick="location.href='/safe/business.do'" class="form-submit" >사업자</button>
                        </div>
                        
                        
                        
                         <div class="form-group">
                           <button type="button" onclick="location.href='/safe/nonbusiness.do'" class="form-submit" >개인회원</button>
                        </div>
                        
                        
                        
                   
                    
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor1/jquery/jquery.min.js"></script>
    <script src="js1/main.js"></script>
</body><!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>