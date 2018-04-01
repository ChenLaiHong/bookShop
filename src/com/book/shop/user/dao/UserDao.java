package com.book.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.user.vo.User;

//用户持久层
public class UserDao extends HibernateDaoSupport{

	//查询是否有该用户
	public User findByUserName(String name){
		String hql = "from User where name = ?";
		List<User> list = this.getHibernateTemplate().find(hql, name);
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
}
