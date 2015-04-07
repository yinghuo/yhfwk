package org.chonger.service.system;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.system.Role;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
@Transactional
/**
 * 角色管理业务管理类
 * 主要实现角色管理业务中的相关操作。
 * 
 * @author Daniel
 * @create 2014-06-10 
 * @version 1.0
 */
public class RoleManager {
	
	/**
	 * 管理员角色类型
	 */
	public static final String ROLETYPE_ADMIN="1";
	/**
	 * 用户角色类型
	 */
	public static final String ROLETYPE_USER="2";
	/**
	 * 企业角色类型
	 */
	public static final String ROLETYPE_ENTERPRISE="3";
	
	@Autowired
	private CommonDAO<Role> roleDAO;
	
	/**
	 * 保存或者更新角色数据
	 * @param role
	 * @throws Exception
	 */
	public void saveOrUpdata(Role role) throws Exception
	{
		//判断是新增还是更新，依据ID来判断，如果有ID则进行更新操作，如果无ID则是新增生成ID
		if(role.getRid()==null||"".equals(role.getRid()))
		{
			role.setRid(CommUUID.getUUID());
			roleDAO.save(role);
		}
		else
		{
			roleDAO.saveOrUpdate(role);
		}
	}
	
	/**
	 * 查询所有的角色数据
	 * @return
	 * @throws Exception
	 */
	public List<Role> findAll() throws Exception
	{
		return roleDAO.find(findAllString(null));// where model.rstatus='0' 默认查询所有，在页面进行是否可用区分。
	}
	
	/**
	 * 获取查询所有的查询语句，可使用名称过滤
	 * @param namefilter
	 * @return
	 */
	public String findAllString(String namefilter)
	{
		if(StringUtil.IsEmpty(namefilter))
			return "from Role model";
		else
			return "from Role model where model.rname like '%"+namefilter+"%'";
	}
	
	/**
	 * 查询当前系统的所有可用的角色信息
	 * @return
	 */
	public List<Role> findAlloOfStatus0()
	{
		return roleDAO.find("from Role model where model.rstatus='0'");
	}
	
	/**
	 * 根据ID查询用户角色
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public Role findById(String id) throws Exception
	{
		List<Role> lstResult=roleDAO.find("from Role model where model.rid='"+id+"'");
		Role role=null;
		if(lstResult!=null&&lstResult.size()>0)
			role=lstResult.get(0);
		lstResult.clear();
		return role;
	}
	
	/**
	 * 获取系统设置的默认前台角色
	 * @return
	 */
	public Role findDefaultRole(String type)
	{
		List<Role> lstResult=roleDAO.find("from Role model where model.rdefault='"+type+"'");
		Role role=null;
		if(lstResult!=null&&lstResult.size()>0)
			role=lstResult.get(0);
		lstResult.clear();
		return role;
	}
	
	/**
	 * 根据菜单ID删除角色中的菜单的信息
	 * @param menuid
	 */
	public void delete(String menuid)
	{
		//先依据ID查询所有符合的角色，然后删除角色中的菜单
		List<Role> roles=roleDAO.find("from Role model where model.rmids like '"+menuid+",%' or model.rmids like '%,"+menuid+"' or model.rmids like '%,"+menuid+",%' or model.rmids like '"+menuid+"'");
		if(roles!=null&&roles.size()>0)
		{
			for(Role role : roles)
			{
				String[] menus=role.getRmids().split(",");
				String ids="";
				for(String str : menus)
				{
					if(!str.equals(menuid))ids+=str+",";
				}
				if(!StringUtil.IsEmpty(ids))
					role.setRmids(ids.substring(0,ids.length()-1));
				else
					role.setRmids(null);
				
				roleDAO.saveOrUpdate(role);
			}
		}
	}
	
	/**
	 * 删除指定的角色，如果是管理员账户的角色删除，需要将用户的角色重置为默认的管理员角色
	 * @param id 要删除的角色ID
	 * @param type 要删除的角色类型
	 */
	public void deleteRole(String id,String type)
	{
			//删除管理员角色，需要重置用户角色为默认管理员角色
			Role adminrole=this.findDefaultRole(type);
			if(adminrole!=null)
			{
				roleDAO.ExecutionHql("update User model set model.uroleid='"+adminrole.getRid()+"' where model.uroleid='"+id+"'");
			}
			else
			{
				roleDAO.ExecutionHql("update User model set model.uroleid=null where model.uroleid='"+id+"'");
			}
		roleDAO.ExecutionHql("delete Role model where model.rid = '"+id+"'");
	}
	
	/**
	 * 父子级菜单
	 */
	//public 
}
