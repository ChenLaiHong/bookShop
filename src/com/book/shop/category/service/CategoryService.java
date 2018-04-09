package com.book.shop.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.category.dao.CategoryDao;
import com.book.shop.category.vo.Category;

//一级分类业务层
@Transactional
public class CategoryService {
	//注入categoryDao
	private CategoryDao categoryDao;


	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	//查询所有一级分类的方法
	public List<Category> findAll() {

		return categoryDao.findAll();
	}
	//后台保存一级分类
	public void save(Category category) {
		categoryDao.save(category);

	}
	//根据cid查询一级分类
	public Category findByCid(int cid) {
		// TODO Auto-generated method stub
		return categoryDao.findByCid(cid);
	}
//业务层删除一级分类

	public void delete(Category category) {
		categoryDao.delete(category);

	}
	//修改一级分类信息
	public void update(Category category) {
		categoryDao.update(category);

	}


}
