package com.book.shop.adminuser.action;

import com.book.shop.adminuser.service.AdminUserService;
import com.book.shop.adminuser.vo.AdminUser;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

/**
 * Created by CHLaih on 2018/4/9.
 */
public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
    //使用模型驱动
    private AdminUser adminUser = new AdminUser();
    public AdminUser getModel() {

        return adminUser;
    }
    //注入service
    private AdminUserService adminUserService;
    public void setAdminUserService(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    //后台登录的方法
    public String login(){
        //调用service
        AdminUser existAdminUser = adminUserService.login(adminUser);
        if(existAdminUser == null){
            //登录失败
            this.addActionError("亲！您的用户名或密码错误！");
            return "loginFail";
        }else{
            //登录成功
            ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
        }
        return "loginSuccess";
    }
    //跳转到后台登录页面
    public String loginPage(){

        return "loginPage";
    }
}
