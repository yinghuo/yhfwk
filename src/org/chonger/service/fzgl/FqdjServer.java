package org.chonger.service.fzgl;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum.NZFZZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzfzServer;
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
	private NzfzServer fzServer;
	
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
	
	/**
	 * 根据发情ID获取发情信息
	 * @param id
	 * @retrun FQDJXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public FQDJXX getFqxxById(String id)
	{
		List<FQDJXX> fqxxList=dao.find(getQueryString(null,null)+" and model.xh = '"+id+"'");
		if(fqxxList!=null&&fqxxList.size()>0)
			return fqxxList.get(0);
		return null;
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
			
			//NZJBXX nzxx=nzServer.queryNZById(Fqxx.getNzbh());
			
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
				
				//更新牛只情期数据
				NZJBXX nzxx=nzServer.queryNZById(Fqxx.getNzbh());
				nzxx.setQq(nzxx.getQq()+1);
				nzServer.saveOrUpdate(nzxx);
				
			}
			else
				dao.saveOrUpdate(Fqxx);
			
			//计算发情后的最佳配种时间 +8-12小时
			Date tssj=DateTimeUtil.addDate(Fqxx.getFqsj(), 0, 0,0,8,0,0);
			
			//更新牛只的类别详细信息
			//NZLBXX lbxx=nzxx.getNzlbxx();
//			NZLBXX _lbxx=lbServer.getNzlbxxById(Fqxx.getNzbh());
//			if(_lbxx==null)
//				_lbxx=new NZLBXX();
//			_lbxx.setLb(NZLBZT.发情期.getValue());
//			_lbxx.setSj(Fqxx.getFqsj());
//			_lbxx.setTssj(tssj);
//			lbServer.saveOrUpdate(_lbxx, Fqxx.getNzbh());
			
			//更新繁殖状态信息
			//牛只在新增发情登记的同时，需要更新繁殖状态为发情期
			NZFZZTXX fzzt=fzServer.findEntity(Fqxx.getNzbh());
			if(fzzt==null)
				fzzt=new NZFZZTXX();
			fzzt.setZt(NZFZZT.发情期.getValue());
			fzzt.setSj(Fqxx.getFqsj());
			fzzt.setTssj(tssj);
			fzzt.setTid(Fqxx.getXh());//关联发情信息
			fzServer.saveOrUpDate(Fqxx.getNzbh(), fzzt);			
			
			//发出消息
		}
	}
}
