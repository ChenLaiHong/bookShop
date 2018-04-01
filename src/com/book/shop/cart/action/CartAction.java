package com.book.shop.cart.action;

import org.apache.struts2.ServletActionContext;

import com.book.shop.book.service.BookService;
import com.book.shop.book.vo.Book;
import com.book.shop.cart.vo.Cart;
import com.book.shop.cart.vo.CartItem;
import com.opensymphony.xwork2.ActionSupport;

//购物车的action
public class CartAction extends ActionSupport{
	//接收bid
	private int bid;
	//接收数量
	private int count;
	//注入图书的service
	private BookService bookService;
	
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public void setCount(int count) {
		this.count = count;
	}

	//将购物添加到购物车执行的方法
	public String addCart(){
		//封装一个CarItem对象
		CartItem cartItem = new CartItem();
		//设置数量
		cartItem.setCount(count);
		//根据bid进行查询
		Book book = bookService.findByBid(bid);
		//设置商品
		cartItem.setBook(book);
		//将购物项添加到购物车
		//购物车存在session中
		Cart cart = getCart();
		cart.addCart(cartItem);
		return "addCart";
	}
//获得购物车的方法
	private Cart getCart() {
		Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			ServletActionContext.getRequest().getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	
	//清空购物车
	public String clearCart(){
		//获得购物车对象
		Cart cart = getCart();
		//调用购物车清空方法
		cart.clearCart();
		return "clearCart";
	}
	
	//移除购物项的方法
	public String removeCart(){
		//获得购物车的对象
		Cart cart = getCart();
		//调用购物车中移除方法
		cart.removeCart(bid);
		//返回页面
		return "removeCart";
	}
	//点击我的购物车后页面跳转
	public String myCart(){
		return "myCart";
	}

}
