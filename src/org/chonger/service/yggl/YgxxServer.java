package org.chonger.service.yggl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.jbxx.YGJBXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title YgxxServer.java 圈舍信息管理业务逻辑
* @package org.chonger.service.yggl
* @author Daniel
* @create 2015-05-06
 */
@Service
@Transactional
public class YgxxServer {
	
	public static String YGXX="_yggl_ygxx_";
	public static String YGXXID="_yggl_ygxx_id_";
	public static String YGXXNAME="_yggl_ygxx_name_";
	
	@Autowired
	private CommonDAO<YGJBXX> dao;
	
	/**获取所有的员工信息*/
	public List<YGJBXX> findAllYGXX()
	{
		return dao.find(getQueryString(null,null));
	}
	
	/**根据id获取员工信息*/
	public YGJBXX getEntityById(String id)
	{
		List<YGJBXX> resultList=dao.find(getQueryString(null,null)+" and model.xh=?",id);
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString(String bh,String xm)
	{
		String sql="from YGJBXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(bh))sql+=" and model.ygbh like '%"+bh+"%' ";
		if(!StringUtil.IsEmpty(xm))sql+=" and model.ygmc like '%"+xm+"%'";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)//牛场信息过滤
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
	}
	
	/**
	 * 保存或更新员工信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param YGJBXX
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(YGJBXX ygxx)
	{
		if(ygxx!=null)
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
						ygxx.setNcbh(ncxx.getXh());
					}
				}
				
				if(StringUtil.IsEmpty(ygxx.getXh()))
				{
					//圈舍编号为空，表示新增，进行自动编号
					ygxx.setXh(CommUUID.getUUID());
					
					dao.save(ygxx);
				}
				else
				{
					dao.saveOrUpdate(ygxx);
				}
			}
		}
	}
}
