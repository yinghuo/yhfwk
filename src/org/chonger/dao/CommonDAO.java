package org.chonger.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.ismartcms.core.orm.hibernate.HibernateDao;
/**
 * 公共DAO，可以通过注入时指定类型，如果需要在DAO中添加自己的数据库操作函数，请新建DAO
 * 使用该类同时使用findby(p,v)是否会出现问题？
 * @author Daniel
 * @create 2014-03-17
 * @param <T>
 */
@Repository
@Scope("prototype")
public class CommonDAO<T> extends HibernateDao<T,String> {
	//公共处理事件
	/**
	 * 获取前N条数据
	 * 通过HQL语句来查询Top N条数据
	 * 
	 * @param hql 查询的Hql语句
	 * @param n 要返回的条数
	 * 
	 * @author Daniel
	 * @create 2014-03-17
	 * @version 1.0
	 * 
	 */
	public List<T> findTopN(String hql,int n)
	{
		Session session=this.getSession();
		Query query=session.createQuery(hql);
		query.setMaxResults(n);
		return query.list();
	}
	
	/**
	 * 执行SQl语句
	 * @param sql 需要执行的Sql语句
	 * @param clazz 需要转换的实体，可以为null，则结果为Object
	 * @return
	 */
	public List<T> ExecutionSql(String sql,Class clazz)
	{
		Session session=this.getSession();
		Query query=null;
		if(clazz!=null)query=session.createSQLQuery(sql).addEntity(clazz);
		else query=session.createSQLQuery(sql);		
		return query.list();
	}
	
	/**
	 * 执行SQl语句
	 * @param sql 需要执行的Sql语句
	 * @param clazz 需要转换的实体，可以为null，则结果为Object
	 * @param n	查询的行数
	 * @return
	 */
	public List<T> ExecutionSql(String sql,Class clazz,int n)
	{
		if(n<=0)return ExecutionSql(sql,clazz);
		Session session=this.getSession();
		Query query=null;
		if(clazz!=null)query=session.createSQLQuery(sql).addEntity(clazz);
		else query=session.createSQLQuery(sql);	
		query.setMaxResults(n);
		return query.list();
	}
	
	public void ExecutionSql(String sql)
	{
		Session session=this.getSession();
		Query query=session.createSQLQuery(sql);
		query.executeUpdate();
	}
	
	/**
	 * 
	 * @param hql
	 */
	public void ExecutionHql(String hql)
	{
		Session session=this.getSession();
		try
		{
			Query query=session.createQuery(hql);
			query.executeUpdate();
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}finally{
			//session.close();
		}
	}
	
	/**
	 * 执行含有count(*)的hql语句，获取统计结果
	 * @param hql
	 * @return
	 * @throws Exception 
	 */
	public long getCount(String hql)
	{
		
		//Daniel 添加count(*)校验
		//if(hql.toLowerCase().indexOf("count(*)")==-1)
		//	throw new Exception("查询统计个数的语句不正确！");
		
		Query query = this.getSession().createQuery(hql);
		return ((Number)query.uniqueResult()).longValue();
	}
}

