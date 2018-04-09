package com.book.shop.book.action;

import org.apache.struts2.ServletActionContext;

import com.book.shop.book.service.BookService;

import com.book.shop.book.vo.Book;
import com.book.shop.category.service.CategoryService;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

//图书action
public class BookAction extends ActionSupport implements ModelDriven<Book>{
	//用于接收数据的模型驱动
	private Book book = new Book();
	public Book getModel() {
		return book;
	}
	//注入bookService
	private BookService bookService;

	//接收一级分类的cid
	private int cid;
	//注入一级分类service
	private CategoryService categoryService;
	//接收当前的页数
	private int page;
	//接收二级分类的id
	private int csid;
	//接收查找的的内容
	private String title;


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

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



	//根据id查询图书
	public String findByBid(){
		//调用service方法完成查询
		book = bookService.findByBid(book.getBid());
		return "findByBid";
	}

	//根据分类的id查询图书
	public String findByCid(){
		PageBean<Book> pageBean = bookService.findByPageCid(cid,page);
		//将pageBean存入到值栈
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}

	//根据二级分类id查询
	public String findByCsid(){

//		根据二级分类查询图书
		PageBean<Book> pageBean = bookService.findByPageCsid(csid,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);

		return "findByCsid";
	}

	//根据输入内容进行模糊搜索
	public String search(){
		if(!title.isEmpty()){
			ServletActionContext.getRequest().getSession()
					.setAttribute("title", title);
		}
		PageBean<Book> pageBean = bookService.search(title,page);
		if(pageBean != null){
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "search";
		}else{
			this.addActionError("您好！没有您搜索的相应内容，请换个词呗！");
			return "msg";
		}
	}
}
