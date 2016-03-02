package org.chonger.service.nzgl;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NzfzServer.java 牛只繁殖信息管理业务逻辑
* @package org.chonger.service.nzgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NzfzServer {
	
	@Autowired
	private CommonDAO<NZFZZTXX> dao;
	
	@Autowired
	private NzxxServer nzServer;
	
	/**
	 * 指保存和保存牛只的繁殖状态信息
	 * @param nzxx
	 * @param zt
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpDate(NZJBXX nzxx,int zt)
	{
		//查询牛只的繁殖状态信息
		NZFZZTXX _updateEntity=findEntity(nzxx.getXh());
		if(_updateEntity!=null)
		{
			_updateEntity.setZt(zt);
			dao.saveOrUpdate(_updateEntity);
		}
		else//新建
		{
			//2016-01-11 Daniel 修改创建逻辑
			_updateEntity=new NZFZZTXX();
			//_updateEntity.setXh(nzxx.getXh());
			_updateEntity.setXh(CommUUID.getUUID());
			_updateEntity.setZt(zt);
			dao.save(_updateEntity);
			
			nzxx.setFzztxh(_updateEntity.getXh());
			nzServer.saveOrUpdate(nzxx);
		}
		
	}
	
	/**
	 * 保存和更新繁殖状态信息
	 * @param fzxx
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public void saveOrUpDate(String nzxxId,NZFZZTXX fzxx)
	{
		if(StringUtil.IsEmpty(fzxx.getXh()))
		{
			//查询当前牛只序号对应的状态是否存在，更新时只会存在值
			//NZFZZTXX _updateEntity=findEntity(nzxxId);
			//if(_updateEntity!=null)//存在指定的繁殖状态信息
			//{
			//	_updateEntity.
				
			//}
			//else//不存在繁殖状态信息
			//{
			//2016-01-11 Daniel 修改创建逻辑
				//fzxx.setXh(nzxxId);
			fzxx.setXh(CommUUID.getUUID());
				dao.save(fzxx);
			//}
				NZJBXX nzxx = nzServer.queryNZById(nzxxId);
				nzxx.setFzztxh(fzxx.getXh());
				nzServer.saveOrUpdate(nzxx);
		}
		else
		{
			dao.saveOrUpdate(fzxx);
		}
	}
	
	/**
	 * 查询指定
	 * @param nzxxId
	 * @retrun NZFZZTXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NZFZZTXX findEntity(String nzxxId)
	{
		List<NZFZZTXX> resultList=dao.find("from NZFZZTXX model where model.xh='"+nzxxId+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
}
