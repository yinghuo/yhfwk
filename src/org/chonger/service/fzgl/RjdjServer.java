package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.RSJCXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title RjdjServer.java 妊检登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class RjdjServer {
	@Autowired
	private CommonDAO<RSJCXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只妊检信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun RSJCXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public RSJCXX queryNZById(String id)
	{
		List<RSJCXX> resultList=dao.find(getQueryString()+" where model.nzbh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString()
	{
		return "from RSJCXX model";
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param RSJCXX
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(RSJCXX rjxx)
	{
		if(rjxx!=null)
		{
			if(StringUtil.IsEmpty(rjxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				rjxx.setXh(CommUUID.getUUID());
				dao.save(rjxx);
			}
			else
				dao.saveOrUpdate(rjxx);
		}
	}

}
