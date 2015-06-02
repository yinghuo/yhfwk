package org.chonger.service.fzgl;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum.NZLBZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLBXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzlbServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.CommUUID;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title FqdjServer.java 发情登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class FqdjServer {
	@Autowired
	private CommonDAO<FQDJXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	@Autowired
	private NzlbServer lbServer;
	
	/**
	 * 依据牛只的id信息查询牛只产犊信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun FQDJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public FQDJXX queryNZById(String id)
	{
		List<FQDJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from FQDJXX model where 1=1 ";		
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
	
	public List<FQDJXX> findAll()
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
				String deleteHql="delete FQDJXX model where model.xh='"+id+"'";
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
	public void saveOrUpdate(FQDJXX Fqxx)
	{
		if(Fqxx!=null) {
			
			NZJBXX nzxx=nzServer.queryNZById(Fqxx.getNzbh());
			
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Fqxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Fqxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Fqxx.setXh(CommUUID.getUUID());
				dao.save(Fqxx);
			}
			else
				dao.saveOrUpdate(Fqxx);
			
			//计算发情后的最佳配种时间 +8-12小时
			Date tssj=DateTimeUtil.addDate(Fqxx.getFqsj(), 0, 0,0,8,0,0);
			
			//更新牛只的类别详细信息
			NZLBXX lbxx=nzxx.getNzlbxx();
			if(lbxx==null)
				lbxx=new NZLBXX();
			lbxx.setLb(NZLBZT.发情期.getValue());
			lbxx.setSj(Fqxx.getFqsj());
			lbxx.setTssj(tssj);
			lbServer.saveOrUpdate(lbxx, nzxx);
			//发出消息
		}
	}
}
