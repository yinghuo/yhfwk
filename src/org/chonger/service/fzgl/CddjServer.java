package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.common.ConstantEnum.NZFZZT;
import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.common.ConstantEnum.NZMRZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZMRZTXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzfzServer;
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
	
	@Autowired
	private NzfzServer fzServer;
	
	@Autowired
	private NzmrServer mrServer;
	
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
			
			if(StringUtil.IsEmpty(Cdxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Cdxx.setXh(CommUUID.getUUID());
				
				
				//modify 2015-06-05	Daniel	1：添加产犊业务逻辑
				NZJBXX _nzxx=nzServer.queryNZById(Cdxx.getNzbh());
				NZFZZTXX _fzxx=_nzxx.getNzfzzt();
				//NZLBXX _nzlb=_nzxx.getNzlbxx();
				//更新牛只的胎次数量、状态进入成年母牛
				//@modify 2016-03-23 Daniel 修改胎间距计算方式，如果胎次为0 则胎间距为0，后面的为繁殖天数-上次胎间距
//				if(_nzxx.getTc()<=0){
//					_nzxx.setTjj(0);
//				}else{
//					_nzxx.setTjj(_fzxx.getDay()-_nzxx.getTjj());//Daniel 增加胎间距
//				}
				//@modify 2016-05-23 Liuzq 修改胎间距计算方式，育成牛第一胎后，胎间距应该是0，
				//生第二胎的时候才会出现胎间距，第二胎的出生日期减去第一胎出生的日期，是胎间距，成年母牛才会有胎间距
				if(_nzxx.getTc()<=1){
					_nzxx.setTjj(0);
				}else{
					_nzxx.setTjj(_fzxx.getDay()-_nzxx.getTjj());//liuzq 增加胎间距 应该怎么计算？两个胎次之间的天数差
				}
				
				_nzxx.setTc(_nzxx.getTc()+1);
				_nzxx.setLb(NZLB.成年母牛.getValue()+"");
				_nzxx.setQq(0);//清除情期
				
				
				//牛只状态进入泌乳期
				//_nzlb.setLb(ConstantEnum.NZLBZT.泌乳期.getValue());
				if(_fzxx==null)
					_fzxx=new NZFZZTXX();
//				_fzxx.setZt(NZFZZT.围产后期.getValue());
				_fzxx.setZt(NZFZZT.恢复期.getValue());
				_fzxx.setSj(Cdxx.getCdsj());//时间更新为产犊时间
				Cdxx.setTjj(_fzxx.getDay());//Daniel 胎间距应该保留历史在产犊记录中
				_fzxx.setDay(0);//
				
				fzServer.saveOrUpDate(Cdxx.getNzbh(), _fzxx);
				
				//泌乳状态进行更新
				NZMRZTXX _mrzt=_nzxx.getNzmrzt();
				if(_mrzt==null)
					_mrzt=new NZMRZTXX();
				
				//产犊后进入围产后期
				_mrzt.setZt(NZMRZT.围产后期.getValue());
				_mrzt.setDay(0);
				_mrzt.setSj(Cdxx.getCdsj());
				_mrzt.setNzxh(_nzxx.getXh());
				
				mrServer.saveOrUpDate(Cdxx.getNzbh(), _mrzt);
				
				dao.save(Cdxx);
				nzServer.saveOrUpdate(_nzxx);
				//lbServer.saveOrUpdate(_nzlb,_nzxx.getXh());
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
