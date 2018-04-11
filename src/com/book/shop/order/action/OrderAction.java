package com.book.shop.order.action;

import java.io.IOException;
import java.util.Date;


import org.apache.struts2.ServletActionContext;

import com.book.shop.cart.vo.Cart;
import com.book.shop.cart.vo.CartItem;
import com.book.shop.order.service.OrderService;
import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.user.vo.User;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

//订单管理的action
public class OrderAction extends ActionSupport implements ModelDriven<Order> {
//模型驱动使用的对象
	private Order order = new Order();
	public Order getModel() {
		return order;
	}
	//注入orderService
	private OrderService orderService;
	//接收page参数
	private int page;
	//接收支付通道编码
	private String pd_FrpId;
	//接收付款成功后的数据
	private String r6_Order;
	private String r3_Amt;
	
	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	
	//生成订单的方法
	public String save(){
		//要保存数据到数据库
		order.setTime(new Date());
		order.setState(1); //1:未付款 2：已付款，没有发货  3：已发货但是没有确认收货  4：交易完成
		//总计是购物车中的信息
		Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
		if(cart == null){
			this.addActionError("亲：您还没有购物！请先去购物！");
			return "msg";
		}
		order.setTotal(cart.getTotal());
		//设置订单中的购物项
		for(CartItem cartItem : cart.getCartItems()){
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setBook(cartItem.getBook());
			orderItem.setOrder(order);
			orderItem.setTime(new Date());
			order.getOrderItems().add(orderItem);
		}
		
		//设置订单所属的用户
		User existUser = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		if(existUser == null){
			this.addActionError("亲：您还没有登录！请先去登录！");
			return "login";
		}
		order.setUser(existUser);
		orderService.save(order);
		//将订单对象显示到页面上
		//清空购物车
		cart.clearCart();
		return "saveSuccess";
	}
	
	//我的订单查询
	public String findByUid(){
		//根据用户id查询
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		PageBean<Order> pageBean = orderService.findByPageUid(user.getUid(),page);
	//将分页信息显示到页面上
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		
	return "findByUidSuccess";
	}
//根据订单id查询订单
	public String findByOid(){
		order = orderService.findByOid(order.getOid());
		return "findByOidSuccess";
	}
	//为订单付款的方法
	public String payOrder() throws IOException{
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setAddr(order.getAddr());
		currOrder.setName(order.getName());
		currOrder.setMessages(order.getMessages());
		currOrder.setPhone(order.getPhone());
		currOrder.setState(2);
		orderService.update(currOrder);
		//为订单付款
		/*String p0_Cmd ="Buy"; //业务类型
		String p1_MerId ="10001126856";  //用户编号
		String p2_Order =(order.getOid()+"").toString(); 
		String p3_Amt = "0.01";
		String p4_Cur ="CNY";
		String p5_Pid="";
		String p6_Pcat="";
		String p7_Pdesc="";
		String p8_Url="http:localhost:8080/bookShop/order_callBack.action";
		String  p9_SAF="";
		String pa_MP ="";
		String pd_FrpId =this.pd_FrpId;
		String pr_NeedResponse="1";
		String keyValue ="69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl";
		String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		
		StringBuffer stringBuffer = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
		stringBuffer.append("p0_Cmd=").append(p0_Cmd).append("&");
		stringBuffer.append("p1_MerId=").append(p1_MerId).append("&");
		stringBuffer.append("p2_Order=").append(p2_Order).append("&");
		stringBuffer.append("p3_Amt=").append(p3_Amt).append("&");
		stringBuffer.append("p4_Cur=").append(p4_Cur).append("&");
		stringBuffer.append("p5_Pid=").append(p5_Pid).append("&");
		stringBuffer.append("p6_Pcat=").append(p6_Pcat).append("&");
		stringBuffer.append("p7_Pdesc=").append(p7_Pdesc).append("&");
		stringBuffer.append("p8_Url=").append(p8_Url).append("&");
		stringBuffer.append("p9_SAF=").append(p9_SAF).append("&");
		stringBuffer.append("pa_MP=").append(pa_MP).append("&");
		stringBuffer.append("pd_FrpId=").append(pd_FrpId).append("&");
		stringBuffer.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
		stringBuffer.append("hmac=").append(hmac).append("&");
		
		ServletActionContext.getResponse().sendRedirect(stringBuffer.toString());
		return NONE;*/
		//显示付款成功的信息
		this.addActionMessage("订单付款成功：订单号："+order.getOid()+" 付款的金额："+currOrder.getTotal());
		return "msg";
	}
	
	/*public String callBack(){
		//修改订单状态，已经付款
		Order currOrder = orderService.findByOid(Integer.parseInt(r6_Order));
		currOrder.setState(2);
		orderService.update(currOrder);
		//显示付款成功的信息
		this.addActionMessage("订单付款成功：订单号："+r6_Order+" 付款的金额："+r3_Amt);
		return "msg";
	}*/
	
	//确认收货
	public String updateState(){
		//根据id查询
				Order currOrder = orderService.findByOid(order.getOid());
				//修改状态
				currOrder.setState(4);
				orderService.update(currOrder);
				return "updateStateSuccess";
	}
	
	//跳转到评论
	public String comment(){
		order = orderService.findByOid(order.getOid());
		return "comment";
	}
}
