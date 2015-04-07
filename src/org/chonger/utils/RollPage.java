package org.chonger.utils;

import java.sql.Timestamp;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.ismartcms.core.orm.hibernate.HibernateDao;
/**
 * 通用翻页控件，扩展框架的Page类，完成自动数据处理
 * 
 * @author Daniel
 * @modify by Daniel@2014-04-30	1：添加翻页对原生Sql的支持，通过设置setIsSql(true,Class)来启用原生sql。
 * 								2：修改当总长度为0时出错的bug。
 * 								
 */
@Repository
@Scope("prototype")
public class RollPage<T> extends HibernateDao<T,String> {
	
	private boolean debug=true;
	
	//翻页通用属性	
	private String id;
	/**获取ID*/
	public String getId() {		return id;	}
	/**设置ID*/
	public void setId(String id) {		this.id = id;	}
	
	private int pageSize=12;
	/**获取每页显示的数据个数*/
	public int getPageSize() {		return pageSize;	}
	/**设置每页显示的数据个数，如果pageSize小于或等于0则会重置为默认大小*/
	public void setPageSize(int pageSize) 
	{
		if(pageSize<=0) pageSize=12;
		//TODO 添加验证当初始化后被更改了分页大小后，进行重置分页
		else this.pageSize = pageSize;	
	}
	
	private int count=0;
	/**获取总数据个数*/
	public int getCount() {		return count;	}
	
	private int maxPageNum=0;
	/**获取总页码数*/
	public int getMaxPageNum() {		return maxPageNum;	}
	/**获取最小页码数*/
	public int getMinPageNum() {		return 1;			}
	
	private int nowPageNum=0;
	/**获取当前页码*/
	public int getNowPageNum() {		return nowPageNum;	}
	
	private String commandText;
	/**获取当前查询语句*/
	public String getCommandText() {		return commandText;	}
	/**设置当前查询语句*/
	public void setCommandText(String commandText) {		this.commandText = commandText;	}
	
	private Map<String, Object> params = null;
	/**获取当前查询语句的参数列表*/
	public Map<String, Object> getParams() {		return params;	}
	/**设置当前查询语句的参数列表*/
	public void setParams(Map<String, Object> params) {		this.params = params;	}
	
	private boolean isSql;
	private Class cls=null;
	/**获取当前sql语句类型是否为原生sql，默认为hql*/
	public boolean isSql() {
		return isSql;
	}
	/**设置当前sql语句类型是否为原生sql，默认为hql*/
	public void setSql(boolean isSql,Class clazz) {
		this.isSql = isSql;
		cls=clazz;
	}
	
	private	List<T> dataSource;
	/**获取结果数据源，get的时候才会进行数据加载，建议如果结果多次使用，可使用变量接收，不要多次调用getDataSource()来获取数据*/
	public List<T> getDataSource() { 
		if(this.maxPageNum!=0)
		{			
			if(this.nowPageNum==0)this.nowPageNum=1;
			if(!validPages())//TAG 是否在最大页时候返回空结果？还是默认最后一页
			{
				this.nowPageNum=this.old_pagenum;
				return dataSource;
			}
			findPage(this.nowPageNum);
		}
		else
		{
			clearDataSource();
		}
		return dataSource;
	}
	
	/**是否是有效的页码，可以做是否还有可用页使用*/
	public final boolean validPages()
	{
		return this.nowPageNum>0&&this.nowPageNum<=this.maxPageNum;
	}
	
	/**
	 * 加载指定的页面数据
	 * @param pageNum
	 */
	private void findPage(int pageNum)
	{
		if(pageNum<=0)
		{
			clearDataSource();
			return;
		}
		
		Query query=getQuery(this.commandText);
		setQuery(query);
		this.dataSource=query.list();
	}
	
	private void setQuery(Query query)
	{
		query.setFirstResult((this.nowPageNum-1)*this.pageSize);
		query.setMaxResults(this.pageSize);
	}
	
	private Query getQuery(String sql)
	{
		Session session=this.getSession();
		if(isSql)
			if(cls!=null)
				return session.createSQLQuery(sql).addEntity(cls);
			else
				return session.createSQLQuery(sql);
		return session.createQuery(sql);
	}
	
	//翻页通用函数
	/**
	 * 清除当前结果数据、翻页的数据、command语句，不会清除每页显示的数据个数设置
	 */
	public void clear()
	{
		clearDataSource();
		commandText=null;
		count=maxPageNum=nowPageNum=0;
	}
	
	private void clearDataSource()
	{
		if(dataSource!=null)
		{
			dataSource.clear();
			dataSource=null;
		}
	}
	
	/**
	 * 控件初始化操作
	 * @throws Exception
	 */
	public void init() throws Exception
	{
		if(StringUtil.IsEmpty(this.commandText)) throw new Exception("执行的语句为空，请通过setCommandText()方法进行设置！");
		clearDataSource();
		count=maxPageNum=nowPageNum=0;
		
		//获取rows count
		findRowCount();		
	}
	/**
	 * 控件初始化操作
	 * @param commandText 执行的查询语句
	 * @throws Exception 
	 */
	public void init(String commandText) throws Exception
	{
		this.setCommandText(commandText);
		init();
	}
	
	/**
	 * 控件初始化操作
	 * @param commandText 执行的查询语句
	 * @param pageSize 每页显示的数据个数，如果pageSize小于或等于0则会重置为默认大小
	 * @throws Exception
	 */
	public void init(String commandText,int pageSize) throws Exception
	{
		this.setCommandText(commandText);
		this.setPageSize(pageSize);
		init();
	}
	
	/**
	 * 获取数据总数
	 * @throws Exception
	 */
	private void findRowCount() throws Exception
	{
		//拆分执行语句
		//Note 是否添加SQL注入过滤？
		//commandText=commandText.trim().toLowerCase();//Error
		String _cmdStr=commandText;
		_cmdStr=_cmdStr.replaceAll("(?i)from","from");
		Session session=this.getSession();
		boolean blnOther = false;
		String[] strOtherHQL = { "left", "join", "group", "order" };
		int fromIndex=_cmdStr.indexOf("from");
		Query query=null;
		
		for (int i = 0; i < strOtherHQL.length; ++i) {
	        if (_cmdStr.indexOf(strOtherHQL[i]) >= 0) {
	            blnOther = true;
	            break;
	     	}
	    }
		//Note 如果不是select or from开始的查询语句还可能是其他的么？存储过程Table？
		if(blnOther)//存在特殊查询
		{
			if(fromIndex>-1) query=isSql?session.createSQLQuery(_cmdStr):session.createQuery(_cmdStr);
			else query=session.getNamedQuery(_cmdStr);			
			setQueryParams(query,params);
			this.count=query.list().size();
		}
		else//不存在特殊查询
		{
			if(fromIndex>-1)
			{
				if(_cmdStr.startsWith("from"))
				{
					_cmdStr="select count(*) "+_cmdStr;
				}
				else if(_cmdStr.startsWith("select"))
				{
					String fromString=_cmdStr.substring(fromIndex);
					_cmdStr="select count(*) "+fromString;
				}
				query=isSql?session.createSQLQuery(_cmdStr):session.createQuery(_cmdStr);
			}
			else query=session.getNamedQuery(_cmdStr);
			if(debug)System.out.println("-debug-:>"+_cmdStr);
			setQueryParams(query,params);
			List lisResult = query.list();
			if (lisResult != null)
	        	  this.count = Integer.parseInt(lisResult.get(0).toString());
			else
	        	  this.count = 0;
		}
		if(debug)System.out.println("-debug-:> find rows count is "+this.count);
		//计算分页数据
		if(this.count!=0)
		{
			this.maxPageNum=(this.count%this.pageSize)!=0?(this.count/this.pageSize+1):this.count/this.pageSize;
			if(debug)System.out.println("-debug-:> the pages count is "+this.maxPageNum);
		}
	}
	
	private int old_pagenum;
	/**下一页*/
	public final RollPage doPageDn()
	{
		old_pagenum=this.nowPageNum;
		this.nowPageNum++;
		return this;
	}
	/**上一页*/
	public final RollPage doPageUp()
	{
		old_pagenum=this.nowPageNum;
		this.nowPageNum--;
		return this;
	}
	/**首页*/
	public final RollPage doPageFirst()
	{
		old_pagenum=this.nowPageNum;
		this.nowPageNum=this.getMinPageNum();
		return this;
	}
	/**尾页*/
	public final RollPage doPageLast()
	{
		old_pagenum=this.nowPageNum;
		this.nowPageNum=this.getMaxPageNum();
		return this;
	}
	/**指定页*/
	public final RollPage doPageJump(int pagenum) throws Exception
	{
		old_pagenum=this.nowPageNum;
		this.nowPageNum=pagenum;
		if(!validPages())
		{
			this.nowPageNum=this.old_pagenum;
			throw new Exception("无效的页码！");
		}
		return this;
	}
	
	private void setQueryParams(Query query, Map<String, Object> params) throws Exception
	{
		if (params == null || params.isEmpty()) return;
		try
		{
			for (Iterator localIterator = params.keySet().iterator(); localIterator.hasNext();)
			{
				String var = (String)localIterator.next();
				Object obj = params.get(var);
		        if (obj instanceof String) {
		            query.setString(var, (String)obj);
		            continue;
		        }
		        if (obj instanceof Double) {
		        	query.setDouble(var, ((Double)obj).doubleValue());
		        	continue;
		        }
		        if (obj instanceof Long) {
		            query.setDouble(var, ((Long)obj).longValue());
		            continue;
		        }
		        if (obj instanceof Timestamp) {
		            query.setTimestamp(var, (Timestamp)obj);
		            continue;
		        }
		        if (obj instanceof Date) {
		            query.setDate(var, (Date)obj);
		            continue;
		        }
		        if (obj instanceof Integer) {
		            query.setInteger(var, ((Integer)obj).intValue()); 
		            continue;
		       }
		        if (obj instanceof Float) {
		            query.setFloat(var, ((Float)obj).floatValue());
		            continue;
		        }
		       	if (obj instanceof List) {
		            query.setParameterList(var, (List)obj);
		            continue;
		        }
		        query.setEntity(var, obj);
			}
		}catch(Exception ex)
		{
			throw ex;
		}
	}
	
	
//	public String getPageRollLink(String action,String goal,boolean showFirstLast,boolean showPageNum,int numCount,int numType,boolean showJump)
//	{
//		StringBuffer linkString=new StringBuffer();
//		if(showFirstLast)
//			linkString.append("<a href='"+action+"!pageFirst"+this.id+".action'>首页</a>");
//		
//		if(showFirstLast)
//			linkString.append("<a href='"+action+"!pageLast"+this.id+".action'>末页</a>");
//		
//		return linkString.toString();
//	}

	
}
