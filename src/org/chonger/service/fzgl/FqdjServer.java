package org.chonger.service.fzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title FqdjServer.java 发情登记业务逻辑
* @package org.chonger.service.fzgl
* @author Liuzq
* @create 2015-4-16 
 */
@Service
@Transactional
public class FqdjServer {
	@Autowired
	private CommonDAO<FQDJXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只产犊信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun FQDJXX 
	 * @throws 
	 * @author liuzq
	 * @version V1.0
	 */
	public FQDJXX queryNZById(String id)
	{
		List<FQDJXX> resultList=dao.find(getQueryString()+" where model.nzbh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString()
	{
		return "from FQDJXX model";
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Fqxx
	 * @throws 
	 * @author Liuzq
	 * @version V1.0
	 */
	public void saveOrUpdate(FQDJXX Fqxx)
	{
		if(Fqxx!=null)
		{
			if(StringUtil.IsEmpty(Fqxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Fqxx.setXh(CommUUID.getUUID());
				dao.save(Fqxx);
			}
			else
				dao.saveOrUpdate(Fqxx);
		}
	}

}
