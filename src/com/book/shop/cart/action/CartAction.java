package com.book.shop.cart.action;

import org.apache.struts2.ServletActionContext;

import com.book.shop.book.service.BookService;
import com.book.shop.book.vo.Book;
import com.book.shop.cart.vo.Cart;
import com.book.shop.cart.vo.CartItem;
import com.opensymphony.xwork2.ActionSupport;

//���ﳵ��action
public class CartAction extends ActionSupport{
	//����bid
	private int bid;
	//��������
	private int count;
	//ע��ͼ���service
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

	//��������ӵ����ﳵִ�еķ���
	public String addCart(){
		//��װһ��CarItem����
		CartItem cartItem = new CartItem();
		//��������
		cartItem.setCount(count);
		//����bid���в�ѯ
		Book book = bookService.findByBid(bid);
		//������Ʒ
		cartItem.setBook(book);
		//����������ӵ����ﳵ
		//���ﳵ����session��
		Cart cart = getCart();
		cart.addCart(cartItem);
		return "addCart";
	}
//��ù��ﳵ�ķ���
	private Cart getCart() {
		Cart cart = (Cart) ServletActionContext.getRequest().getSession().getAttribute("cart");
		if(cart == null){
			cart = new Cart();
			ServletActionContext.getRequest().getSession().setAttribute("cart", cart);
		}
		return cart;
	}
	
	//��չ��ﳵ
	public String clearCart(){
		//��ù��ﳵ����
		Cart cart = getCart();
		//���ù��ﳵ��շ���
		cart.clearCart();
		return "clearCart";
	}
	
	//�Ƴ�������ķ���
	public String removeCart(){
		//��ù��ﳵ�Ķ���
		Cart cart = getCart();
		//���ù��ﳵ���Ƴ�����
		cart.removeCart(bid);
		//����ҳ��
		return "removeCart";
	}
	//����ҵĹ��ﳵ��ҳ����ת
	public String myCart(){
		return "myCart";
	}

}
