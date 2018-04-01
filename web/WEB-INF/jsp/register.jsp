<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="format-detection" content="telephone=no" />
<meta name="renderer" content="webkit" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/amazeui.min.css" />
<link href="${pageContext.request.contextPath}/css/dlstyle.css"
	rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/amazeui.min.js"></script>

<script>
	function checkForm() {
		//校验用户名
		var username = document.getElementById("name").value;
		var password = document.getElementById("password").value;
		var email = document.getElementById("email").value;
		var passwordRepeat = document.getElementById("passwordRepeat").value;
		if (username == null || username == '') {
			alert("用户名不能为空！");
			return false;
		}
		if (password == null || password == '') {
			alert("密碼不能为空！");
			return false;
		}
		if (email == null || email == '') {
			alert("邮箱不能为空！");
			return false;
		}
		if (passwordRepeat != password ) {
			alert("两次密码不一致！");
			return false;
		}
	}
	
	function checkUserName(){
	// 获得文件框值:
		var name = document.getElementById("name").value;
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4){
				if(xhr.status == 200){
					document.getElementById("span1").innerHTML = xhr.responseText;
				}
			}
		}
		// 3.打开连接
		xhr.open("GET","${pageContext.request.contextPath}/user_findByName.action?time="+new Date().getTime()+"&name="+ name,true);
		// 4.发送
		xhr.send(null);
	 
	}
	 function createXmlHttp(){
	 	var xmlHttp;
		   try{ // Firefox, Opera 8.0+, Safari
		        xmlHttp=new XMLHttpRequest();
		    }
		    catch (e){
			   try{// Internet Explorer
			         xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			      }
			    catch (e){
			      try{
			         xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			      }
			      catch (e){}
			      }
		    }

			return xmlHttp;
	 }
</script>
</head>

<body>

	<div class="login-boxtitle">
		<a href=""><img alt=""
			src="${pageContext.request.contextPath}/images/logobig.png" /></a>
	</div>

	<div class="res-banner">
		<div class="res-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${pageContext.request.contextPath}/images/big.jpg" />
			</div>
			<div class="login-box">

				<div class="am-tabs" id="doc-my-tabs">
					<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
						<li class="am-active"><a href="">邮箱注册</a></li>
						<li><a href="">手机号注册</a></li>
					</ul>

					<div class="am-tabs-bd">
						<div class="am-tab-panel am-active">
							<form id="registerFrom" method="post" action="${pageContext.request.contextPath}/user_regist.action"
								novalidate="novalidate" onsubmit="return checkForm (); ">
								<span id="span1"></span>
								<div class="user-name">
									<label for="name"><i class="am-icon-user"></i></label> <input
										type="text" name="name" id="name" placeholder="请输入用户名" onblur="checkUserName()"/>
									
								</div>
								<div class="user-email">
									<label for="email"><i class="am-icon-envelope-o"></i></label> <input
										type="text" name="email" id="email" placeholder="请输入邮箱账号" />
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="password" id="password"
										placeholder="设置密码" />
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" id="passwordRepeat" placeholder="确认密码" />
								</div>

								<div class="am-cf">
									<input type="submit" value="注册"
										class="am-btn am-btn-primary am-btn-sm am-fl" />
								</div>
								<span><s:fielderror/></span>
							</form>
						</div>

						<div class="am-tab-panel">
							<form method="post">
								<div class="user-phone">
									<label for="phone"><i
										class="am-icon-mobile-phone am-icon-md"></i></label> <input type="tel"
										name="" id="phone" placeholder="请输入手机号" />
								</div>
								<div class="verification">
									<label for="code"><i class="am-icon-code-fork"></i></label> <input
										type="tel" name="" id="code" placeholder="请输入验证码" /> <a
										class="btn" href="javascript:void(0);"
										onclick="sendMobileCode();" id="sendMobileCode" /> <span
										id="dyMobileButton">获取</span></a>
								</div>
								<div class="user-pass">
									<label for="password"><i class="am-icon-lock"></i></label> <input
										type="password" name="password" id="password" placeholder="设置密码" />
								</div>
								<div class="user-pass">
									<label for="passwordRepeat"><i class="am-icon-lock"></i></label>
									<input type="password" name="" id="passwordRepeat"
										placeholder="确认密码" />
								</div>
							
						
							<div class="am-cf">
								<input type="submit" name="" value="注册"
									class="am-btn am-btn-primary am-btn-sm am-fl" />
							</div>
							</form>
						</div>

						<script>
							$(function() {
								$('#doc-my-tabs').tabs();
							})
						</script>

					</div>
				</div>

			</div>
		</div>
</body>

</html>