package com.book.shop.book.dao;

import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.book.vo.Book;
import com.book.shop.utils.PageHibernateCallback;

//ͼ��־ò�
public class BookDao extends HibernateDaoSupport{
//��ҳ���ŵ�ͼ���ѯ
	public List<Book> findHot() {
		//ʹ������������ѯ
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		//��ѯ����is_hot=1
		criteria.add(Restrictions.eq("is_hot",1));
		//�����������
		criteria.addOrder(Order.desc("bdate"));
		//ִ�в�ѯ
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 10);
		return list;
	}
//��ҳ����ͼ���ѯ
	public List<Book> findNew() {
		DetachedCriteria criteria = DetachedCriteria.forClass(Book.class);
		//�����������
		criteria.addOrder(Order.desc("bdate"));
		List<Book> list = this.getHibernateTemplate().findByCriteria(criteria, 0, 15);
		
		return list;
	}
	//����ͼ��id��ѯͼ��
	public Book findByBid(int bid) {
		
		return this.getHibernateTemplate().get(Book.class, bid);
	}
	//���ݷ���id��ѯͼ�����
	public int findCountCid(int cid) {
		String hql = "select count(*) from Book b where b.categorySecond.category.cid=?";
		List<Long> list = this.getHibernateTemplate().find(hql, cid);
		if(list !=null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//���ݷ���id��ѯͼ�鼯��
	public List<Book> findByPageCid(int cid, int begin, int limit) {
		String hql = "select b from Book b join b.categorySecond cs join cs.category c where c.cid = ?";
		//��ҳ
		List<Book> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(hql,new Object[]{cid},begin,limit));
		if(list !=null && list.size() > 0){
			return list;
		}
		return null;
	}
	//���ݶ��������ѯͼ�����
	public int findCountCsid(int csid) {
		String hql = "select count(*) from Book b where b.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list !=null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//���ݶ��������ѯͼ����Ϣ
	public List<Book> findByPageCsid(int csid, int begin, int limit) {
		String hql = "select b from Book b join b.categorySecond cs where cs.csid = ?";
		List<Book> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Book>(hql,new Object[]{csid},begin,limit));
		if(list !=null && list.size() > 0){
			return list;
		}
		return null;
	}
	

}
