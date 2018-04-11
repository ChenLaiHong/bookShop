package com.book.shop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.order.dao.OrderItemDao;
import com.book.shop.order.vo.Order;
import com.book.shop.order.vo.OrderItem;
import com.book.shop.utils.PageBean;

@Transactional
public class OrderItemService {

	private OrderItemDao orderItemDao;
	
	public void setOrderItemDao(OrderItemDao orderItemDao) {
		this.orderItemDao = orderItemDao;
	}

	public PageBean<OrderItem> findByPage(int page) {
		PageBean<OrderItem> pageBean = new PageBean<OrderItem>();
		// 设置当前页数
		pageBean.setPage(page);
		// 设置每页显示的记录数
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数

		int totalCount = orderItemDao.findByCount();
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
		List<OrderItem> list = orderItemDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

}
