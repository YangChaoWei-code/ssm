<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>ccms院校通讯登录</title>
    <meta name="keywords" content="登录">
    <meta name="description" content="登录">
    <link href="/ccms/commons/jslib/hplus/css/bootstrap.min.css" rel="stylesheet">
    <link href="/ccms/commons/jslib/hplus/css/font-awesome.min.css?v=4.4.0" rel="stylesheet">
    <link href="/ccms/commons/jslib/hplus/css/animate.min.css" rel="stylesheet">
    <link href="/ccms/commons/jslib/hplus/css/style.min.css" rel="stylesheet">
    <link href="/ccms/commons/jslib/hplus/css/login.min.css" rel="stylesheet">
    
    <link href="/ccms/commons/css/qy-style.css" rel="stylesheet">
    
      <!-- jQuery -->
  	<script src="/ccms/commons/jslib/hplus/js/jquery.min.js"></script>
  	<script src="/ccms/commons/jslib/hplus/js/jquery-ui-1.10.4.min.js"></script>
    
    <script src="/ccms/commons/jslib/hplus/js/plugins/validate/jquery.validate.min.js"></script>

	<script src="/ccms/commons/jslib/hplus/js/plugins/validate/messages_zh.min.js"></script>
	
	
	<script src="/ccms/commons/jslib/CommonValue.js"></script>
	
	<style>
	
	body.signin {
		background:url(/ccms/commons/images/login-background.jpg) no-repeat center fixed;
	} 
	.signinPanal{
		    width: 750px;
    		margin: 10% auto 0;
    		height:340px;
    		position: relative;
	}
	.signup-footer {
		position: absolute; 
	    border-top: solid 1px rgba(255,255,255,.3);
		top:100%;
		width: 750px;
	    padding-top: 15px;
    }
    .signinPanal .uname {
    	background: #fff url(/ccms/commons/images/user.png) no-repeat 95% center;
    }
    .signinPanal .pword {
    	background: #fff url(/ccms/commons/images/locked.png) no-repeat 95% center;
    }
	</style>
    
    <!--[if lt IE 8]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>
        if(window.top!==window.self){window.top.location=window.location};
        
        $(function(){
        
        $("#userName").focus(function(){
  			$("#div_msg").html("");
		});
		
		$("#pwd").focus(function(){
  			$("#div_msg").html("");
		});

        
        	var rtnCode = GetQueryString("rtnCode");
        	if (rtnCode != null && rtnCode == '500') {
				$("#div_msg").html("用户名或密码错误");
			}else if(rtnCode != null && rtnCode == '200')
			{
				$("#div_msg").html("软件试用期已到，请联系商务");
			}else {
				$("#div_msg").html("");
			}
        
	        $("#loginForm").validate({
				rules : {
					userName : {
						required : true
					},
					pwd : {
						required : true
					}
				},
				messages : {
					userName : {
						required : "请输入用户名"
					},
					pwd : {
						required : "请输入密码"
	
					}
				},
				submitHandler : function(form) {
	
					form.submit();
				}
			});
        
        });
        
    </script>

</head>

<body class="signin">
	<div class="signinPanal">
		<div style="position: absolute;  width: 306px; height: 313px; top: 0; right: 0; background: rgba(255,255,255,.2);    border: 1px solid rgba(255,255,255,.3) ">
			<form id='loginForm' method="post" action="/ccms/user/login">
				<p class="m-t-md" id="title" style="position: absolute; width: 237px; height: 26px; z-index: 1; top: 8%; left: 13%;">登录到后台</p>
				<div style="position: absolute; width: 237px; height: 26px; z-index: 1; top: 28%; left: 13%;">
					 <input type="text" class="form-control uname" placeholder="用户名" name="name" id="userName" style="color:#030303;"/>
				</div>
				<div style="position: absolute; width: 237px; height: 26px; z-index: 2; top: 49%; left: 13%;">
					<input type="password" class="form-control pword m-b" placeholder="密码" name="psw" id="pwd" style="color:#030303;"/>
				</div>
				
				<div style="position: absolute; width: 185px; height: 26px; z-index: 2; top: 65%; left: 13%;">
					<b><DIV id="div_msg" style="color: #FF9C00;"></DIV></b>
				</div>
				<div style="position: absolute; width:237px; height: 40px; z-index: 3; top: 75%; left: 13%; ">
					<button type="submit" class="btn btn-primary btn-block">登　录</button>
				</div>
			</form>
		</div>
		<div class="signup-footer">
	        <div class="pull-left" style="color:#fff;">
	            © 2016 All Rights Reserved. 
	        </div>
	    </div>
   </div>
</body>

</html>