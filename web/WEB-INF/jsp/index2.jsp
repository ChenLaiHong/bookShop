<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- saved from url=(0048)http://localhost:8080/mango/product/list/1.jhtml -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>书城小驿</title>
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/product.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/slider.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/demo.css"
	rel="stylesheet" type="text/css" />
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
		<%@ include file="menu.jsp"%>
	</div>
	<div class="container productList">
		<div class="span6">
			<div class="hotProductCategory">
				<s:iterator var="c" value="#session.cList">
					<dl>
						<dt>
							<a href="${pageContext.request.contextPath}/book_findByCid.action?cid=<s:property
									value="#c.cid" />&page=1"><s:property
									value="#c.cname" /></a>
				 		</dt>
						<s:iterator var="cs" value="#c.categorySeconds">
							<dd>
								<a href="${pageContext.request.contextPath}/book_findByCsid.action?csid=<s:property value="#cs.csid" />&page=1"><s:property value="#cs.csname" /></a>
							</dd>
						</s:iterator>
					</dl>
				</s:iterator>
			</div>
		</div>
		<div class="span18 last">

			<form id="productForm"
				action="./image/蔬菜 - Powered By Mango Team.htm" method="get">
			
									<div id="result" class="result table clearfix">
										<ul>
										<s:iterator var="p" value="pageBean.list">
											<li><a href="${pageContext.request.contextPath}/book_findByBid.action?bid=<s:property value="#p.bid"/>"> <img
													src="${pageContext.request.contextPath}/<s:property value="#p.image"/>"
													width="170" height="170" style="display: inline-block;"/>

														<span style='color:green'> <s:property value="#p.bname"/> </span> <span class="price">
															商城价： ￥<s:property value="#p.shop_price"/> </span></a>
											</li>
											</s:iterator>
											</ul>
									</div>
									<div class="pagination">
										<span>第<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>页</span>
										
										<s:if test="pageBean.page !=1">
											<a href="${pageContext.request.contextPath}/book_search.action?title=<s:property value="#session.title"/>&page=1" class="firstPage">&nbsp;</a>
										    <a href="${pageContext.request.contextPath}/book_search.action?title=<s:property value="#session.title"/>&page=<s:property value="pageBean.page-1"/>" class="previousPage">&nbsp;</a>
										 </s:if>
										 
										<s:iterator var="i" begin="1" end="pageBean.totalPage">
											<s:if test="pageBean.page != #i">
												<a href="${pageContext.request.contextPath}/book_search.action?title=<s:property value="#session.title"/>&page=<s:property value="#i"/>"><s:property value="#i"/></a> 
											</s:if>
											<s:else>
												<span class="currentPage"><s:property value="#i"/></span>
											</s:else>
										</s:iterator>
										
										<s:if test="pageBean.page !=pageBean.totalPage">
											<a class="nextPage" href="${pageContext.request.contextPath}/book_search.action?title=<s:property value="#session.title"/>&page=<s:property value="pageBean.page+1"/>">&nbsp;</a> 
											<a class="lastPage" href="${pageContext.request.contextPath}/book_search.action?title=<s:property value="#session.title"/>&page=<s:property value="pageBean.totalPage"/>">&nbsp;</a>
										</s:if>
									
									
									
									</div>
			</form>
		</div>
	</div>
	<div class="container footer">
	
		<div class="span24">
			<ul class="bottomNav">
				<li><a>关于我们</a> |</li>
				<li><a>联系我们</a> |</li>
				<li><a>诚聘英才</a> |</li>
				<li><a>法律声明</a> |</li>
				<li><a>友情链接</a> |</li>
				<li><a target="_blank">支付方式</a> |</li>
				<li><a target="_blank">配送方式</a> |</li>
				<li><a>官网</a> |</li>
				<li><a href="${pageContext.request.contextPath}/adminUser_loginPage.action">后台登录</a></li>
			</ul>
		</div>
		<div class="span24">
			<div class="copyright">Copyright© 2017-2018 书城小驿 版权所有</div>
		</div>
	</div>
</body>
</html>