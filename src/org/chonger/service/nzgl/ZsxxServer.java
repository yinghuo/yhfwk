package org.chonger.service.nzgl;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZZSXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title ZsxxServer.java 牛只转舍信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class ZsxxServer {
	
	@Autowired
	private CommonDAO<NZZSXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	public String getQueryString(String bh)
	{
		String sql="from NZZSXX model where 1=1 ";
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
	
	/**
	 * 保存或更新转舍信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param zsxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(NZZSXX zsxx) throws Exception
	{
		if(zsxx!=null)
		{
			//获取转舍的牛只
			NZJBXX nz=nzServer.queryNZById(zsxx.getNzxh());
			
			if(nz!=null)
			{			
				//权限校验
				User user=SessionUtils.getUser();
				if(user!=null&&user.getRole().getRtype()==2)
				{
					zsxx.setNcbh(user.getNcjbxx().getXh());
				}
				
				//补全转舍信息
				zsxx.setZcjs(nz.getJs());
				
				if(StringUtil.IsEmpty(zsxx.getXh()))
				{
					//序号为空，表示新增，进行自动编号
					zsxx.setXh(CommUUID.getUUID());
					dao.save(zsxx);
				}
				else
					dao.saveOrUpdate(zsxx);
				
				//更新牛只的转舍信息
				nz.setJs(zsxx.getZrjs());
				nzServer.saveOrUpdate(nz);
			}
			else
				throw new Exception("转舍的牛只信息错误！");
		}
	}
}
