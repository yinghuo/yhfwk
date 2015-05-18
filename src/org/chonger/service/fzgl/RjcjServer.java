package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.RJCJXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title RjdjServer.java 妊检登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class RjcjServer {
	@Autowired
	private CommonDAO<RJCJXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只妊检信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun RJCJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public RJCJXX queryNZById(String id)
	{
		List<RJCJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from RJCJXX model where 1=1 ";
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		if(!StringUtil.IsEmpty(nzbh))sql+=" and model.nzbh='"+nzbh+"' ";
		
		//if(!StringUtil.IsEmpty(ebbh))sql+=" and model.ebbh like '%"+ebbh+"%'";
		
		return sql;
	}
	
	/**
	 * 
	 * @Title: delete 
	 * @Description: 
	 * @param id
	 * @throws Exception
	 * @retrun void 
	 * @author liuzq
	 * @version V1.0
	 */
	public void delete(String id) throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//企业用户角色
			User user=SessionUtils.getUser();	
			if(user!=null&&user.getRole()!=null)
			{
				String deleteHql="delete RJCJXX model where model.xh='"+id+"'";
				if(user.getRole().getRtype()==2)
				{
					deleteHql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
				}
			
				dao.ExecutionHql(deleteHql);
			}
		}
	}
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Fqxx
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(RJCJXX Rjxx)
	{
		if(Rjxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Rjxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Rjxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Rjxx.setXh(CommUUID.getUUID());
				dao.save(Rjxx);
			}
			else
				dao.saveOrUpdate(Rjxx);
		}
	}

}