package com.book.shop.cart.vo;

import com.book.shop.book.vo.Book;



/**
 * 购物项对象
 *
 *
 */
public class CartItem {
	private Book book;	// 购物项中图书信息
	private int count;			// 购买某种图书数量
	private double subtotal;	// 购买某种图书小计
	public Book getBook() {
		return book;
	}
	public void setBook(Book book) {
		this.book = book;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	// 小计自动计算的.
	public double getSubtotal() {
		return count * book.getShop_price();
	}


}
