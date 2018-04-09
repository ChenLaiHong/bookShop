package com.book.shop.adminuser.service;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.adminuser.dao.AdminUserDao;
import com.book.shop.adminuser.vo.AdminUser;

@Transactional
public class AdminUserService {
	
	//注入dao
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}
//后台登录
	public AdminUser login(AdminUser adminUser) {
		
		return adminUserDao.login(adminUser);
	}
	
	

}
