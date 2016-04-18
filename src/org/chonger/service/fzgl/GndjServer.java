package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.common.ConstantEnum.NZMRZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.GNDJXX;
import org.chonger.entity.nqgl.NZMRZTXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzmrServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title FqdjServer.java 干奶登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class GndjServer {
	
	@Autowired
	private NzxxServer nzServer;
	
	@Autowired
	private NzmrServer nrServer;
	
	@Autowired
	private CommonDAO<GNDJXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只干奶信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun FQDJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public GNDJXX queryNZById(String id)
	{
		List<GNDJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from GNDJXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(nzbh))sql+=" and model.nzjbxx.nzbh like '%"+nzbh+"%' ";		
		if(!StringUtil.IsEmpty(ebbh))sql+=" and model.nzjbxx.ebbh like '%"+ebbh+"%' ";
		
		//2015-05-18	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzjbxx.nzzt = '0' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		return sql;
	}
	
	public List<GNDJXX> findAll()
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
				String deleteHql="delete GNDJXX model where model.xh='"+id+"'";
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
	 * @param Gnxx
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(GNDJXX Gnxx)
	{
		if(Gnxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Gnxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Gnxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Gnxx.setXh(CommUUID.getUUID());
				dao.save(Gnxx);
				
				//牛只泌乳信息更新
				NZMRZTXX mrxx=nrServer.findEntity(Gnxx.getNzbh());
				if(mrxx==null)
					mrxx=new NZMRZTXX();
				mrxx.setZt(NZMRZT.干奶期.getValue());
				mrxx.setNzxh(Gnxx.getNzbh());
				nrServer.saveOrUpDate(Gnxx.getNzbh(), mrxx);
			}
			else
				dao.saveOrUpdate(Gnxx);
		}
	}
}
