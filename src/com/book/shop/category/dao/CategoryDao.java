package com.book.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.category.vo.Category;

//һ������ĳ־ò�
public class CategoryDao extends HibernateDaoSupport{
//Dao���ѯ����һ������
	public List<Category> findAll() {
		String hql = "from Category";
		List<Category> list = this.getHibernateTemplate().find(hql);
		
		return list;
	}
	

}
