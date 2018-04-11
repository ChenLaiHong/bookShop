package com.book.shop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.order.dao.OrderDao;
import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.utils.PageBean;

//订单模块的业务层
@Transactional
public class OrderService {

	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	// 保存订单
	public void save(Order order) {
		orderDao.save(order);

	}

	// 我的订单的业务层代码
	public PageBean<Order> findByPageUid(Integer uid, int page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		// 设置当前页数
		pageBean.setPage(page);
		// 设置每页显示的记录数
		int limit = 5;
		pageBean.setLimit(limit);
		// 设置总记录数
		Integer totalCount = null;
		totalCount = orderDao.findByCountUid(uid);
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		Integer totalPage = null;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合
		Integer begin = (page - 1) * limit;
		List<Order> list = orderDao.findByPageUid(uid, begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

	// 根据订单id查询订单
	public Order findByOid(int oid) {

		return orderDao.findByOid(oid);
	}

	// 业务层修改订单
	public void update(Order currOrder) {
		orderDao.update(currOrder);

	}

	// 查询订单
	public PageBean<Order> findByPage(int page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		// 设置当前页数
		pageBean.setPage(page);
		// 设置每页显示的记录数
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数

		int totalCount = orderDao.findByCount();
		pageBean.setTotalCount(totalCount);
		// 设置总页数
		int totalPage = 0;
		if (totalCount % limit == 0) {
			totalPage = totalCount / limit;
		} else {
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		// 设置每页显示数据集合
		int begin = (page - 1) * limit;
		List<Order> list = orderDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}
//根据订单id查询订单项
	public List<OrderItem> findOrderItem(int oid) {
		
		return orderDao.findOrderItem(oid);
	}

}
