
package org.chonger.service.nzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NzxxServer.java 牛只信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NzxxServer {
	@Autowired
	private CommonDAO<NZJBXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun NZJBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZJBXX queryNZById(String id)
	{
		List<NZJBXX> resultList=dao.find(getQueryString(null,null,null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	/**
	 * 加载所有牛只信息
	 * @Title: getAllNZ 
	 * @Description: Note(这里用一句话描述这个方法的作用) 
	 * @return
	 * @retrun List<NZJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<NZJBXX> getAllNZ()
	{
		return dao.find(getQueryString(null,null,null));
	}
	
	/**
	 * 根据牛只的编号查询牛只信息
	 * @Title: queryNZByBH 
	 * @Description: 
	 * @param nzbh
	 * @retrun NZJBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZJBXX queryNZByBH(String nzbh)
	{
		List<NZJBXX> resultList=dao.find(getQueryString(null,null,null)+" and model.nzbh='"+nzbh+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String xh,String eb,String jbq)
	{		
		String sql="from NZJBXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(xh))sql+=" and model.xh='"+xh+"' ";
		if(!StringUtil.IsEmpty(eb))sql+=" and model.ebbh like '%"+eb+"%'";
		if(!StringUtil.IsEmpty(jbq))sql+=" and model.jbqbh like '%"+jbq+"%'";
		
		//2015-05-14	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzzt = '0'";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	
	
	/**
	 * 根据圈舍的编号查询该圈舍的牛只个数
	 * @Title: getNZCountByJSXX 
	 * @Description: 
	 * @param jsxh
	 * @retrun long 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * 
	 * @modify 2015-05-14	Daniel	1:修复bug，增加统计条件，统计正常牛只
	 */
	public long getNZCountByJSXX(String jsxh)
	{
		return dao.getCount("select count(*) from NZJBXX model where model.js='"+jsxh+"' and model.nzzt='0'");
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Ncxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(NZJBXX Nzxx)
	{
		if(Nzxx!=null)
		{
			//权限校验 //TODO 添加牛只的圈舍是否合法
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Nzxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Nzxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Nzxx.setXh(CommUUID.getUUID());
				dao.save(Nzxx);
			}
			else
				dao.saveOrUpdate(Nzxx);
		}
	}
	
	/**
	 * 
	 * @Title: delete 
	 * @Description: 
	 * @param id
	 * @throws Exception
	 * @retrun void 
	 * @author Daniel
	 * @version V1.0
	 */
	public void delete(String id) throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//企业用户角色
			User user=SessionUtils.getUser();	
			if(user!=null&&user.getRole()!=null)
			{
				String deleteHql="delete NZJBXX model where model.xh='"+id+"'";
				if(user.getRole().getRtype()==2)
				{
					deleteHql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
				}
				
				//检查该牛只是否有计步器，更新计步器信息
				
				dao.ExecutionHql(deleteHql);
			}
		}
	}
}
