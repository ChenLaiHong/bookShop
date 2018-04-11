package com.book.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.utils.PageHibernateCallback;

//订单模块持久层
public class OrderDao extends HibernateDaoSupport{
//Dao保存订单的方法
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
		
	}
//我的订单的个数
	public Integer findByCountUid(Integer uid) {
		String hql = "select count(*) from Order o where o.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return null;
	}
//我的订单的查询
	public List<Order> findByPageUid(Integer uid, Integer begin, int limit) {
		String hql = "from Order o where o.user.uid = ? order by time desc";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql,new Object[]{uid},begin,limit));
		return list;
	}
	//根据订单id查询
	public Order findByOid(int oid) {
		
		return this.getHibernateTemplate().get(Order.class, oid);
	}
	//修改订单
	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);
		
	}
	//统计订单数
	public int findByCount() {
		String hql = "select count(*) from Order";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//分页查询
	public List<Order> findByPage(int begin, int limit) {
		String hql = "from Order order by time desc";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql,null,begin,limit));
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}
	//根据订单id查询订单项
	public List<OrderItem> findOrderItem(int oid) {
		String hql = "from OrderItem oi where oi.order.oid = ?";
		List<OrderItem> list = this.getHibernateTemplate().find(hql,oid);
		if(list != null && list.size()>0){
			return list;
		}
		return null;
	}

}
