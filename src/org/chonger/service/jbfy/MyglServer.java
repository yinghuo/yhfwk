package org.chonger.service.jbfy;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbfy.MYXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title MyglServer.java 免疫信息管理业务逻辑
* @package org.chonger.service.jbfy
* @author Daniel
* @create 2015-5-15 
 */
@Service
@Transactional
public class MyglServer {
	@Autowired
	private CommonDAO<MYXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只护蹄修蹄信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun JYXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public MYXX queryNZById(String id)
	{
		List<MYXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from MYXX model where 1=1 ";
		if(!StringUtil.IsEmpty(nzbh))sql+=" and model.nzjbxx.nzbh like '%"+nzbh+"%' ";
		if(!StringUtil.IsEmpty(ebbh))sql+=" and model.nzjbxx.ebbh like '%"+ebbh+"%'";
		
		//2015-05-18	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzjbxx.nzzt = '0' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		
		
		return sql;
	}
	
	public List<MYXX> findAll()
	{
		return dao.find(getQueryString(null,null));
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
				String deleteHql="delete MYXX model where model.xh='"+id+"'";
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
	public void saveOrUpdate(MYXX Myxx)
	{
		if(Myxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Myxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Myxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Myxx.setXh(CommUUID.getUUID());
				dao.save(Myxx);
			}
			else
				dao.saveOrUpdate(Myxx);
		}
	}
}
