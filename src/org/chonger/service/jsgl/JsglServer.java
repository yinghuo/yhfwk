package org.chonger.service.jsgl;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
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
	
	@Autowired
	private NzxxServer nzxxServer;
	
	public String getQueryString(String bh,String mc)
	{
		String sql="from JSJBXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(bh))sql+=" and model.jsbh like '%"+bh+"%' ";
		if(!StringUtil.IsEmpty(mc))sql+=" and model.jsmc like '%"+mc+"%'";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		return sql;
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
	public List<JSJBXX> findAll()
	{
		return dao.find(getQueryString(null,null));
	}
	
	/**
	 * 获取圈舍的编号和id的字典
	 * @return
	 * @retrun Map<String,String> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public Map<String,String> findBh$IdMap()
	{
		List<JSJBXX> jsxxList=findAll();
		Map<String,String> jsxxMap=null;
		if(jsxxList!=null)
		{
			jsxxMap=new LinkedHashMap<String,String>();
			for(JSJBXX jsxx : jsxxList)
			{
				jsxxMap.put(jsxx.getJsbh(),jsxx.getXh());
			}
		}
		return jsxxMap;
	}
	
	/**
	 * 根据牛场编号查询圈舍信息
	 * @Title: findAllByNcbh 
	 * @Description: 
	 * @param ncbh 要查询的牛场编号
	 * @retrun List<JSJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @modify 2015-05-03	Daniel	1:新增企业查询权限
	 */
	public List<JSJBXX> findAllByNcbh(String ncbh)
	{
		//企业用户角色
		User user=SessionUtils.getUser();	
		if(user!=null&&user.getRole()!=null)
		{
			if(user.getRole().getRtype()==2)
			{
				ncbh=user.getNcjbxx().getXh();
			}
			return dao.find(getQueryString(null,null)+" and model.ncbh='"+ncbh+"'");
		}
		return null;
	}
	
	public JSJBXX getEntityById(String id)
	{
		List<JSJBXX> resultList=dao.find(getQueryString(null,null)+" and model.xh=?",id);
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
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
	public void saveOrUpdate(JSJBXX jsxx) throws Exception
	{
		if(jsxx!=null)
		{
			//权限校验
			User user = SessionUtils.getUser();
			if(user!=null)
			{
				int rtype=-1;
				// 企业用户关联我的牛场信息
				if ((rtype=user.getRole().getRtype()) == 2) {
					NCJBXX ncxx = user.getNcjbxx();
					if (ncxx != null) {
						jsxx.setNcbh(ncxx.getXh());
					}
				}
				
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
	
	/**
	 * 
	 * @Title: delete 
	 * @Description: 
	 * @param id
	 * @throws Exception
	 * @retrun void 
	 * @author Daniel
	 * @version V1.0
	 */
	public void delete(String id) throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//企业用户角色
			User user=SessionUtils.getUser();	
			if(user!=null&&user.getRole()!=null)
			{
				String deleteHql="delete JSJBXX model where model.xh='"+id+"'";
				if(user.getRole().getRtype()==2)
				{
					deleteHql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
				}
				
				//检查该圈舍是否有存在的牛只信息
				if(nzxxServer.getNZCountByJSXX(id)>0)
					throw new Exception("删除错误，这个圈舍中还有牛牛哦！");
				
				dao.ExecutionHql(deleteHql);
			}
		}
	}
}
