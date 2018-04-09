package com.book.shop.categorysecond.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.book.shop.categorysecond.vo.CategorySecond;
import com.book.shop.utils.PageHibernateCallback;
//二级管理的持久层
public class CategorySecondDao extends HibernateDaoSupport{
    //查询统计二级分类个数
    public int findCount() {
        String hql = "select count(*) from CategorySecond";
        List<Long> list = this.getHibernateTemplate().find(hql);
        if(list !=null && list.size()>0){
            return list.get(0).intValue();
        }
        return list.get(0).intValue();
    }
    //分页查询二级分类
    public List<CategorySecond> findByPage(int begin, int limit) {
        String hql = "from CategorySecond order by csid desc";
        List<CategorySecond> list = this.getHibernateTemplate().execute(new PageHibernateCallback<CategorySecond>(hql,null,begin,limit));
        if(list !=null && list.size()>0){
            return list;
        }
        return null;
    }
    //保存二级分类
    public void save(CategorySecond categorySecond) {
        this.getHibernateTemplate().save(categorySecond);

    }
    //查询二级分类
    public CategorySecond findByCsid(int csid) {
        return this.getHibernateTemplate().get(CategorySecond.class, csid);
    }
    //执行删除操作
    public void delete(CategorySecond categorySecond) {
        this.getHibernateTemplate().delete(categorySecond);
    }
    //修改二级分类
    public void update(CategorySecond categorySecond) {
        this.getHibernateTemplate().update(categorySecond);

    }
    //dao层查询所有二级分类
    public List<CategorySecond> findAll() {
        String hql = "from CategorySecond";
        return this.getHibernateTemplate().find(hql);
    }

}
