<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags"  prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0043)http://localhost:8080/mango/cart/list.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

<title>订单评论页面</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/demo.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="container header">
	<div class="span5">
		<div class="logo">
			<a href="">
				<img src="${pageContext.request.contextPath}/images/logobig.png" alt="书城小驿"/>
			</a>
		</div>
	</div>
	<%@ include file="menu.jsp" %>
	
</div>	

<div class="container cart">

		<div class="span24">
		
			<div class="step step1">
				<ul>
					
					<li  class="current"></li>
					<li  >评论订单</li>
				</ul>
			</div>
	
		
				<table>
					<tbody>
					<tr>
						<th colspan="5">订单编号:<s:property value="model.oid"/>&nbsp;&nbsp;&nbsp;&nbsp;</th>
					</tr>
					<tr>
						<th>图片</th>
						<th>图书</th>
						<th>价格</th>
						<th>数量</th>
						<th>小计</th>
					</tr>
						<s:iterator var="orderItem" value="model.orderItems">
						<tr>
							<td width="60">
								<img src="${ pageContext.request.contextPath }/<s:property value="#orderItem.book.image"/>"/>
							</td>
							<td>
								<s:property value="#orderItem.book.pname"/>
							</td>
							<td>
								<s:property value="#orderItem.book.shop_price"/>
							</td>
							<td class="quantity" width="60">
								<s:property value="#orderItem.count"/>
							</td>
							<td width="140">
								<span class="subtotal">￥<s:property value="#orderItem.subtotal"/></span>
							</td>
							
						</tr>
						</s:iterator>
				</tbody>
			</table>
			
				<div class="total">
					<em id="promotion"></em>
					图书金额: <strong id="effectivePrice">￥<s:property value="model.total"/>元</strong>
				</div>
			<form id="orderForm" action="${ pageContext.request.contextPath }/comment_add.action" method="post">
				<input type="hidden" name="oid" value="<s:property value="model.oid"/>"/>
				<div class="span24">
					<p>
							评论：<textarea name="comment" rows="8" cols="50"></textarea>
								
						</p>
						<hr />
						
						<hr />
						<p style="text-align:right">
							<input type="submit" value="提交" class="am-btn am-btn-primary am-btn-sm"/>
						</p>
				</div>
			</form>
		</div>
		
	</div>
<div class="container footer">
	<div class="span24">
		<ul class="bottomNav">
					<li>
						<a href="#">关于我们</a>
						|
					</li>
					<li>
						<a href="#">联系我们</a>
						|
					</li>
					<li>
						<a href="#">诚聘英才</a>
						|
					</li>
					<li>
						<a href="#">法律声明</a>
						|
					</li>
					<li>
						<a>友情链接</a>
						|
					</li>
					<li>
						<a target="_blank">支付方式</a>
						|
					</li>
					<li>
						<a target="_blank">配送方式</a>
						|
					</li>
					<li>
						<a >SHOP++官网</a>
						|
					</li>
					<li>
						<a>SHOP++论坛</a>
						
					</li>
		</ul>
	</div>
	<div class="span24">
		<div class="copyright">Copyright © 2017-2018 书城小驿 版权所有</div>
	</div>
</div>
</body>
</html>