package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.common.ConstantEnum.NZFZZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.fzgl.LCXX;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzfzServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title LcdjServer.java 流产登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class LcdjServer {
	@Autowired
	private CommonDAO<LCXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	@Autowired
	private NzfzServer fzServer;
	
	/**
	 * 依据牛只的id信息查询牛只流产信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun LCXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public LCXX queryNZById(String id)
	{
		List<LCXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from LCXX model where 1=1 ";
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
	
	public List<LCXX> findAll()
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
				String deleteHql="delete LCXX model where model.xh='"+id+"'";
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
	public void saveOrUpdate(LCXX Lcxx)
	{
		if(Lcxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Lcxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Lcxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Lcxx.setXh(CommUUID.getUUID());
				dao.save(Lcxx);
				
				//流产后登记牛只的繁殖状态为流产状态
				//modify 2015-07-01	Daniel	1：添加产犊业务逻辑
				NZJBXX _nzxx=nzServer.queryNZById(Lcxx.getNzbh());
				NZFZZTXX _fzxx=_nzxx.getNzfzzt();
				if(_fzxx==null)
					_fzxx=new NZFZZTXX();
				
				_fzxx.setZt(NZFZZT.流产.getValue());
				fzServer.saveOrUpDate(_nzxx, NZFZZT.流产.getValue());
				
			}
			else
				dao.saveOrUpdate(Lcxx);
		}
	}

}
