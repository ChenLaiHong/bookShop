package com.book.shop.user.service;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.user.dao.UserDao;
import com.book.shop.user.vo.User;

//用户业务层
@Transactional
public class UserService {
//注入userDao
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	public User findByUserName(String name){
		return userDao.findByUserName(name);
	}
//业务层完成用户代码
	public void save(User user) {
		user.setState(0); //0代表还没有激活  1代表已经激活
		
		
	}
}
