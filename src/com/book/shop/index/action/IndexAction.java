package com.book.shop.index.action;

import java.util.List;

import com.book.shop.book.service.BookService;
import com.book.shop.book.vo.Book;
import com.book.shop.category.service.CategoryService;
import com.book.shop.category.vo.Category;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class IndexAction extends ActionSupport{
	//注入一级分类的service
	private CategoryService categoryService;

	//注入图书的service
	private BookService bookService;

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public String execute(){
		List<Category> cList = categoryService.findAll();
		//将一级分类存到session
		ActionContext.getContext().getSession().put("cList", cList);
		List<Book> hList = bookService.findHot();
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("hList", hList);

		//查询最新图书
		List<Book> nList = bookService.findNew();
		//保存到值栈中
		ActionContext.getContext().getValueStack().set("nList", nList);

		return "index";
	}
}
