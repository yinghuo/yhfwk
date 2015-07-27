package org.chonger.service.nzgl;

import org.chonger.common.ConstantEnum;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZTTXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title TtxxServer.java 牛只淘汰信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-07-25
 */
@Service
@Transactional
public class TtxxServer {
	
	@Autowired
	private CommonDAO<NZTTXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	/**
	 * 查询牛只淘汰信息列表
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * 
	 */
	public String getQueryString(String bh)
	{
		String sql="from NZTTXX model where 1=1 ";
		if(!StringUtil.IsEmpty(bh))sql+=" and model.nzjbxx.nzbh like '%"+bh+"%' ";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	/**
	 * 保存或更新牛只淘汰信息
	 * @param ttxx
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * 
	 */
	public void saveOrUpdate(NZTTXX ttxx) throws Exception
	{
		if(ttxx!=null)
		{
			//获取淘汰的牛只
			NZJBXX nz=nzServer.queryNZById(ttxx.getNzxh());
			
			if(nz!=null)
			{			
				//权限校验
				User user=SessionUtils.getUser();
				if(user!=null&&user.getRole().getRtype()==2)
				{
					ttxx.setNcbh(user.getNcjbxx().getXh());
				}
				
				
				if(StringUtil.IsEmpty(ttxx.getXh()))
				{
					//序号为空，表示新增，进行自动编号
					ttxx.setXh(CommUUID.getUUID());
					dao.save(ttxx);
				}
				else
					dao.saveOrUpdate(ttxx);
				
				//牛只信息变更
				nz.setNzzt(ConstantEnum.NZZT.淘汰.getValue());
				nzServer.saveOrUpdate(nz);
				
				//牛只淘汰后的其他数据清理工作
				
			}
			else
				throw new Exception("淘汰的牛只信息错误！");
		}
	}
}
