package com.book.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.category.vo.Category;

//一级分类的持久层
public class CategoryDao extends HibernateDaoSupport{
//Dao层查询所有一级分类
	public List<Category> findAll() {
		String hql = "from Category";
		List<Category> list = this.getHibernateTemplate().find(hql);
		
		return list;
	}
	

}
