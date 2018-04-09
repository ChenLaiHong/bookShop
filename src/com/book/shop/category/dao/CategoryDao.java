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
	//dao层保存一级分类
	public void save(Category category) {
		this.getHibernateTemplate().save(category);

	}
	//根据cid查询
	public Category findByCid(int cid) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Category.class, cid);
	}
	//删除一级分类
	public void delete(Category category) {
		this.getHibernateTemplate().delete(category);

	}
	//dao层修改一级分类
	public void update(Category category) {
		this.getHibernateTemplate().update(category);

	}



}
