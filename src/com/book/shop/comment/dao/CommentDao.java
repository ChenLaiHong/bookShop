package com.book.shop.comment.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.comment.vo.Comment;
import com.book.shop.utils.PageHibernateCallback;

public class CommentDao extends HibernateDaoSupport{

	public void add(Comment comment) {
		this.getHibernateTemplate().save(comment);
		
	}
//统计评论数量
	public int findByCount() {
		String hql = "select count(*) from Comment";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return list.get(0).intValue();
	}
//分页查询评论
	public List<Comment> findByPage(int begin, int limit) {
		String hql = "from Comment order by oid desc";
		List<Comment> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Comment>(hql,null,begin,limit));
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}

}
