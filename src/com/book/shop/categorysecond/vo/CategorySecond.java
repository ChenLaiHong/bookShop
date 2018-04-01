package com.book.shop.categorysecond.vo;

import java.util.HashSet;
import java.util.Set;

import com.book.shop.book.vo.Book;
import com.book.shop.category.vo.Category;

//��������ʵ����
public class CategorySecond {

	private int csid;
	private String csname;
	//����һ������,�����һ������ʵ��
	private Category category;
	//����ͼ�鼯��
	private Set<Book> books = new HashSet<Book>();
	
	public Set<Book> getBooks() {
		return books;
	}
	public void setBooks(Set<Book> books) {
		this.books = books;
	}
	public int getCsid() {
		return csid;
	}
	public void setCsid(int csid) {
		this.csid = csid;
	}
	public String getCsname() {
		return csname;
	}
	public void setCsname(String csname) {
		this.csname = csname;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	
}
