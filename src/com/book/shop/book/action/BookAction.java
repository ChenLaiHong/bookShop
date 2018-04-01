package com.book.shop.book.action;

import com.book.shop.book.service.BookService;

import com.book.shop.book.vo.Book;
import com.book.shop.category.service.CategoryService;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

//ͼ��action
public class BookAction extends ActionSupport implements ModelDriven<Book>{
//���ڽ������ݵ�ģ������
	private Book book = new Book();
	public Book getModel() {
		return book;
	}
	//ע��bookService
	private BookService bookService;
	
	//����һ�������cid
	private int cid;
	//ע��һ������service
	private CategoryService categoryService;
	//���յ�ǰ��ҳ��
	private int page;
	//���ն��������id
	private int csid;
	

	public int getCsid() {
		return csid;
	}

	public void setCsid(int csid) {
		this.csid = csid;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getCid() {
		return cid;
	}

	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}



	//����id��ѯͼ��
	public String findByBid(){
		//����service������ɲ�ѯ
	    book = bookService.findByBid(book.getBid());
		return "findByBid";
	}
	
	//���ݷ����id��ѯͼ��
	public String findByCid(){
		PageBean<Book> pageBean = bookService.findByPageCid(cid,page);
		//��pageBean���뵽ֵջ
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}
	
	//���ݶ�������id��ѯ
	public String findByCsid(){
		
//		���ݶ��������ѯͼ��
		PageBean<Book> pageBean = bookService.findByPageCsid(csid,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "findByCsid";
	}

}
