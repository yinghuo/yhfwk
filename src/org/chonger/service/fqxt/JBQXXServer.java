package org.chonger.service.fqxt;

import java.util.Date;
import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fqxt.JBQXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title JBQXXServer.java 计步器业务逻辑
* @package org.chonger.service.fqxt
* @author Daniel
* @create 2015-12-14 
 */
@Service
@Transactional
public class JBQXXServer {
	
	@Autowired
	private CommonDAO<JBQXX> dao;
	
	
	public String getQueryString(String jbq,String nz)
	{
		String sql="from JBQXX model where 1=1 ";
		if(!StringUtil.IsEmpty(jbq))sql+=" and model.jbqbh like '%"+jbq+"%' ";
		if(!StringUtil.IsEmpty(nz))sql+=" and model.nzbh like '%"+nz+"%' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	public List<JBQXX> findAll()
	{
		return dao.find(getQueryString(null,null));
	}
	
	
	public long getCount(){
		return dao.getCount("select count(*) "+getQueryString(null,null));
	}
	
	/**
	 * 判断指定的绑定是否存在
	 * @param jbq
	 * @param nz
	 * @return
	 */
	public JBQXX exist(String jbq,String nz)
	{
		if(StringUtil.IsEmpty(jbq)&&StringUtil.IsEmpty(nz))
			return null;
		
		String sql="from JBQXX model where 1=1 ";
		if(!StringUtil.IsEmpty(jbq))sql+=" and model.jbqbh = '"+jbq+"' ";
		if(!StringUtil.IsEmpty(nz))sql+=" and model.nzbh = '"+nz+"' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		List<JBQXX> resultList=dao.find(sql);
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	/**
	 * 保存和更新计步器信息
	 * @param entity
	 */
	public void saveOrUpdate(JBQXX jbqxx)
	{
		if(jbqxx!=null)
		{
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				jbqxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			jbqxx.setRegdate(new Date());
			if(StringUtil.IsEmpty(jbqxx.getXh()))
			{
				jbqxx.setXh(CommUUID.getUUID());				
				dao.save(jbqxx);
			}
			else
			{
				dao.saveOrUpdate(jbqxx);
			}
			
		}
	}
	
	/**
	 * 根据ID查询计步器
	 * @param id
	 * @return
	 */
	public JBQXX queryJBQById(String id)
	{
		List<JBQXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public void delete(String id) throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//企业用户角色
			User user=SessionUtils.getUser();	
			if(user!=null&&user.getRole()!=null)
			{
				String deleteHql="delete JBQXX model where model.xh='"+id+"'";
				if(user.getRole().getRtype()==2)
				{
					deleteHql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
				}
			
				dao.ExecutionHql(deleteHql);
			}
		}
	}
}
