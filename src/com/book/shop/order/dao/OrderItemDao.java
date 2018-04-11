package com.book.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.utils.PageHibernateCallback;

public class OrderItemDao extends HibernateDaoSupport {

	public int findByCount() {
		String hql = "select count(*) from OrderItem";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<OrderItem> findByPage(int begin, int limit) {
		String hql = "from OrderItem order by time desc";
		List<OrderItem> list = this.getHibernateTemplate().execute(new PageHibernateCallback<OrderItem>(hql,null,begin,limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

}
