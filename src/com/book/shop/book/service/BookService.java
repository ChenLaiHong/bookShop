package com.book.shop.book.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.book.dao.BookDao;
import com.book.shop.book.vo.Book;
import com.book.shop.utils.PageBean;
@Transactional
public class BookService {
	//注入bookDao
	private BookDao bookDao;

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	//首页热门图书查询
	public List<Book> findHot() {

		return bookDao.findHot();
	}
	public List<Book> findNew() {

		return bookDao.findNew();
	}
	//根据id查询图书
	public Book findByBid(int bid) {

		return bookDao.findByBid(bid);
	}
	//根据一级分类带分页查询图书
	public PageBean<Book> findByPageCid(int cid, int page) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//设置当前页
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 12;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = bookDao.findCountCid(cid);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//从哪开始
		int begin = (page -1) * limit;
		List<Book> list = bookDao.findByPageCid(cid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	public PageBean<Book> findByPageCsid(int csid, int page) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//设置当前页
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 12;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = bookDao.findCountCsid(csid);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//从哪开始
		int begin = (page -1) * limit;
		List<Book> list = bookDao.findByPageCsid(csid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	//搜索图书分页显示
	public PageBean<Book> search(String title, int page) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//设置当前页
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 12;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = bookDao.searchCount(title);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//从哪开始
		int begin = (page -1) * limit;
		List<Book> list = bookDao.searchPage(title,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	//后台查询所有图书
	public PageBean<Book> findByPage(int page) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//设置当前页
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 10;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = bookDao.findCount();
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//从哪开始
		int begin = (page -1) * limit;
		List<Book> list = bookDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	//保存图书
	public void save(Book book) {
		bookDao.save(book);

	}
	//删除图书信息
	public void delete(Book book) {
		bookDao.delete(book);

	}
	//修改图书信息
	public void update(Book book) {
		bookDao.update(book);

	}



}
