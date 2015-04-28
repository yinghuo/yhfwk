package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.LCXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title LcdjServer.java 流产登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class LcdjServer {
	@Autowired
	private CommonDAO<LCXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只流产信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun LCXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public LCXX queryNZById(String id)
	{
		List<LCXX> resultList=dao.find(getQueryString()+" where model.nzbh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString()
	{
		return "from LCXX model";
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param LCXX
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(LCXX lcxx)
	{
		if(lcxx!=null)
		{
			if(StringUtil.IsEmpty(lcxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				lcxx.setXh(CommUUID.getUUID());
				dao.save(lcxx);
			}
			else
				dao.saveOrUpdate(lcxx);
		}
	}

}
