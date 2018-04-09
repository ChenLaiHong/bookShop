package com.book.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.user.vo.User;
import com.book.shop.utils.PageHibernateCallback;

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
	//往数据库插入注册用户数据
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}
	//根据激活码查询用户
/*	public User findByCode(String code) {
		String hql = "from User where code = ?";
		List<User> list = this.getHibernateTemplate().find(hql, code);
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
	*/
	public void update(User existUser) {
		this.getHibernateTemplate().update(existUser);

	}
	//用户登录
	public User login(User user) {
		String hql = "from User where name = ? and password = ?";
		List<User> list = this.getHibernateTemplate().find(hql, user.getName(),user.getPassword());
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
	//根据id查找用户

	public User findByUid(Integer uid) {
		String hql = "from User where uid = ?";
		List<User> list = this.getHibernateTemplate().find(hql, uid);
		if(list != null && list.size()>0){
			return list.get(0);
		}
		return null;
	}
	//查询用户数量
	public int findCount() {
		String hql = "select count(*) from User";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list !=null && list.size()>0){
			return list.get(0).intValue();
		}
		return list.get(0).intValue();
	}
	//分页查询用户
	public List<User> findByPage(int begin, int limit) {
		String hql = "from User order by uid desc";
		List<User> list = this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql,null,begin,limit));
		if(list !=null && list.size()>0){
			return list;
		}
		return null;
	}
}
