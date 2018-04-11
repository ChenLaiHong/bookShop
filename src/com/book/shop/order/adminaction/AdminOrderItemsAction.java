package com.book.shop.order.adminaction;

import com.book.shop.order.service.OrderItemService;
import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminOrderItemsAction extends ActionSupport implements  ModelDriven<OrderItem>{

	private OrderItem orderItem;
	public OrderItem getModel() {
		return orderItem;
	}
	private OrderItemService orderItemService;
	private int page;
	
	public void setOrderItemService(OrderItemService orderItemService) {
		this.orderItemService = orderItemService;
	}

	public void setPage(int page) {
		this.page = page;
	}

	//带分页查询
	public String findAll(){
		 PageBean<OrderItem> pageBean = orderItemService.findByPage(page);
		 //把数据保存到值栈
		 ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		 //页面跳转
		 return "findAll";
	}

}
