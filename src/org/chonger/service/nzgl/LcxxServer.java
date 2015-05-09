package org.chonger.service.nzgl;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLCXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title LcxxServer.java 牛只离场信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-5-4
 */
@Service
@Transactional
public class LcxxServer {
	
	@Autowired
	private CommonDAO<NZLCXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	public String getQueryString()
	{
		String sql="from NZLCXX model where 1=1 ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	/**
	 * 保存或更新牛只离场信息
	 * @param lcxx
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(NZLCXX lcxx) throws Exception
	{
		if(lcxx!=null)
		{
			//获取离场的牛只
			NZJBXX nz=nzServer.queryNZById(lcxx.getNzxh());
			
			if(nz!=null)
			{			
				//权限校验
				User user=SessionUtils.getUser();
				if(user!=null&&user.getRole().getRtype()==2)
				{
					lcxx.setNcbh(user.getNcjbxx().getXh());
				}
				
				//补全离场信息
				
				
				if(StringUtil.IsEmpty(lcxx.getXh()))
				{
					//序号为空，表示新增，进行自动编号
					lcxx.setXh(CommUUID.getUUID());
					dao.save(lcxx);
				}
				else
					dao.saveOrUpdate(lcxx);				
			}
			else
				throw new Exception("转舍的牛只信息错误！");
		}
	}
}
