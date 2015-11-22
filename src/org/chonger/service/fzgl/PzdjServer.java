package org.chonger.service.fzgl;

import java.util.Date;
import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.fzgl.PZDJXX;
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
* @title RjdjServer.java 配种登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class PzdjServer {
	@Autowired
	private CommonDAO<PZDJXX> dao;
	
	@Autowired
	private FqdjServer fqServer;
	
	@Autowired
	private NzfzServer fzServer;
	
	@Autowired
	private NzxxServer nzServer;
	
	/**
	 * 根据配种ID获取配种信息
	 * @Title: getPzxxById 
	 * @Description: 
	 * @param id
	 * @retrun PZDJXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public PZDJXX getPzxxById(String id)
	{
		List<PZDJXX> resultList=dao.find(getQueryString(null, null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String nzbh,String ebbh)
	{
		String sql="from PZDJXX model where 1=1 ";
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
	
	public List<PZDJXX> findAll()
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
				String deleteHql="delete PZDJXX model where model.xh='"+id+"'";
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
	public void saveOrUpdate(PZDJXX Pzxx)
	{
		if(Pzxx!=null) {
			//权限校验 
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Pzxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Pzxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Pzxx.setXh(CommUUID.getUUID());
				
				
				//modify 2015-06-03	Daniel 1：新增配种信息保存时修改发情信息
				//更新发情信息
				FQDJXX _fqxx=fqServer.getFqxxById(Pzxx.getFqid());
				_fqxx.setSfpz(1);
				fqServer.saveOrUpdate(_fqxx);
				
				//同步发情类型 方式
				Pzxx.setFqlx(_fqxx.getFqlx());
				Pzxx.setFxfs(_fqxx.getFxfs());
				
				dao.save(Pzxx);
				
				//更新牛只信息
				NZJBXX nzxx=nzServer.queryNZById(Pzxx.getNzbh());
				nzxx.setZhpzrq(Pzxx.getPzsj());
				nzServer.saveOrUpdate(nzxx);
				
//				NZLBXX _lbxx=lbServer.getNzlbxxById(Pzxx.getNzbh());
//				if(_lbxx==null)//牛只不存在类型信息，一般这里应该会出现，添加以防万一
//					_lbxx=new NZLBXX();
//				//修改牛只类别信息
//				_lbxx.setSj(Pzxx.getPzsj());//更新配置时间
//				_lbxx.setTid(Pzxx.getXh());//绑定事件对象
//				_lbxx.setLb(NZLBZT.已配种.getValue());//更新已配种信息
//				_lbxx.setDay(DateTimeUtil.getDayBetween(Pzxx.getPzsj(), new Date()));//更新配种时间
//				_lbxx.setTssj(null);
//				lbServer.saveOrUpdate(_lbxx,Pzxx.getNzbh());
				
				NZFZZTXX fzzt=fzServer.findEntity(Pzxx.getNzbh());
				if(fzzt==null)
					fzzt=new NZFZZTXX();
				fzzt.setSj(Pzxx.getPzsj());
				fzzt.setTid(Pzxx.getXh());
				//modify Daniel 修复日期bug，应计算配种日期到今天的天数
				int between=DateTimeUtil.getDayBetweenHms(Pzxx.getPzsj(), new Date());
				if(between!=-1)
				{
					fzzt.setDay(Math.abs(between));//计算配种天数
				}
				else
					fzzt.setDay(0);//默认配种天数
				fzServer.saveOrUpDate(Pzxx.getNzbh(), fzzt);
			}
			else
				dao.saveOrUpdate(Pzxx);
		}
	}
}
