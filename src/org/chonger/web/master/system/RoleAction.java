package org.chonger.web.master.system;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.system.Menu;
import org.chonger.entity.system.Role;
import org.chonger.service.system.MenuManager;
import org.chonger.service.system.RoleManager;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：角色管理Action 1.0 
 * @Description：主要应用于系统角色的管理
 * 
 * @fileName MenuAction
 * @create 2014-05-12
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "infos"}),
	@Result(name = "list.jsp", location = "/admin/pages/system/roles/roles.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/system/roles/roles_edit.jsp")
})
public class RoleAction extends ActionSupport  {
	
	private Role editRole;
	public Role getEditRole() {
		return editRole;
	}
	public void setEditRole(Role editRole) {
		this.editRole = editRole;
	}
	
	private String eid;//也可使用editRole.rid代替，创建对象是否会影响性能？，该属性也作为前台名称查询字段
	public void setEid(String eid) {
		this.eid = eid;
	}
	
	//json传输消息
	private Map<String, String> infos = new LinkedHashMap<String, String>();
	public Map<String, String> getInfos() {
		return infos;
	}
	
	//页面操作role集合
	private List<Role> roles;
	public List<Role> getRoles() {
		return roles;
	}
	//页面操作包含菜单名称集合
		private List rolesALL;
		
	public List getRolesALL() {
			return rolesALL;
		}

	@Autowired
	private RoleManager manager;
	@Autowired
	private MenuManager menumanager ;
	
	private List<Menu> menus;
	
	public List<Menu> getMenus() {
		return menus;
	}
	
	@Autowired
	private RollPage<Role> pages;
	public RollPage<Role> getPages() {
		return pages;
	}
	private int page;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	
	/**
	 * 默认加载所有的可用系统菜单
	 */
	@Override
	public String execute() throws Exception {
		menus=menumanager.loadAllMenu();
		return "edit.jsp";
	}
	/**
	 * 新增操作数据提交方法，获取页面用户填写的数据，进行预处理后保存到数据库中。
	 */
	public String addRoles()
	{
		System.out.println("注册角色信息！");
		//参数过滤
		try
		{
			//保存数据库
			editRole.setRstatus("0");
			String roid=editRole.getRid();
			manager.saveOrUpdata(editRole);
			
			infos.clear();
			if(roid==null||"".equals(roid))
			{
				infos.put("msg", "创建成功！");
			}else{
				infos.put("msg", "更新成功！");
			}
			infos.put("error","0");
			
			
		}catch(Exception ex)
		{
			infos.clear();
			infos.put("error","1");
			infos.put("msg", ex.getMessage());
		}
		return "infos";
	}
	
	/**
	 * 新增列表展示方法，查询当前系统的所有角色信息，并进行展示
	 * @return
	 */
	public String listRoles()
	{
		try {
			pages.setPageSize(4);
			pages.setCommandText(manager.findAllString(eid));
			pages.init();
			if(page>0)pages.doPageJump(page);
			roles=pages.getDataSource();
			rolesALL=menumanager.queryMenuByRole(roles);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "list.jsp";
	}
	
	/**
	 * 新增修改角色方法，依据角色ID加载角色信息，进行加载
	 * @return
	 * @throws Exception 
	 */
	public String doEditRoles() throws Exception
	{
		System.out.println("获取到的ID："+eid);
		
		//根据ID加载对象数据，并展示到界面
		try {
			editRole=manager.findById(eid);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return execute();//"edit.jsp";
	}
	public String getEid() {
		return eid;
	}
	
	/**
	 * 删除操作
	 * @return
	 * @throws Exception 
	 */
	public String doDelete() throws Exception
	{
		if(!StringUtil.IsEmpty(eid))
		{
			Role delrole=manager.findById(eid);
			if(delrole!=null)
			{
				if(delrole.getRdefault()>0)
				{
					infos.clear();
					infos.put("error","1");
					infos.put("msg","系统默认角色无法删除！");
				}
				else//删除
				{
					manager.deleteRole(eid, delrole.getRtype()+"");
					
					infos.clear();
					infos.put("error","0");
					infos.put("msg","删除角色成功！");
				}
			}
			else
			{
				infos.clear();
				infos.put("error","1");
				infos.put("msg","错误的角色信息！");
			}
		}
		else
		{
			infos.clear();
			infos.put("error","1");
			infos.put("msg","错误的角色信息！");
		}
		return "infos";
	}
	
}
