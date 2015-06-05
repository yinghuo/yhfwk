package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.common.ConstantEnum;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.RJCJXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLBXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzlbServer;
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
public class RjcjServer {
	@Autowired
	private CommonDAO<RJCJXX> dao;
	
	@Autowired
	private NzxxServer nzServer;	
	@Autowired
	private NzlbServer lbServer;
	
	/**
	 * 根据ID查询妊检初检信息
	 * @Title: getCjxxById 
	 * @Description: 
	 * @param id
	 * @retrun RJCJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public RJCJXX getCjxxById(String id)
	{
		List<RJCJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from RJCJXX model where 1=1 ";
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
	
	public List<RJCJXX> findAll()
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
				
				//modify 2015-06-04	Daniel 1：新增初检信息的自动计算逻辑
				//判断初检结果是否是已怀孕？进入妊娠期，当前类别中日期为配种时间，继续计算天数。：进入空杯期，空杯时间从上一次发情计算
				NZJBXX _nzxx=nzServer.queryNZById(Rjxx.getNzbh());
				NZLBXX _nzlb=_nzxx.getNzlbxx();
				if(Rjxx.getCjjg()==ConstantEnum.CJJG.已孕.getValue())
				{
					//已孕
					//更新牛只的状态为妊娠，第一胎为妊娠前期青年母牛
					_nzxx.setLb(ConstantEnum.NZLB.妊娠前期青年母牛.getValue()+"");
					
					//更新牛只列别信息 
					_nzlb.setLb(ConstantEnum.NZLBZT.妊娠前期.getValue());
					
					nzServer.saveOrUpdate(_nzxx);
				}
				else
				{
					//未孕
					//
				}
				lbServer.saveOrUpdate(_nzlb,_nzxx.getXh());
				
			}
			else
				dao.saveOrUpdate(Rjxx);
		}
	}

}
