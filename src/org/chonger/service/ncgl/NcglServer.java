package org.chonger.service.ncgl;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NcglServer.java 牛场信息管理业务逻辑
* @package org.chonger.service.ncgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NcglServer {
	
	@Autowired
	private CommonDAO<NCJBXX> dao;
	
	/**
	 * 保存或更新牛场信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Ncxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public String getQueryString()
	{
		return "from NCJBXX model";
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
	public void saveOrUpdate(NCJBXX Ncxx)
	{
		if(Ncxx!=null)
		{
			if(StringUtil.IsEmpty(Ncxx.getNcbh()))
			{
				//牛场编号为空，表示新增，进行自动编号
				Ncxx.setNcbh(CommUUID.getUUID());
				
				dao.save(Ncxx);
			}
			else
			{
				dao.saveOrUpdate(Ncxx);
			}
		}
	}
	
}
