package com.book.shop.comment.vo;

import java.util.Date;

import com.book.shop.order.vo.Order;

public class Comment {

	private int comment_id;
	private String comment;
	private Date time;
	private String commenter;
	private Order order;
	
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
}
