<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>
<script type="text/javascript">
function checkForm() {
		
		var password = document.getElementById("password").value;
		var passwordRepeat = document.getElementById("passwordRepeat").value;
	
		if (password == null || password == '') {
			alert("密碼不能为空！");
			return false;
		}
		if (passwordRepeat != password ) {
			alert("两次密码不一致！");
			return false;
		}
	}
function checkPass(){
	// 获得文件框值:
		var passwordB = document.getElementById("passwordB").value;
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
		xhr.open("GET","${pageContext.request.contextPath}/user_findByPass.action?time="+new Date().getTime()+"&password="+ passwordB,true);
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
	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href=""> <img
					src="${pageContext.request.contextPath}/images/logobig.png"
					alt="书城小驿" />
				</a>
			</div>
		</div>

		<%@ include file="menu.jsp" %>

</div>	
<center>
<form id="form" action="${pageContext.request.contextPath}/user_updateUserPass.action" method="post" onsubmit="return checkForm (); ">
<input type="hidden" name="uid" value="<s:property value="#session.existUser.uid"/>"/>
    <table align="center" border="1" cellpadding="8" bgcolor="#FFE4E1" style="width:560px;height:35px">  
        <tr>
            <td>原密码：</td>
            <td><input type="password" id="passwordB" name="passwordB" placeholder="请输入原密码" onblur="checkPass()"/>
           <span id="span1"></span>
            </td>
        </tr>
        <tr>
            <td>新密码：</td>
            <td><input type="password" id="password" name="password" placeholder="请输入新密码"/>
            </td>
        </tr>
      
          <tr>
            <td>确认密码：</td>
            <td><input type="password" id="passwordRepeat" placeholder="请输入确认密码"/>
            </td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="确定修改"/>
            </td>
        </tr>
    </table>

</form>
 </center>
</body>
</html>