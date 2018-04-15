package com.book.shop.category.adminaction;

import java.util.List;

import com.book.shop.category.service.CategoryService;
import com.book.shop.category.vo.Category;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategoryAction extends ActionSupport implements  ModelDriven<Category>{
//后台模型驱动使用
	private Category category = new Category();
	
	public Category getModel() {
		return category;
	}
//注入service
	private CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	//后台查询所有一级分类
	public String findAll(){
		//查询所有一级分类
	List<Category> cList=categoryService.findAll();
	//将集合放到值栈
	ActionContext.getContext().getValueStack().set("cList", cList);
	return "findAll";
	}
	
	//保存一级分类
	public String save(){
		//调用service
		categoryService.save(category);
		//页面跳转
		return "saveSuccess";
	}
	
	//删除一级分类
	public String delete(){
		//接收cid可以利用模型驱动,一级分类下的二级分类都删除
		category = categoryService.findByCid(category.getCid());
		//进行删除
		categoryService.delete(category);
		return "deleteSuccess";
	}
	
	//编辑一级分类
	public String edit(){
		category = categoryService.findByCid(category.getCid());
		return "editSuccess";
	}
	//后台修改一级分类
	public String update(){
		categoryService.update(category);
		return "updateSuccess";
	}
}
