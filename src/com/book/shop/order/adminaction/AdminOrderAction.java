package com.book.shop.order.adminaction;

import java.util.List;

import com.book.shop.order.service.OrderService;
import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminOrderAction extends ActionSupport implements  ModelDriven<Order> {

	private Order order = new Order();
	public Order getModel() {
		
		return order;
	}
	//注入service
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	//接收page
	private int page;
	public void setPage(int page) {
		this.page = page;
	}
	
	//带分页查询
	public String findAll(){
		 PageBean<Order> pageBean = orderService.findByPage(page);
		 //把数据保存到值栈
		 ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		 //页面跳转
		 return "findAll";
	}
//根据订单id查询订单项
	public String findOrderItem(){
		//根据id查询
		List<OrderItem> list = orderService.findOrderItem(order.getOid());
		//通过值栈显示到页面上
		ActionContext.getContext().getValueStack().set("list", list);
		return "findOrderItem";
	}
	
	//后台修改订单状态
	public String updateState(){
		//根据id查询
		Order currOrder = orderService.findByOid(order.getOid());
		//修改状态
		currOrder.setState(3);
		orderService.update(currOrder);
		return "updateStateSuccess";
	}
}
