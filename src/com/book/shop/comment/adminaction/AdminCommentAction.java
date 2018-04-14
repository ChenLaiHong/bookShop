package com.book.shop.comment.adminaction;

import com.book.shop.comment.service.CommentService;
import com.book.shop.comment.vo.Comment;
import com.book.shop.order.vo.Order;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCommentAction extends ActionSupport implements  ModelDriven<Comment>{

	private Comment comment = new Comment();
	public Comment getModel() {
		return comment;
	}
	//接收page
	private int page;
	public void setPage(int page) {
		this.page = page;
	}
	private CommentService commentService;
	
	
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}


	//带分页查询
	public String findAll(){
		 PageBean<Comment> pageBean = commentService.findByPage(page);
		 //把数据保存到值栈
		 ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		 //页面跳转
		 return "findAll";
	}


}
