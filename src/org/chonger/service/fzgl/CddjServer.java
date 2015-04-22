package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title CddjServer.java 产犊登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class CddjServer {
	@Autowired
	private CommonDAO<CDDJXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只产犊信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun CDDJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public CDDJXX queryNZById(String id)
	{
		List<CDDJXX> resultList=dao.find(getQueryString()+" where model.nzbh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString()
	{
		return "from CDDJXX model";
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Cdxx
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(CDDJXX Cdxx)
	{
		if(Cdxx!=null)
		{
			if(StringUtil.IsEmpty(Cdxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Cdxx.setXh(CommUUID.getUUID());
				dao.save(Cdxx);
			}
			else
				dao.saveOrUpdate(Cdxx);
		}
	}

}
