package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.RJFJXX;
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
* @title RjdjServer.java 妊检登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class RjfjServer {
	@Autowired
	private CommonDAO<RJFJXX> dao;
	
	@Autowired
	private NzxxServer nzServer;	
	@Autowired
	private NzfzServer fzServer;
	
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
	public RJFJXX getFjxxById(String id)
	{
		List<RJFJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from RJFJXX model where 1=1 ";
		if(!StringUtil.IsEmpty(nzbh))sql+=" and model.nzjbxx.nzbh like '%"+nzbh+"%' ";		
		if(!StringUtil.IsEmpty(ebbh))sql+=" and model.nzjbxx.ebbh like '%"+ebbh+"%' ";
		
		//2015-05-18	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzjbxx.nzzt = '0' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		//Daniel 添加排序
		sql+=" order by model.fjrq desc";
		
		return sql;
	}
	
	public List<RJFJXX> findAll()
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
				String deleteHql="delete RJFJXX model where model.xh='"+id+"'";
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
	public void saveOrUpdate(RJFJXX Rjxx)
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
				
				//modify 2015-06-23	Daniel 1：新增复检信息的自动计算逻辑
				//复检不用更新牛只基本信息
//				NZJBXX _nzxx=nzServer.queryNZById(Rjxx.getNzbh());
//				NZLBXX _nzlb=_nzxx.getNzlbxx();
//				
//				//更新牛只的类别为已复检
//				_nzlb.setLb(ConstantEnum.NZLBZT.已复检.getValue());
//				
//				lbServer.saveOrUpdate(_nzlb,_nzxx.getXh());
				
				//NZFZZTXX _fzxx=_nzxx.getNzfzzt();
				//_fzxx.setBj(1);
				
			}
			else
				dao.saveOrUpdate(Rjxx);
		}
	}

}
