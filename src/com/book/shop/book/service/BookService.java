package com.book.shop.book.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.book.dao.BookDao;
import com.book.shop.book.vo.Book;
import com.book.shop.utils.PageBean;
@Transactional
public class BookService {
//ע��bookDao
	private BookDao bookDao;

	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
//��ҳ����ͼ���ѯ
	public List<Book> findHot() {
		
		return bookDao.findHot();
	}
	public List<Book> findNew() {
		
		return bookDao.findNew();
	}
	//����id��ѯͼ��
	public Book findByBid(int bid) {
		
		return bookDao.findByBid(bid);
	}
	//����һ���������ҳ��ѯͼ��
	public PageBean<Book> findByPageCid(int cid, int page) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//���õ�ǰҳ
		pageBean.setPage(page);
		//����ÿҳ��ʾ��¼��
		int limit = 12;
		pageBean.setLimit(limit);
		//�����ܼ�¼��
		int totalCount = 0;
		totalCount = bookDao.findCountCid(cid);
		pageBean.setTotalCount(totalCount);
		//������ҳ��
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//���Ŀ�ʼ
		int begin = (page -1) * limit;
		List<Book> list = bookDao.findByPageCid(cid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	public PageBean<Book> findByPageCsid(int csid, int page) {
		PageBean<Book> pageBean = new PageBean<Book>();
		//���õ�ǰҳ
		pageBean.setPage(page);
		//����ÿҳ��ʾ��¼��
		int limit = 12;
		pageBean.setLimit(limit);
		//�����ܼ�¼��
		int totalCount = 0;
		totalCount = bookDao.findCountCsid(csid);
		pageBean.setTotalCount(totalCount);
		//������ҳ��
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		//���Ŀ�ʼ
		int begin = (page -1) * limit;
		List<Book> list = bookDao.findByPageCsid(csid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	
	
}
