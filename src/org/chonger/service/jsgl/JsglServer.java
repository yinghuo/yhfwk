package org.chonger.service.jsgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.utils.CommUUID;
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
	 * 保存或更新牛场信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Ncxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(JSJBXX jsxx)
	{
		if(jsxx!=null)
		{
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
