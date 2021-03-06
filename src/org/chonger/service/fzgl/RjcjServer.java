package org.chonger.service.fzgl;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum;
import org.chonger.common.ConstantEnum.NZFZZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.RJCJXX;
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
	private NzfzServer fzServer;
	
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
				//序号为空，表示新增，进行自动编号
				Rjxx.setXh(CommUUID.getUUID());
				
				Rjxx.setRj2jg(-1);
				Rjxx.setRj3jg(-1);
				
				dao.save(Rjxx);
				
				//modify 2015-06-04	Daniel 1：新增初检信息的自动计算逻辑
				//判断初检结果是否是已怀孕？进入妊娠期，当前类别中日期为配种时间，继续计算天数。：进入空杯期，空杯时间从上一次发情计算
				NZJBXX _nzxx=nzServer.queryNZById(Rjxx.getNzbh());
				//NZLBXX _nzlb=_nzxx.getNzlbxx();
				NZFZZTXX _fzzt=_nzxx.getNzfzzt();
				if(Rjxx.getCjjg()==ConstantEnum.CJJG.已孕.getValue())
				{
					//已孕
					//更新牛只的状态为妊娠，第一胎为妊娠前期青年母牛
					if(_nzxx.getTc()<=0)
					{
						_nzxx.setLb(ConstantEnum.NZLB.青年母牛.getValue()+"");
					}
					
					//@add 2016-03-23 Daniel 添加配孕天数记录
					_nzxx.setPyts(DateTimeUtil.getDayBetweenHms(_fzzt.getSj(), Rjxx.getCjrq()));
					nzServer.saveOrUpdate(_nzxx);
					
					
					//更新牛只列别信息 已初检
					//_nzlb.setLb(ConstantEnum.NZLBZT.妊娠前期.getValue());
					//_nzlb.setLb(ConstantEnum.NZLBZT.已初检.getValue());
					_fzzt.setZt(NZFZZT.妊娠前期.getValue());
					_fzzt.setBj(1);//已初检
					
					
					//计算预产期
					//配种时间开始+280天预产期
					Date chanqi=DateTimeUtil.addDate(_fzzt.getSj(), 0, 0, 280);//计算预产期
					_fzzt.setTssj(chanqi);
					
				}
				else
				{
					//未孕
					//更新牛只列别信息 空怀期
					//_nzlb.setLb(ConstantEnum.NZLBZT.空怀期.getValue());
					_fzzt.setZt(NZFZZT.空怀期.getValue());
					
				}
				//lbServer.saveOrUpdate(_nzlb,_nzxx.getXh());
				fzServer.saveOrUpDate(_nzxx.getXh(), _fzzt);
				
			}
			else
				dao.saveOrUpdate(Rjxx);
		}
	}

}
