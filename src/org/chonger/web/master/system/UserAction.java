package org.chonger.web.master.system;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.system.Role;
import org.chonger.entity.system.User;
import org.chonger.service.system.RoleManager;
import org.chonger.service.system.UserManager;
import org.chonger.utils.RollPage;
import org.chonger.utils.SHAUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：用户管理Action 1.0 
 * @Description：主要应用于系统用户的管理
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
	@Result(name = "list.jsp", location = "/admin/pages/system/users/users.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/system/users/users_edit.jsp")
})
public class UserAction extends ActionSupport {
	
	//json传输消息
	private Map<String, String> infos = new LinkedHashMap<String, String>();
	public Map<String, String> getInfos() {
		return infos;
	}
	
	@Autowired
	private RoleManager roleManager;//角色管理功能
	@Autowired
	private UserManager userManager;//用户管理功能
	
	//页面操作role集合
	private List<Role> roles;
	public List<Role> getRoles() {
		return roles;
	}
	
	private List<User> users;
	public List<User> getUsers() {
		return users;
	}
	
	//修改辅助对象
	private User editUser;
	public User getEditUser() {
		return editUser;
	}
	public void setEditUser(User editUser) {
		this.editUser = editUser;
	}
	
	private String loginName;//界面输入登录名，主要用来是否存在校验，该字段也作为前台查询条件字段
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getLoginName() {
		return loginName;
	}
	
	private String id;
	public void setId(String id) {
		this.id = id;
	}
	
	@Autowired
	private RollPage<User> pages;
	public RollPage<User> getPages() {
		return pages;
	}
	//翻页页码
	private int page;
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	/**
	 * 加载初始化操作
	 * @return
	 */
	public String doAddInit()
	{
		//加载当前系统的所有角色信息
		roles=roleManager.findAlloOfStatus0();
		return "edit.jsp";
	}
	
	/**
	 * 
	 * @return
	 */
	public String doSave()
	{
		editUser.setUloginname(editUser.getUloginname());
		editUser.setUpassword(editUser.getUpassword());
		editUser.setUname(editUser.getUname());
		
		if(StringUtil.IsEmpty(editUser.getUid()))//新增
		{
			//转码
			editUser.setUpassword(SHAUtils.CreateSHAKey(editUser.getUpassword()));
			
			infos.clear();
			infos.put("error","0");
			infos.put("msg", "添加用户成功！");
		}
		else
		{
			//查询用户信息
			User u=userManager.findUserById(editUser.getUid());
			editUser.setUfaceimage(u.getUfaceimage());
			
			if(StringUtil.IsEmpty(editUser.getUpassword()))
				editUser.setUpassword(u.getUpassword());
			else
				editUser.setUpassword(SHAUtils.CreateSHAKey(editUser.getUpassword()));
			
			editUser.setUserInfo(u.getUserInfo());
			editUser.setUtype(u.getUtype());
			
			infos.clear();
			infos.put("error","0");
			infos.put("msg", "修改用户成功！");
		}
		//保存操作
		try {
			userManager.saveOrUpdata(editUser);
			
		} catch (Exception e) {
			e.printStackTrace();
			infos.clear();
			infos.put("error","1");
			infos.put("msg", e.getMessage());
		}
		
		return "infos";
	}
	
	/**
	 * 检查用户是否存在
	 * {"checked":"true"} 账户已存在
	 * {"checked":"false"} 账户不存在
	 * @return
	 */
	public String doLNameExist()
	{
		boolean isExist=userManager.checkLoginNameExist(loginName);
		
		infos.clear();
		infos.put("checked",isExist+"");
		
		return "infos";
	}
	
	/**
	 * 查询所有用户信息
	 * @return 
	 */
	public String listUsers()
	{
		pages.setPageSize(12);
		pages.setCommandText(userManager.findAllUsersSql(loginName));
		try {
			pages.init();
			
			if(page>0)
				pages.doPageJump(page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//users=userManager.findAllUsers();
		users=pages.getDataSource();
		
		return "list.jsp";
	}
	
	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String doEdit()
	{
		if(!StringUtil.IsEmpty(id))
		{
			editUser=userManager.findUserById(id);
		}
		return doAddInit();
	}
	
	public String doDelete()
	{
		if(!StringUtil.IsEmpty(id))
		{
			userManager.deleteUser(id);
			
			infos.clear();
			infos.put("error","0");
			infos.put("msg","删除用户成功");
		}
		else
		{
			infos.clear();
			infos.put("error","1");
			infos.put("msg","错误的用户信息！");
		}
		return "infos";
	}
	
	
}
