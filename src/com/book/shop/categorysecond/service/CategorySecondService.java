package com.book.shop.categorysecond.service;

import java.util.List;

import com.book.shop.categorysecond.dao.CategorySecondDao;
import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.utils.PageBean;

//二级管理的业务逻辑层
public class CategorySecondService {
    //注入dao
    private CategorySecondDao categorySecondDao;

    public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
        this.categorySecondDao = categorySecondDao;
    }
    //分页查询二级分类
    public PageBean<CategorySecond> findByPage(int page) {
        PageBean<CategorySecond> pageBean = new PageBean<CategorySecond>();
        //设置当前页数
        pageBean.setPage(page);
        //设置每页显示的记录数
        int limit = 10;
        pageBean.setLimit(limit);
        //设置总记录数
        int totalCount = categorySecondDao.findCount();
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
        List<CategorySecond> list = categorySecondDao.findByPage(begin,limit);
        pageBean.setList(list);
        return pageBean;
    }
    //保存二级分类
    public void save(CategorySecond categorySecond) {
        categorySecondDao.save(categorySecond);

    }
    //根据二级分类id查询二级分类
    public CategorySecond findByCsid(int csid) {

        return categorySecondDao.findByCsid(csid);
    }
    //删除二级分类
    public void delete(CategorySecond categorySecond) {
        categorySecondDao.delete(categorySecond);

    }
    //修改二级分类
    public void update(CategorySecond categorySecond) {
        categorySecondDao.update(categorySecond);

    }
    public List<CategorySecond> findAll() {

        return categorySecondDao.findAll();
    }

}
