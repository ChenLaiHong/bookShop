package com.book.shop.user.action;

import java.io.IOException;
import java.security.GeneralSecurityException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.book.shop.user.service.UserService;
import com.book.shop.user.vo.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User> {

	private User user = new User();
	private int uid;

	public void setUid(int uid) {
		this.uid = uid;
	}
	private String password;

	public void setPassword(String password) {
		this.password = password;
	}
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

	public String regist() throws GeneralSecurityException{
		userService.save(user);
		this.addActionMessage("注册成功！请去登录！");
		return "msg";
	}
	//用户激活的方法
/*	public String active(){
		//根据激活码查询用户
		User existUser = userService.findByCode(user.getCode());
		if(existUser == null){
			this.addActionMessage("激活失败：激活码错误！");
		}else{
			//激活成功，修改用户的状态
			existUser.setState(1);
			existUser.setCode(null);
			userService.update(existUser);
			this.addActionMessage("激活成功：请去登录！");
		}
		return "msg";
	}
	*/
	//跳转到登录页面
	public String loginPage(){
		return "loginPage";
	}

	//登录方法
	public String login(){
		User existUser = userService.login(user);
		if(existUser == null){
			//登录失败
			this.addActionError("登录失败：用户名错误或密码！");
			return LOGIN;
		}else{
			//登录成功
			ServletActionContext.getRequest().getSession()
					.setAttribute("existUser", existUser);
			//页面跳转
			return "loginSuccess";
		}
	}
	/**
	 * 用户退出的方法
	 */
	public String quit(){
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

	//跳转到修改信息页面
	public String updateInfo(){
		return "updateInfo";
	}
	//修改信息
	public String update(){

		userService.update(user);
		this.addActionMessage("修改成功！请重新登陆！");
		return "updateSuccess";
	}

	//异步校验密码
	public String findByPass() throws IOException{
		//调用Service层进行查询
		User existUser=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		String passwordB = existUser.getPassword();

		//获取response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		//判断
		if(passwordB.equals(user.getPassword())){
			//查询到该用户密码
			response.getWriter().println("<font color='green'>原密码正确</font>");
		}else{
			response.getWriter().println("<font color='red'>原密码错误</font>");

		}
		return NONE;
	}

	//跳转到修改密码页面
	public String updatePass(){
		return "updatePass";
	}
	//修改密码
	public String updateUserPass(){
		User existUser=(User) ServletActionContext.getRequest().getSession().getAttribute("existUser");
		existUser.setPassword(user.getPassword());
		userService.update(existUser);
		this.addActionMessage("修改成功！请重新登陆！");
		return "updatePassSuccess";
	}
}
