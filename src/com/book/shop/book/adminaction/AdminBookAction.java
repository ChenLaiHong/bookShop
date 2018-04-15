package com.book.shop.book.adminaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.book.shop.book.service.BookService;
import com.book.shop.book.vo.Book;
import com.book.shop.categorysecond.service.CategorySecondService;
import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.utils.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminBookAction extends ActionSupport implements  ModelDriven<Book>{

	//使用模型驱动
	private Book book = new Book();
	public Book getModel() {
		return book;
	}

	//注入图书service
	private BookService bookService;
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	//注入二级分类service
	private CategorySecondService categorySecondService;
	
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	//接收csid
	private int csid;
	

		public int getCsid() {
		return csid;
	}
	public void setCsid(int csid) {
		this.csid = csid;
	}

		//接收page
		private int page;
		public void setPage(int page) {
			this.page = page;
		}
		//文件上传需要的参数
		private File upload;//上传的文件
		private String uploadFileName;//文件上传的文件名
		private String uploadContextType;//接收文件上传的文件的MIME的类型
		
		
		public void setUpload(File upload) {
			this.upload = upload;
		}
		public void setUploadFileName(String uploadFileName) {
			this.uploadFileName = uploadFileName;
		}
		public void setUploadContextType(String uploadContextType) {
			this.uploadContextType = uploadContextType;
		}
		//查询所有图书
		public String findAll(){
			PageBean<Book> pageBean = bookService.findByPage(page);
		//将pageBean的数据存到值栈中
			ActionContext.getContext().getValueStack().set("pageBean", pageBean);
			return "findAll";
		}
		//跳转到添加页面
		public String addPage(){
			//查询所有二级分类的集合
			List<CategorySecond> cslist = categorySecondService.findAll();
			ActionContext.getContext().getValueStack().set("csList", cslist);
			//页面跳转
			return "addPageSuccess";
		}
		//保存图书
		public String save() throws IOException{
			//调用service完成保存操作
			book.setBdate(new Date());
			 if(upload != null){
				 //获得文件上传的磁盘绝对路径
				 String realPath = ServletActionContext.getServletContext().getRealPath("/book");
				 //创建文件
				 File diskFile = new File(realPath+"//"+uploadFileName);
				 //文件上传
				 FileUtils.copyFile(upload, diskFile);
				 book.setImage("book/"+uploadFileName);
			 }
			 book.setCategorySecond(categorySecondService.findByCsid(csid));
			bookService.save(book);
			return "saveSuccess";
		}
		//删除图书
		public String delete(){
			//先查询再删除
			book = bookService.findByBid(book.getBid());
			//删除以前上传的图片
			String path = book.getImage();
			//如果存在图片就删除
			if(path != null){
				String realPath = ServletActionContext.getServletContext().getRealPath("/"+path);
				File file = new File(realPath);
				file.delete();
			}
			 //删除图书
			bookService.delete(book);
			return "deleteSuccess";
		}
		
		//修改图书信息
		public String edit(){
			//根据图书id查询商品
			book = bookService.findByBid(book.getBid());
			//查询所有二级分类的集合
			List<CategorySecond> csList = categorySecondService.findAll();
			//把二级分类存到值栈中
			ActionContext.getContext().getValueStack().set("csList", csList);
			//页面跳转
			return "editSuccess";
		}
		//完成修改
		public String update() throws IOException{
			book.setBdate(new Date());
			//文件上传
			if(upload != null){
				//将原来的图片删除
				String path = book.getImage();
				File file = new File(ServletActionContext.getServletContext().getRealPath("/"+path));
				file.delete();
				//文件上传
				//获得文件上传的磁盘绝对路径
				String realPath = ServletActionContext.getServletContext().getRealPath("/book");
				File diskFile = new File(realPath+"//"+uploadFileName);
				FileUtils.copyFile(upload, diskFile);
				book.setImage("book/"+uploadFileName);
			}
			//修改图书数据到数据库
			 book.setCategorySecond(categorySecondService.findByCsid(csid));	
			bookService.update(book);
			return "updateSuccess";
		}
}
