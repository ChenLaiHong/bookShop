package com.book.shop.book.vo;

import java.util.Date;


import com.book.shop.categorysecond.vo.CategorySecond;

//书的实体类
public class Book {

	private int bid;
	private String bname;
	private String author;
	private String book_concern;
	private double shop_price;
	private double market_price;
	private String book_desc;
	private String image;
	private int is_hot;
	private Date bdate;
	private Integer number;

	//二级分类的外键：使用二级分类对象
	private CategorySecond categorySecond;

	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}



	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getBook_concern() {
		return book_concern;
	}
	public void setBook_concern(String book_concern) {
		this.book_concern = book_concern;
	}
	public double getShop_price() {
		return shop_price;
	}
	public void setShop_price(double shop_price) {
		this.shop_price = shop_price;
	}
	public double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(double market_price) {
		this.market_price = market_price;
	}
	public String getBook_desc() {
		return book_desc;
	}
	public void setBook_desc(String book_desc) {
		this.book_desc = book_desc;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(int is_hot) {
		this.is_hot = is_hot;
	}
	public Date getBdate() {
		return bdate;
	}
	public void setBdate(Date bdate) {
		this.bdate = bdate;
	}

}
