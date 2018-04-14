<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台登录页面</title>
<%
 pageContext.setAttribute("APP_PATH",request.getContextPath());
 %>

<STYLE>
body{
	background: #ebebeb;
	font-family: "Helvetica Neue","Hiragino Sans GB","Microsoft YaHei","\9ED1\4F53",Arial,sans-serif;
	color:  #FF88C2;
	font-size: 12px;
}
*{padding: 0px;margin: 0px;}
.top_div{
	background: #FFB3FF;
	width: 100%;
	height: 400px;
}
.ipt{
	border: 1px solid #d3d3d3;
	padding: 10px 10px;
	width: 290px;
	border-radius: 4px;
	padding-left: 35px;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
	-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
	-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
	transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s
}
.ipt:focus{
	border-color: #66afe9;
	outline: 0;
	-webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6);
	box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgba(102,175,233,.6)
}
.u_logo{
	background: url("${pageContext.request.contextPath}/images/username.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 43px;
	left: 40px;
}
.p_logo{
	background: url("${pageContext.request.contextPath}/images/password.png") no-repeat;
	padding: 10px 10px;
	position: absolute;
	top: 12px;
	left: 40px;
}
a{
	text-decoration: none;
}
}
</STYLE>
     
<SCRIPT type="text/javascript">
 function checkAll() {
            var name = document.getElementById("userName");
            var password1 = document.getElementById("password");
            if (name.value == null || name.value == "" || password1.value == null || password1.value == "") {
                document.getElementById("error").innerHTML = "请输入用户名和密码！";
                return false;
            }else {
                return true;
            }
        }
</SCRIPT>
</head>
<body>
<DIV class="top_div">
</DIV>

<form action="${APP_PATH}/adminUser_login.action" method="post" target="parent" onsubmit="return checkAll()">
	<DIV style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); border-image: none; width: 400px; height: 200px; text-align: center;">
		
		<P style="padding: 30px 0px 10px; position: relative;">
			<SPAN class="u_logo"></SPAN>
			<INPUT id="userName" name="username" class="ipt" type="text" placeholder="请输入用户名"> 
	    </P>
		<P style="position: relative;">
			<SPAN class="p_logo"></SPAN>         
			<INPUT id="password" name="password" class="ipt"  type="password" placeholder="请输入密码">   
	  	</P>
		<DIV style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			
			<P style="margin: 0px 35px 20px 45px;">
			<SPAN style="float: left;">后台管理系统</SPAN> 
	        <SPAN style="float: right;"> 
	              <input type="submit" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); border-image: none; color: #FFB7DD; font-weight: bold;" value="登录"/> 
	         </SPAN>         
	         </P>
	         <span><s:actionerror/></span>
	    </DIV>
	</DIV>
</form>
<div style="text-align:center;padding-top: 30px">
Copyright © 2017 后台书城小驿管理系统
</div>
</body>
</html>