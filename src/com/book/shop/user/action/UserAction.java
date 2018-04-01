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
	//ע��userService
	private UserService userService;
	 
	public void setUserService(UserService userService){
		this.userService = userService;
	}
	//��ת��ע��ҳ��
	public String registPage(){
		return "registPage";
	}
	
	//�첽У���Ƿ�����û�
	public String findByName() throws IOException{
		 //����Service����в�ѯ
		System.out.println("============"+user.getName());
		User existUser = userService.findByUserName(user.getName());
		//��ȡresponse����
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		//�ж�
		if(existUser != null){
			//��ѯ�����û�
			response.getWriter().println("<font color='red'>�û��Ѿ�����</font>");
		}else{
			response.getWriter().println("<font color='green'>�û�����ʹ��</font>");
			
		}
		return NONE;
	}
	
	public String regist(){
		userService.save(user);
		return NONE;
	}
	
}
