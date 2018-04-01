package com.book.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.user.vo.User;

//�û��־ò�
public class UserDao extends HibernateDaoSupport{

	//��ѯ�Ƿ��и��û�
	public User findByUserName(String name){
		String hql = "from User where name = ?";
		List<User> list = this.getHibernateTemplate().find(hql, name);
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
}
