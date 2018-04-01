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
	
}
