package com.book.shop.order.vo;

import java.util.Date;

import com.book.shop.book.vo.Book;

//订单模块：订单项
public class OrderItem {

	private int itemid;
	private int count;
	private double subtotal;
	private Date time;
	

	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	private Book book;
	private Order order;
	
	public int getItemid() {
		return itemid;
	}
	public void setItemid(int itemid) {
		this.itemid = itemid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	
	
	
}
