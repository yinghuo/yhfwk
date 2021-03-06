package org.chonger.web;

import java.io.IOException;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantKey;
import org.chonger.entity.jbxx.YGJBXX;
import org.chonger.entity.system.Menu;
import org.chonger.entity.system.Role;
import org.chonger.entity.system.User;
import org.chonger.service.system.MenuManager;
import org.chonger.service.system.RoleManager;
import org.chonger.service.system.UserManager;
import org.chonger.service.yggl.YgxxServer;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @Title：用户登录Action 1.0 
 * @Description：主要应用系统的用户登录校验
 * 
 * @fileName LoginAction.java
 * @create 2014-05-12
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "success", type = "json", params = { "root", "infos"})
})
public class LoginAction extends ActionSupport {
	
	@Autowired
	private YgxxServer server;
	
	final boolean debug=true;
	
	private String loginName;
	private String loginPwd;
	private String loginVcode;
	private String regPhone;
	private String regEmail;
	private String qyregKey;//企业注册码
	private String id;//ID信息
	
	public String getQyregKey() {
		return qyregKey;
	}
	public void setQyregKey(String qyregKey) {
		this.qyregKey = qyregKey;
	}
	public void setRegPhone(String regPhone) {
		this.regPhone = regPhone;
	}
	public void setRegEmail(String regEmail) {
		this.regEmail = regEmail;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}
	public void setLoginVcode(String loginVcode) {
		this.loginVcode = loginVcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	//操作结果，传递给界面进行处理
	private Map<String, String> infos = new LinkedHashMap<String, String>();
	
	@Autowired
	private MenuManager menumanager;
	
	@Autowired
	private UserManager userManager;
	
	@Autowired
	private RoleManager roleManager;
	
	
	public Map<String, String> getInfos() {
		return infos;
	}
	public void setInfos(Map<String, String> infos) {
		this.infos = infos;
	}
	@Override
	public String execute() throws Exception {
		
		if(StringUtil.IsEmpty(loginName))
		{
			infos.clear();
			infos.put("login","fail");
			infos.put("msg","请输入用户名！");
			return "success";
		}
		if(StringUtil.IsEmpty(loginPwd))
		{
			infos.clear();
			infos.put("login","fail");
			infos.put("msg","请输入登陆密码！");
			return "success";
		}
		
		/*if(StringUtil.IsEmpty(loginVcode))
		{
			infos.clear();
			infos.put("login","fail");
			infos.put("msg","请输入验证码！");
			return "success";
		}
		
		Object vobj=ServletActionContext.getRequest().getSession().getAttribute(ConstantKey.LoginVcodeKey);
		if(vobj!=null)
		{
			if(!loginVcode.equals((String)vobj))
			{
				infos.clear();
				infos.put("login","fail");
				infos.put("msg","验证码错误！");

				ServletActionContext.getRequest().getSession().setAttribute(ConstantKey.LoginVcodeKey,null);
				
				return "success";
			}
		}
		else
		{
			infos.clear();
			infos.put("login","fail");
			infos.put("msg","验证码错误！");
			return "success";
		}
		*/
		try
		{
			//校验用户名密码
			User user=userManager.LoginUser(loginName, loginPwd);
			if(user!=null)
			{
				//加载用户的角色
				Role userRole=roleManager.findById(user.getUroleid());
				user.setRole(userRole);
				ServletActionContext.getRequest().getSession().setAttribute(UserManager.USERSESSIONKEY, user);
				ServletActionContext.getRequest().getSession().setAttribute("uname", user.getUname());
				ServletActionContext.getRequest().getSession().setAttribute("ulname", user.getUloginname());
				ServletActionContext.getRequest().getSession().setAttribute("uid", user.getUid());				
				userManager.UpdateLoginTime(user);//Daniel 更新登陆时间
				infos.clear();
				infos.put("login","access");				
			}
			else
			{
				infos.clear();
				infos.put("login","fail");
				infos.put("msg","错误的用户名和密码！");
			}
		}catch(Exception ex)
		{
			infos.clear();
			infos.put("login","fail");
			infos.put("msg","登陆异常："+ex.getMessage());
		}
		return "success";
	}
	
	
	public void access() throws IOException
	{
		//获取当前登录的用户信息，然后根据用户的角色加载用户菜单
		Object Userobj=ServletActionContext.getRequest().getSession().getAttribute(UserManager.USERSESSIONKEY);
		User user=null;
		List<Menu> allmenus=null;
		if(Userobj!=null)
		{
			try {
				user=(User)Userobj;				
				ServletActionContext.getRequest().getSession().setAttribute("urole",user.getRole().getRname());
				ServletActionContext.getRequest().getSession().setAttribute(ConstantKey.SESSION_USER_NCXX_OBJECT,user.getNcjbxx());
				allmenus=menumanager.loadMenusByUserRole(user.getRole());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else//未登录
		{
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/login.jsp");
		}
		
		//初始化系列菜单
		if(allmenus!=null)
		{
			cacheMenus.clear();
			intMenus(allmenus);//初始化菜单，无序状态
			//System.out.println("初始化菜单完成="+cacheMenus.size());
			//菜单结构转换，将缓存的所有菜单转换为Tree
			Map<String,Menu> mymenus=menumanager.convert2tree(cacheMenus);
			String jsonmenus=menumanager.convert2Json(mymenus);
			//System.out.println(jsonmenus);
			allmenus.clear();			
			for(Menu menu : mymenus.values())
				allmenus.add(menu);
			//@modify Daniel 2014-08-01 1:添加针对性排序，主要修复子级菜单不全排序后置。
			try
			{
				Collections.sort(allmenus,menumanager.getComparatorList());
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			ServletActionContext.getRequest().getSession().setAttribute(MenuManager.MENUSSESSIONKEY, allmenus);
			ServletActionContext.getRequest().getSession().setAttribute(MenuManager.MENUSSESSIONJSONKEY, jsonmenus);
			
			//加载员工信息
			if(!StringUtil.IsEmpty(id))
			{
				YGJBXX ygjbxx=server.getEntityById(id);
				if(ygjbxx!=null)
				{
					ServletActionContext.getRequest().getSession().setAttribute(YgxxServer.YGXX, ygjbxx);
					ServletActionContext.getRequest().getSession().setAttribute(YgxxServer.YGXXID, ygjbxx.getXh());
					ServletActionContext.getRequest().getSession().setAttribute(YgxxServer.YGXXNAME, ygjbxx.getYgmc());
				}
				else
					ServletActionContext.getRequest().getSession().setAttribute(YgxxServer.YGXXNAME,user.getRole().getRname());
			}
			else
				ServletActionContext.getRequest().getSession().setAttribute(YgxxServer.YGXXNAME,user.getRole().getRname());
			
			//判断跳转
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/admin/pages/");
		}
		else
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/login.jsp");
	}
	
	private Map<String,Menu> cacheMenus=new LinkedHashMap<String,Menu>();
	/**
	 * 初始化完善菜单
	 */
	private void intMenus(List<Menu> menus)
	{
		//
		//遍历菜单，判断菜单所处等级，如果是一级菜单，则加载所有的二级菜单，如果是二级菜单，判断父级菜单是否存在，如果不存在则加载父级菜单
		//加载所有的子级菜单，如果是三级菜单，则判断父级菜单是否存在，依次添加父级菜单
		if(menus!=null&&menus.size()>0)
		{
			//构建缓存
			putCacheData(menus);
			
			for(Menu menu : menus)
			{
				switch(menu.getMlevel())
				{
					case 0://一级菜单
						//加载子级菜单
						initChildMenus(menu);
						break;
					case 1://二级菜单
						initChildMenus(menu);
						initParentMenus(menu);
						break;
					case 2://三级菜单
						initParentMenus(menu);
						break;
				}
			}
		}
	}
	
	/**
	 * 初始化子级菜单
	 * @param role
	 */
	private void initChildMenus(Menu menu)
	{
		List<Menu> childMenus=menumanager.loadMenusByParentId(menu.getMid());
		//putCacheData(childMenus);
		//处理子类
		intMenus(childMenus);
	}
	
	/**
	 * 初始化父级菜单
	 * @param menu
	 */
	private void initParentMenus(Menu menu)
	{
		if(!StringUtil.IsEmpty(menu.getMparentid()))
		{
			menu=menumanager.loadMenuById(menu.getMparentid());
			if(menu!=null)
				putCacheData(menu);
		}
	}
	
	/**
	 * 构建缓存
	 * @param menu
	 */
	private void putCacheData(Menu menu)
	{
		if(!cacheMenus.containsKey(menu.getMid()))
				cacheMenus.put(menu.getMid(),menu);
	}
	/**
	 * 构建缓存
	 * @param menu
	 */
	private void putCacheData(List<Menu> menus)
	{
		for(Menu menu : menus)
			putCacheData(menu);
	}
	
	public String logout() throws IOException
	{
		System.out.println("用户登出");
		//清除session数据
		ServletActionContext.getRequest().getSession().removeAttribute(UserManager.USERSESSIONKEY);
		ServletActionContext.getRequest().getSession().removeAttribute(MenuManager.MENUSSESSIONKEY);
		ServletActionContext.getRequest().getSession().removeAttribute(MenuManager.MENUSSESSIONJSONKEY);
		ServletActionContext.getRequest().getSession().removeAttribute("uname");
		ServletActionContext.getRequest().getSession().removeAttribute("uid");
		//切换菜单
		//跳转到主页
		//ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath());
		infos.clear();
		infos.put("logout","flase");
		
		return "success";
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
		
		return "success";
	}
	
	public String checkPhone()
	{
		
		return "";
	}
	
	public String checkEmail()
	{
		return "";
	}	
}
