package com.book.shop.comment.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.comment.dao.CommentDao;
import com.book.shop.comment.vo.Comment;
import com.book.shop.order.vo.Order;
import com.book.shop.utils.PageBean;
@Transactional
public class CommentService {

	private CommentDao commentDao;
	
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	public void add(Comment comment) {
		commentDao.add(comment);
		
	}
//查询评论
	public PageBean<Comment> findByPage(int page) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		// 设置当前页数
		pageBean.setPage(page);
		// 设置每页显示的记录数
		int limit = 10;
		pageBean.setLimit(limit);
		// 设置总记录数

		int totalCount = commentDao.findByCount();
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
		List<Comment> list = commentDao.findByPage(begin, limit);
		pageBean.setList(list);
		return pageBean;
	}

}
