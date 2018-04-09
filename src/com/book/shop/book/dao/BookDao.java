package com.book.shop.book.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.book.vo.Book;
import com.book.shop.utils.PageHibernateCallback;

//图书持久层
public class BookDao extends HibernateDaoSupport{
	//首页热门的图书查询
	public List<Book> findHot() {
		//使用离线条件查询
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		//查询条件is_hot=1
		criteria.add(Restrictions.eq("is_hot",1));
		//倒序排序输出
		criteria.addOrder(Order.desc("bdate"));
		//执行查询
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
	//首页最新图书查询
	public List<Book> findNew() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		//倒序排序输出
		criteria.addOrder(Order.desc("bdate"));
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 15);

		return list;
	}
	//根据图书id查询图书
	public Book findByBid(int bid) {

		return this.getHibernateTemplate().get(Book.class, bid);
	}
	//根据分类id查询图书个数
	public int findCountCid(int cid) {
		String hql = "select count(*) from Book b where b.categorySecond.category.cid=?";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if(list !=null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//根据分类id查询图书集合
	public List<Book> findByPageCid(int cid, int begin, int limit) {
		String hql = "select b from Book b join b.categorySecond cs join cs.category c where c.cid = ?";
		//分页
		List<Book> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(hql,new Object[]{cid},begin,limit));
		if(list !=null && list.size() > 0){
			return list;
		}
		return null;
	}
	//根据二级分类查询图书个数
	public int findCountCsid(int csid) {
		String hql = "select count(*) from Book b where b.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list !=null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//根据二级分类查询图书信息
	public List<Book> findByPageCsid(int csid, int begin, int limit) {
		String hql = "select b from Book b join b.categorySecond cs where cs.csid = ?";
		List<Book> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(hql,new Object[]{csid},begin,limit));
		if(list !=null && list.size() > 0){
			return list;
		}
		return null;
	}


	//根据输入内容查找图书数量
	public int searchCount(String title) {
		String hql = "select count(*) from Book b where b.bname like '%"+title+"%'";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() >0){
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<Book> searchPage(String title, int begin, int limit) {
		String hql = "from Book b where b.bname like '%"+title+"%'";
		List<Book> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(hql,null,begin,limit));
		if(list !=null && list.size() > 0){
			return list;
		}
		return null;
	}
	//统计所有图书个数
	public int findCount() {
		String hql = "select count(*) from Book";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() >0){
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<Book> findByPage(int begin, int limit) {
		String hql = "from Book order by bdate desc";
		List<Book> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(hql,null,begin,limit));
		if(list !=null && list.size() > 0){
			return list;
		}
		return null;
	}
	//保存
	public void save(Book book) {
		this.getHibernateTemplate().save(book);

	}
	//删除图书
	public void delete(Book book) {
		this.getHibernateTemplate().delete(book);

	}
	//修改图书信息
	public void update(Book book) {
		this.getHibernateTemplate().update(book);

	}


}
