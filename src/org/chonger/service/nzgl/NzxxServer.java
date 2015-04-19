
package org.chonger.service.nzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NzxxServer.java 牛只信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NzxxServer {
	@Autowired
	private CommonDAO<NZJBXX> dao;
	
	/**
	 * 依据牛只的id信息查询牛只信息
	 * @Title: queryNZById 
	 * @Description: 
	 * @param id
	 * @retrun NZJBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZJBXX queryNZById(String id)
	{
		List<NZJBXX> resultList=dao.find(getQueryString()+" where model.xh='"+id+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public String getQueryString()
	{
		return "from NZJBXX model";
	}
	
	/**
	 * 保存或更新牛只信息
	 * @Title: saveOrUpdate 
	 * @Description: 
	 * @param Ncxx
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpdate(NZJBXX Nzxx)
	{
		if(Nzxx!=null)
		{
			if(StringUtil.IsEmpty(Nzxx.getXh()))
			{
				//牛只序号为空，表示新增，进行自动编号
				Nzxx.setXh(CommUUID.getUUID());
				dao.save(Nzxx);
			}
			else
				dao.saveOrUpdate(Nzxx);
		}
	}
	
	
}
