
package org.chonger.service.nzgl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.chonger.common.ConstantEnum;
import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.common.ConstantEnum.NZZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NzxxServer.java 牛只信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NzxxServer {
	@Autowired
	private CommonDAO<NZJBXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun NZJBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZJBXX queryNZById(String id)
	{
		List<NZJBXX> resultList=dao.find(getQueryString(null,null,null)+" and model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	/**
	 * 加载所有牛只信息
	 * @Title: getAllNZ 
	 * @Description: Note(这里用一句话描述这个方法的作用) 
	 * @return
	 * @retrun List<NZJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<NZJBXX> getAllNZ()
	{
		return dao.find(getQueryString(null,null,null));
	}
	
	/**
	 * 获取牛只的编号和id的字典
	 * @retrun Map<String,String> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public Map<String,String> findBh$IdMap()
	{
		List<NZJBXX> nzxxList=getAllNZ();
		Map<String,String> nzxxMap=null;
		if(nzxxList!=null)
		{
			nzxxMap=new LinkedHashMap<String,String>();
			for(NZJBXX nzxx : nzxxList)
			{
				nzxxMap.put(nzxx.getNzbh(),nzxx.getXh());
			}			
		}
		return nzxxMap;
	}
	
	/**
	 * 根据牛只的编号查询牛只信息
	 * @Title: queryNZByBH 
	 * @Description: 
	 * @param nzbh
	 * @retrun NZJBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZJBXX queryNZByBH(String nzbh)
	{
		List<NZJBXX> resultList=dao.find(getQueryString(null,null,null)+" and model.nzbh='"+nzbh+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	/**
	 * 
	 * @param lb
	 * @return
	 * @retrun List<NZJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<NZJBXX> queryNZByLB(int lb)
	{
		return dao.find(getQueryString(null,null,null)+" and model.lb='"+lb+"'");		
	}
	
	public String getQueryString(String bh,String eb,String jbq)
	{		
		String sql="from NZJBXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(bh))sql+=" and model.nzbh like '%"+bh+"%' ";
		if(!StringUtil.IsEmpty(eb))sql+=" and model.ebbh like '%"+eb+"%'";
		if(!StringUtil.IsEmpty(jbq))sql+=" and model.jbqbh like '%"+jbq+"%'";
		
		//2015-05-14	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzzt = '0'";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	
	
	/**
	 * 根据圈舍的编号查询该圈舍的牛只个数，如果存在圈舍参数则查询该圈舍信息，如果参数为空则查询所有牧场个数。
	 * @Title: getNZCountByJSXX 
	 * @Description: 
	 * @param jsxh
	 * @retrun long 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * 
	 * @modify 2015-05-14	Daniel	1:修复bug，增加统计条件，统计正常牛只
	 * @modify 2015-07-25	Daniel 	1:修复牛只个数统计，统计条件中添加淘汰牛只(nzzt=2)的统计.
	 */
	public long getNZCountByJSXX(String jsxh)
	{
		//@modify 2015-07-25	Daniel 修改语句条件nzzt='0'为nzzt <> '1'
		String sql= "select count(*) from NZJBXX model where model.nzzt <> '1'";
		if(!StringUtil.IsEmpty(jsxh) && !"".equals(jsxh)) 
			sql+="  and model.js='"+jsxh+"'";
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		return dao.getCount(sql);
	}

	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Ncxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(NZJBXX Nzxx)
	{
		if(Nzxx!=null)
		{
			//权限校验 //TODO 添加牛只的圈舍是否合法
			User user=SessionUtils.getUser();
			if(user!=null&&user.getRole().getRtype()==2)
			{
				Nzxx.setNcbh(user.getNcjbxx().getXh());
			}
			
			if(StringUtil.IsEmpty(Nzxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Nzxx.setXh(CommUUID.getUUID());
				dao.save(Nzxx);
			}
			else
				dao.saveOrUpdate(Nzxx);
		}
	}
	
	/**
	 * 依据牛只的月龄，更新牛只的类别信息
	 * @param nzxx
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void updateLBFromYL(NZJBXX nzxx)
	{
		if(nzxx.getCsrq()!=null)
		{
			//依据牛只月龄计算牛只类别
			NZLB nzlb=getNZLB(nzxx.getYl());
			//更新牛只类别
			if(nzlb==NZLB.大育成牛)
			{
				if(nzxx.getXb()==0)
					nzxx.setLb(nzlb.getValue()+"");
				else
					nzxx.setLb(NZLB.留养公牛.getValue()+"");
			}
			else
				nzxx.setLb(nzlb.getValue()+"");
		}
	}
	
	public NZLB getNZLB(int yl)
	{
		if(yl<=3)
			return NZLB.哺乳犊牛;
		if(yl<=6)
			return NZLB.断奶犊牛;
		if(yl<=12)
			return NZLB.小育成牛;
		if(yl<24)
			return NZLB.大育成牛;
		//return NZLB.青年母牛;
		return NZLB.成年母牛;
	}
	
	/**
	 * 
	 * @Title: delete 
	 * @Description: 
	 * @param id
	 * @throws Exception
	 * @retrun void 
	 * @author Daniel
	 * @version V1.0
	 */
	public void delete(String id) throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//企业用户角色
			User user=SessionUtils.getUser();	
			if(user!=null&&user.getRole()!=null)
			{
				String deleteHql="delete NZJBXX model where model.xh='"+id+"'";
				if(user.getRole().getRtype()==2)
				{
					deleteHql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
				}
				
				//检查该牛只是否有计步器，更新计步器信息
				
				dao.ExecutionHql(deleteHql);
			}
		}
	}
	
	/**
	 * 淘汰牛只登记
	 * @param id
	 * @throws Exception
	 * @retrun void 
	 * @author Daniel
	 * @version V1.0
	 */
	public void eliminate(String id) throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//获取牛只的信息
			NZJBXX nzxx=this.queryNZById(id);
			if(nzxx!=null)
			{
				nzxx.setNzzt(NZZT.淘汰.getValue());
				//更新牛只信息
				this.saveOrUpdate(nzxx);
			}
			else
				throw new Exception("无效的牛只数据ID!");
		}		
	}
	
	/**
	 * 对牛只的信息按照类别进行统计
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<Object> queryByGroupLb()
	{
		String hql="select model.lb, count(*) from NZJBXX model "
				+ " where model.nzzt <> '1' ";
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			hql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		hql += " group by model.lb";
		List<Object> objList=dao.find(hql);
		return objList;
	}
	
	/**
	 * 查询指定牛只的状态的牛只个数
	 * @param nzzt
	 * @retrun long 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public long queryCountByNzzt(NZZT nzzt)
	{
		String hql="select count(*) from NZJBXX model where model.nzzt = '"+nzzt.getValue()+"'";
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			hql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		return dao.getCount(hql);
	}
	
}
