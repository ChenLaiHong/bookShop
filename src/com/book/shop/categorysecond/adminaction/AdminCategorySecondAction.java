package com.book.shop.categorysecond.adminaction;

import java.util.List;

import com.book.shop.category.service.CategoryService;
import com.book.shop.category.vo.Category;
import com.book.shop.categorysecond.service.CategorySecondService;
import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
//后台二级分类的action
public class AdminCategorySecondAction extends ActionSupport implements  ModelDriven<CategorySecond>{

	private CategorySecond categorySecond = new CategorySecond();
	//模型驱动使用到的对象
	public CategorySecond getModel() {
		return categorySecond;
	}
//注入二级分类的service
	public CategorySecondService categorySecondService;
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}

	//注入一级分类的service
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	private int cid;
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}
	//接收page
	private int page;
	public void setPage(int page) {
		this.page = page;
	}
	
	//查询二级分类
	public String findAll(){
		PageBean<CategorySecond> pageBean = categorySecondService.findByPage(page);
	//将pageBean的数据存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	//添加二级分类，先查询一级分类再跳转
	public String addPage(){
		List<Category> cList = categoryService.findAll();
		//将一级分类显示到下拉列表里
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "addPageSuccess";
	}
	//保存二级分类
	public String save(){
		categorySecond.setCategory(categoryService.findByCid(cid));
		categorySecondService.save(categorySecond);
		return "saveSuccess";
	}
	//删除二级分类
	public String delete(){
		categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	//编辑二级分类
	public String edit(){
		//获得二级分类对象
		  categorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		  //查询所有一级分类
		  List<Category> cList = categoryService.findAll();
		  ActionContext.getContext().getValueStack().set("cList", cList);
		return "editSuccess";
	}
	//修改二级分类
	public String update(){
		categorySecond.setCategory(categoryService.findByCid(cid));
		categorySecondService.update(categorySecond);
		return "updateSuccess";
	}
}
