package org.chonger.service.cngl;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.cngl.GTCNXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
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
		if(!StringUtil.IsEmpty(bh))sql+=" and model.nzbh='"+bh+"' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
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
				
				if(StringUtil.IsEmpty(cnxx.getXh()))
				{
					//圈舍编号为空，表示新增，进行自动编号
					cnxx.setXh(CommUUID.getUUID());
					
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
