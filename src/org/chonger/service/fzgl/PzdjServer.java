package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.PZDJXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title RjdjServer.java 配种登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class PzdjServer {
	@Autowired
	private CommonDAO<PZDJXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只配种信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun PZDJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public PZDJXX queryNZById(String id)
	{
		List<PZDJXX> resultList=dao.find(getQueryString()+" where model.nzbh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString()
	{
		return "from PZDJXX model";
	}
	
	/**
	 * 保存或更新牛只配种信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param PZDJXX
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(PZDJXX pzxx)
	{
		if(pzxx!=null)
		{
			if(StringUtil.IsEmpty(pzxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				pzxx.setXh(CommUUID.getUUID());
				dao.save(pzxx);
			}
			else
				dao.saveOrUpdate(pzxx);
		}
	}

}
