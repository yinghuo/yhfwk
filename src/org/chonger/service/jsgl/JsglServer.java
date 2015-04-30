package org.chonger.service.jsgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbxx.JSJBXX;
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
* @title JsglServer.java 圈舍信息管理业务逻辑
* @package org.chonger.service.ncgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class JsglServer {
	
	@Autowired
	private CommonDAO<JSJBXX> dao;
	
	public String getQueryString()
	{
		return "from JSJBXX model";
	}
	
	/**
	 * 查找所有的圈舍信息
	 * @Title: finaAll 
	 * @Description: 
	 * @retrun List<JSJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<JSJBXX> finaAll()
	{
		return dao.find(getQueryString());
	}
	
	/**
	 * 根据牛场编号查询圈舍信息
	 * @Title: findAllByNcbh 
	 * @Description: 
	 * @param ncbh 要查询的牛场编号
	 * @retrun List<JSJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<JSJBXX> findAllByNcbh(String ncbh)
	{
		
		return dao.find(getQueryString()+" where model.ncbh='"+ncbh+"'");
	}
	
	/**
	 * 保存或更新牛场信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Ncxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(JSJBXX jsxx) throws Exception
	{
		if(jsxx!=null)
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
						jsxx.setNcbh(ncxx.getNcbh());
					}
				}
				
				if(StringUtil.IsEmpty(jsxx.getXh()))
				{
					//圈舍编号为空，表示新增，进行自动编号
					jsxx.setXh(CommUUID.getUUID());
					
					dao.save(jsxx);
				}
				else
				{
					dao.saveOrUpdate(jsxx);
				}
			}
		}
	}
}
