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
<title>修改个人信息</title>
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
<form id="form" action="${pageContext.request.contextPath}/user_update.action" method="post">
<input type="hidden" name="uid" value="<s:property value="#session.existUser.uid"/>"/>
<input type="hidden" name="state" value="<s:property value="#session.existUser.state"/>"/>
<input type="hidden" name="code" value="<s:property value="#session.existUser.code"/>"/>
<input type="hidden" name="password" value="<s:property value="#session.existUser.password"/>"/>
    <table align="center" border="1" cellpadding="8" bgcolor="#FFE4E1" style="width:560px;height:35px">  
        <tr>
            <td>用户名：</td>
            <td><input type="text" name="name" value="<s:property value="#session.existUser.name"/>" readonly="readonly"/>
            </td>
        </tr>
        <tr>
            <td>默认送货地址：</td>
            <td><input type="text" name="address"value="<s:property value="#session.existUser.address"/>"/>
            </td>
        </tr>
      
          <tr>
            <td>默认联系电话：</td>
            <td><input type="text" name="phone"value="<s:property value="#session.existUser.phone"/>"/>
            </td>
        </tr>

		  <tr>
            <td>邮箱：</td>
            <td><input type="text" name="email"value="<s:property value="#session.existUser.email"/>"/>
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