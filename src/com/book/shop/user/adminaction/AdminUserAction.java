package com.book.shop.user.adminaction;

import java.util.List;

import com.book.shop.category.vo.Category;
import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.user.service.UserService;
import com.book.shop.user.vo.User;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminUserAction extends ActionSupport implements  ModelDriven<User>{

	private User user = new User();
	
	private UserService userService;
	
	//接收page
	private int page;
	public void setPage(int page) {
		this.page = page;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public User getModel() {
		return user;
	}
	
	
		//查询二级分类
		public String findAll(){
			PageBean<User> pageBean = userService.findByPage(page);
		//将pageBean的数据存到值栈中
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findAll";
		}
	

}
