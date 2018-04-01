package com.book.shop.user.action;

import java.io.IOException;


import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.book.shop.user.service.UserService;
import com.book.shop.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {
	
	private User user = new User();
	
	public User getModel() {
		return user;
	} 
	//注入userService
	private UserService userService;
	 
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	//跳转到注册页面
	public String registPage(){
		return "registPage";
	}
	
	//异步校验是否存在用户
	public String findByName() throws IOException{
		 //调用Service层进行查询
		System.out.println("============"+user.getName());
		User existUser = userService.findByUserName(user.getName());
		//获取response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		//判断
		if(existUser != null){
			//查询到该用户
			response.getWriter().println("<font color='red'>用户已经存在</font>");
		}else{
			response.getWriter().println("<font color='green'>用户可以使用</font>");
			
		}
		return NONE;
	}
	
	public String regist(){
		userService.save(user);
		return NONE;
	}
	
}
