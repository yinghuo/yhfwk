package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title CddjServer.java 产犊登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class CddjServer {
	@Autowired
	private CommonDAO<CDDJXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	/**
	 * 依据牛只的id信息查询牛只产犊信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun CDDJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public CDDJXX queryNZById(String id)
	{
		List<CDDJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from CDDJXX model where 1=1 ";		
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
	
	public List<CDDJXX> findAll()
	{
		return dao.find(getQueryString(null,null));
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Cdxx
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(CDDJXX Cdxx)
	{
		if(Cdxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Cdxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			//产犊的牛只自动更新为泌乳牛
			NZJBXX nzxx=nzServer.queryNZById(Cdxx.getNzbh());
			nzxx.setLb(NZLB.成年母牛.getValue()+"");
			nzServer.saveOrUpdate(nzxx);
			
			if(StringUtil.IsEmpty(Cdxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Cdxx.setXh(CommUUID.getUUID());
				dao.save(Cdxx);
			}
			else
				dao.saveOrUpdate(Cdxx);
		}
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
				String deleteHql="delete CDDJXX model where model.xh='"+id+"'";
				if(user.getRole().getRtype()==2)
				{
					deleteHql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
				}
			
				dao.ExecutionHql(deleteHql);
			}
		}
	}
}
