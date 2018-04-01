package com.book.shop.user.service;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.user.dao.UserDao;
import com.book.shop.user.vo.User;

//�û�ҵ���
@Transactional
public class UserService {
//ע��userDao
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao){
		this.userDao = userDao;
	}
	
	public User findByUserName(String name){
		return userDao.findByUserName(name);
	}
//ҵ�������û�����
	public void save(User user) {
		user.setState(0); //0����û�м���  1�����Ѿ�����
		
		
	}
}
