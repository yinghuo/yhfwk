package org.chonger.service.nzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZMRZTXX;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NzmrServer.java 牛只泌乳信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NzmrServer {
	@Autowired
	private CommonDAO<NZMRZTXX> dao;
	
	/**
	 * 只更新和保存牛只的泌乳状态信息
	 * @param nzxx
	 * @param zt
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpDate(NZJBXX nzxx,int zt)
	{
		NZMRZTXX _updateEntity=findEntity(nzxx.getXh());
		if(_updateEntity!=null)
		{
			_updateEntity.setZt(zt);
			dao.saveOrUpdate(_updateEntity);
		}
		else//新建
		{
			_updateEntity=new NZMRZTXX();
			_updateEntity.setXh(nzxx.getXh());
			_updateEntity.setZt(zt);
			dao.save(_updateEntity);
		}
	}
	
	/**
	 * 更新和保存牛只的泌乳状态信息
	 * @param nzxx
	 * @param zt
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpDate(String nzxxId,NZMRZTXX mrzt)
	{
		if(StringUtil.IsEmpty(mrzt.getXh()))
		{
			mrzt.setXh(nzxxId);
			dao.save(mrzt);
		}
		else
		{
			dao.saveOrUpdate(mrzt);
		}
	}
	
	/**
	 * 根据id获取实体信息
	 * @param nzxxId
	 * @retrun NZMRZTXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZMRZTXX findEntity(String nzxxId)
	{
		List<NZMRZTXX> resultList=dao.find("from NZMRZTXX model where model.xh='"+nzxxId+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
}
