package org.chonger.service.cngl;

import java.util.Date;
import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.cngl.GTCNXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title GtcnServer.java 圈舍信息管理业务逻辑
* @package org.chonger.service.cngl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class GtcnServer {
	
	@Autowired
	private CommonDAO<GTCNXX> dao;
	
	
	public String getQueryString(String bh)
	{
		String sql="from GTCNXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(bh))sql+=" and model.nzjbxx.nzbh like '%"+bh+"%' ";
		
		//2015-05-18	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzjbxx.nzzt = '0'";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	/***
	 * 根据指定的日期查询该日期前期的产奶量  TODO Daniel建议使用触发器实现
	 * @param date
	 * @param type 1:查询相等日期的。2：查询小于日期的。
	 * @retrun GTCNXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public GTCNXX getGTCNXXByDate(Date date,int type,String nzbh)
	{
		
		if(date!=null)
		{
			char t='=';
			if(type==2)
				t='<';
			
			List<GTCNXX> lst=dao.findTopN("from GTCNXX model where model.jnrq "+t+" '"+DateTimeUtil.formatDateToString(date,"yyyy-MM-dd")+"' and model.nzbh = '"+nzbh+"' order by model.jnrq desc",1);
			if(lst!=null && lst.size()>0)
				return lst.get(0);
			else
				return null;
		}		
		return null;
	}
	
	public List<GTCNXX> findAll()
	{
		return dao.find(getQueryString(null));
	}
	
	/**个体产奶信息*/
	public void saveOrUpdate(GTCNXX cnxx)
	{
		if(cnxx!=null)
		{
			//权限校验
			User user = SessionUtils.getUser();
			if(user!=null)
			{
				int rtype=-1;
				// 企业用户关联我的牛场信息
				if ((rtype=user.getRole().getRtype()) == 2) {
					NCJBXX ncxx = user.getNcjbxx();
					if (ncxx != null) {
						cnxx.setNcbh(ncxx.getXh());
					}
				}
				
				//统计产奶量
				double countCnl=cnxx.getScl()+cnxx.getXcl()+cnxx.getWcl();
				cnxx.setRc(countCnl);
				
				if(StringUtil.IsEmpty(cnxx.getXh()))
				{
					//圈舍编号为空，表示新增，进行自动编号
					cnxx.setXh(CommUUID.getUUID());
					
					//新增产奶记录需要查询上次产量并记录
					GTCNXX gtcnxx_old=getGTCNXXByDate(cnxx.getJnrq(),2,cnxx.getNzbh());
					
					if(gtcnxx_old!=null)
					{
						cnxx.setSrc(gtcnxx_old.getRc());
					}
					else
					{
						cnxx.setSrc(0);
					}
					
					dao.save(cnxx);
				}
				else
				{
					dao.saveOrUpdate(cnxx);
				}
				
			}
		}
	}
	
}
