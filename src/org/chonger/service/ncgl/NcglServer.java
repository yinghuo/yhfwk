package org.chonger.service.ncgl;

import java.util.List;

import org.chonger.common.ConstantKey;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.Role;
import org.chonger.entity.system.User;
import org.chonger.service.system.RoleManager;
import org.chonger.service.system.UserManager;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SHAUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title NcglServer.java 牛场信息管理业务逻辑
* @package org.chonger.service.ncgl
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class NcglServer {
	
	@Autowired
	private CommonDAO<NCJBXX> dao;	
	@Autowired
	private UserManager userManager;
	@Autowired
	private RoleManager roleManager;
	
	
	/**获取查询所有的语句*/
	public String getQueryString()
	{
		return "from NCJBXX model";
	}
	
	/**
	 * 判断牛场编号是否存在
	 * @param ncbh
	 * @return
	 * @retrun boolean 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public boolean checkNCBHExist(String ncbh)
	{
		return dao.getCount("select count(*) from NCJBXX model where model.ncbh='"+ncbh+"'")>0;
	}
	
	/**
	 * 查找所有的牛场信息
	 * @Title: finaAll 
	 * @Description: 
	 * @retrun List<NCJBXX> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public List<NCJBXX> findAll()
	{
		return dao.find(getQueryString());
	}
	
	/**
	 * 根据牛场的xh查询牛场信息
	 * @param id
	 * @retrun NCJBXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public NCJBXX findNcxxById(String id)
	{
		List<NCJBXX> resultNcxxList=dao.find(getQueryString()+" where model.xh='"+id+"'");
		if(resultNcxxList!=null&&resultNcxxList.size()>0)
			return resultNcxxList.get(0);
		return null;
	}
	
	/**
	 * 牛场授权信息，平台管理员使用
	 * @param Ncxx
	 * @param user
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void authorize(NCJBXX Ncxx,User user) throws Exception
	{
		if(Ncxx!=null&&user!=null)
		{
			user.setUpassword(SHAUtils.CreateSHAKey(user.getUpassword()));
			user.setUname(user.getUloginname());
			
			//用户授权
			Role role=roleManager.findDefaultRole(ConstantKey.UserType_User);
			user.setUroleid(role.getRid());
			//保存用户信息
			userManager.saveOrUpdata(user);
			//保存牛场信息
			Ncxx.setYhid(user.getUid());
			saveOrUpdate(Ncxx);
		}
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
	public void saveOrUpdate(NCJBXX Ncxx)
	{
		if(Ncxx!=null)
		{
			if(StringUtil.IsEmpty(Ncxx.getXh()))
			{
				//牛场编号为空，表示新增，进行自动编号
				Ncxx.setXh(CommUUID.getUUID());
				
				dao.save(Ncxx);
			}
			else
			{
				dao.saveOrUpdate(Ncxx);
			}
		}
	}
	
}
