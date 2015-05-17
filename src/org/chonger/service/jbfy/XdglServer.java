package org.chonger.service.jbfy;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbfy.XDXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title XdglServer.java 消毒信息管理业务逻辑
* @package org.chonger.service.jbfy
* @author Daniel
* @create 2015-5-15 
 */
@Service
@Transactional
public class XdglServer {
	@Autowired
	private CommonDAO<XDXX> dao;
	
	/**
	 * 依据牛只的id信息查询消毒信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun JYXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public XDXX queryNZById(String id)
	{
		List<XDXX> resultList=dao.find(getQueryString(null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String xdrq)
	{
		String sql="from XDXX model where 1=1 ";
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		if(!StringUtil.IsEmpty(xdrq))sql+=" and model.xdrq='"+xdrq+"' ";
		
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
				String deleteHql="delete XDXX model where model.xh='"+id+"'";
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
	public void saveOrUpdate(XDXX Xdxx)
	{
		if(Xdxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Xdxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Xdxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Xdxx.setXh(CommUUID.getUUID());
				dao.save(Xdxx);
			}
			else
				dao.saveOrUpdate(Xdxx);
		}
	}
}
