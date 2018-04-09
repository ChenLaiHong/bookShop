package com.book.shop.user.service;

import java.security.GeneralSecurityException;
import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.book.shop.user.dao.UserDao;
import com.book.shop.user.vo.User;
import com.book.shop.utils.PageBean;

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
	//注册
	public void save(User user) throws GeneralSecurityException {
		/*user.setAddress("");
		user.setPhone("");
		user.setState(0);*/
		//String code = UUIDUtils.getUUID()+UUIDUtils.getUUID();
		//user.setCode(code);
		userDao.save(user);
		//发送激活邮件
		//	MailUitls.sendMail(user.getEmail(),code);

	}
//业务层根据激活码查询用户
	/*public User findByCode(String code) {

		return userDao.findByCode(code);
	}*/

	public void update(User existUser) {
		userDao.update(existUser);

	}
	//用户登录的方法
	public User login(User user) {

		return userDao.login(user);
	}
	//根据id查找
	public User findByUserUid(Integer uid) {

		return userDao.findByUid(uid);
	}
	//分页查询所有用户
	public PageBean<User> findByPage(int page) {
		PageBean<User> pageBean = new PageBean<User>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示的记录数
		int limit = 10;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit + 1;
		}
		pageBean.setTotalPage(totalPage);
		//设置显示数据集合
		int begin = (page - 1)*limit;
		List<User> list = userDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
}
