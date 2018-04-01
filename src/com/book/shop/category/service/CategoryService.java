package com.book.shop.category.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.category.dao.CategoryDao;
import com.book.shop.category.vo.Category;

//һ������ҵ���
@Transactional
public class CategoryService {
//ע��categoryDao
	private CategoryDao categoryDao;


	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

//��ѯ����һ������ķ���
	public List<Category> findAll() {
		
		return categoryDao.findAll();
	}
	
}
