package org.anran.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;

/**
 * DAO基类，其它DAO可以直接继承这个DAO，不但可以复用共用的方法，还可以获得泛型的好处
 */
public class BaseDao<T>{
    
	private Class<T> entityClass;
    
    @Autowired
    private HibernateTemplate hibernateTemplate;
    
    /**
     * 通过反射获取子类确定的泛型类
     */
    public BaseDao() {
        Type genType = getClass().getGenericSuperclass();
        Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
        entityClass = (Class) params[0];
    }

    public Session getSession() {
    	return hibernateTemplate.getSessionFactory().getCurrentSession();
    }
    
    public Criteria getCriteria(){
    	return getSession().createCriteria(this.entityClass);
    }
    
    /**
     * 根据ID加载PO实例
     *
     * @param id
     * @return 返回相应的持久化PO实例
     */
    public T load(Serializable id) {
        return (T) getHibernateTemplate().load(entityClass, id);
       // getHibernateTemplate().
    }

    /**
     * 根据ID获取PO实例
     *
     * @param id
     * @return 返回相应的持久化PO实例
     */
    public T get(Serializable id) {
        return (T) getHibernateTemplate().get(entityClass, id);
    }

    /**
     * 获取PO的所有对�?
     *
     * @return
     */
    public List<T> loadAll() {
        return getHibernateTemplate().loadAll(entityClass);
    }

    /**
     * 保存PO
     *
     * @param entity
     */
    public void save(T entity) {
        getHibernateTemplate().save(entity);
    }

    /**
     * 删除PO
     *
     * @param entity
     */
    public void remove(T entity) {
        getHibernateTemplate().delete(entity);
    }

    /**
     * 更改PO
     *
     * @param entity
     */
    public void update(T entity) {
        getHibernateTemplate().update(entity);
    }

    /**
     * 执行HQL查询
     *
     * @param sql
     * @return 查询结果
     */
    public List find(String hql) {
        return this.getHibernateTemplate().find(hql);
    }

    /**
     * 执行带参的HQL查询
     *
     * @param sql
     * @param params
     * @return 查询结果
     */
    public List find(String hql, Object... params) {
        return this.getHibernateTemplate().find(hql,params);
    }

    /**
     * 对延迟加载的实体PO执行初始化
     * @param entity
     */
    public void initialize(Object entity) {
        this.getHibernateTemplate().initialize(entity);
    }
    public HibernateTemplate getHibernateTemplate() {
        return hibernateTemplate;
    }
}