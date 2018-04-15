<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%> 
<!DOCTYPE html>
<html>

<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet"
	href="${ pageContext.request.contextPath }/css/amazeui.css" />
<link href="${ pageContext.request.contextPath }/css/dlstyle.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript">	
		function checkForm() {
		//校验用户名
		var username = document.getElementById("name").value;
		var password = document.getElementById("password").value;
		if (username == null || username == '') {
			alert("用户名不能为空！");
			return false;
		}
		if (password == null || password == '') {
			alert("密碼不能为空！");
			return false;
		}
	}
</script>
</head>

<body>

	<div class="login-boxtitle">
		<a href=""><img alt="logo"
			src="${ pageContext.request.contextPath }/images/logobig.png" /></a>
	</div>

	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg">
				<span></span><img
					src="${ pageContext.request.contextPath }/images/big.jpg" />
			</div>
			<div class="login-box">
					<strong><s:actionerror/></strong>
				<h3 class="title">登录书城</h3>

				<div class="clear"></div>
				<form id="loginFrom" action="${pageContext.request.contextPath}/user_login.action" method="post" novalidate="novalidate" onsubmit="return checkForm (); ">
					<div class="login-form">
						<div class="user-name">
							<label for="user"><i class="am-icon-user"></i></label> <input
								type="text" name="name" id="name" placeholder="请输入用户名">
						</div>
						<div class="user-pass">
							<label for="password"><i class="am-icon-lock"></i></label> <input
								type="password" name="password" id="password" placeholder="请输入密码">
						</div>
					</div>
					
					<div class="am-cf">
						<input type="submit" value="登 录"
							class="am-btn am-btn-primary am-btn-sm">
					</div>
				</form>
				<div class="login-links">
						<a href="#" class="am-fr">忘记密码</a> <a
							href="${ pageContext.request.contextPath }/user_registPage.action"
							class="zcnext am-fr am-btn-default">注册</a> <br />
					</div>
			</div>
		</div>
	</div>

</body>

</html>