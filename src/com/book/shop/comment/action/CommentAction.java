package com.book.shop.comment.action;

import java.util.Date;

import org.apache.struts2.ServletActionContext;

import com.book.shop.comment.service.CommentService;
import com.book.shop.comment.vo.Comment;
import com.book.shop.order.service.OrderService;
import com.book.shop.order.vo.Order;
import com.book.shop.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CommentAction extends ActionSupport implements  ModelDriven<Comment>{

	private Comment comment = new Comment();
	private CommentService commentService;
	private OrderService orderService;
	private int oid;
	

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public Comment getModel() {
		return comment;
	}
	
	public String add(){
		Order order = orderService.findByOid(oid);
		comment.setComment(comment.getComment());
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		comment.setCommenter(user.getName());
		comment.setTime(new Date());
		comment.setOrder(order);
		commentService.add(comment);
		this.addActionMessage("评论成功！");
		
		return "commentSuccess";
	}

}
