package org.chonger.web.master.system;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.system.Menu;
import org.chonger.service.system.MenuManager;
import org.chonger.utils.CommUUID;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：菜单管理Action 1.0 
 * @Description：主要应用于前台菜单+后台菜单的加载
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
	@Result(name = "edit.jsp", location = "/admin/pages/system/menus/menus_edit.jsp"),
	@Result(name = "menus.jsp", location = "/admin/pages/system/menus/menus.jsp")
})
public class MenuAction extends ActionSupport {
	
	@Autowired
	private MenuManager menumanager ;
	
	
	private Map<String, String> infos = new LinkedHashMap<String, String>();
	public Map<String, String> getInfos() {
		return infos;
	}
	
	private List<Menu> menus;
	
	public List<Menu> getMenus() {
		return menus;
	}

	/**
	 * 公共函数，依据当前操作用户加载菜单
	 * @return
	 * 
	 * @author Daniel
	 * @create 2014-05-12
	 */
	public String MyMenus()
	{
		//默认管理员，直接加载所有后台权限
		List<Menu> myMenus=menumanager.loadMenuByType(MenuManager.MENUSMASTERTYPE);
		
		return "";
	}
	
	/**
	 * 管理函数，加载所有的菜单
	 * @return
	 */
	public String AllMenus()
	{
		//加载系统的所有菜单
		menus=menumanager.loadAllMenu();
		return "menus.jsp";
	}
	
	private String editid;//菜单ID
	public String getEditid() {
		return editid;
	}
	public void setEditid(String editid) {
		this.editid = editid;
	}
	
	
	private Menu editmenu=new Menu();
	public Menu getEditmenu() {
		return editmenu;
	}

	/**
	 * 编辑菜单，依据用户的选择加载菜单的详细信息
	 * @return
	 */
	public String doEdit()
	{
		if(!StringUtil.IsEmpty(editid))
		{
			editmenu=menumanager.loadMenuById(editid);
			if(editmenu==null)
			{
				infos.clear();
				infos.put("error","1");
				infos.put("msg","无效的菜单ID:"+editid);
				return "infos";
			}
		}
		else
		{
			infos.clear();
			infos.put("error","1");
			infos.put("msg","无效的菜单ID:"+editid);
			return "infos";
		}
		return "edit.jsp";
	}
	
	private String addtype;
	public void setAddtype(String addtype) {
		this.addtype = addtype;
	}

	/**
	 * 保存更新菜单，依据用户填写的信息保存或更新菜单信息
	 * @return
	 */
	public String doSaveOrUpdate()
	{
//		System.out.println("测试输出editmenu数据："+addtype);
//		System.out.println("Mid-->"+editmenu.getMid());
//		System.out.println("Mname-->"+editmenu.getMname());
//		System.out.println("Mtitle-->"+editmenu.getMtitle());
//		System.out.println("Mparentid-->"+editmenu.getMparentid());
//		System.out.println("Maction-->"+editmenu.getMaction());
//		System.out.println("Mseq-->"+editmenu.getMseq());
//		System.out.println("Mtype-->"+editmenu.getMtype());
//		System.out.println("Mlevel-->"+editmenu.getMlevel());
		
		//过滤参数
		editmenu.setMaction(editmenu.getMaction());
		editmenu.setMname(editmenu.getMname());
		
		//保存操作
		try {
			
			if(StringUtil.IsEmpty(editmenu.getMid()))
			{
				editmenu.setMid(CommUUID.getUUID());
				menumanager.save(editmenu);
				infos.clear();
				infos.put("error","0");
				infos.put("msg","新增成功!");
			}
			else
			{
				menumanager.saveOrUpdate(editmenu);
				infos.clear();
				infos.put("error","0");
				infos.put("msg","更新成功!");
			}
			
			
			//如果是新增，则刷新缓存菜单  //取消判断，如果是修改了名称，也需要重新刷新
			//if(!addtype.equals("-1"))
			//{
				//
				//加载菜单
//				List<Menu> allmenus=menumanager.loadMenuByType(MenuManager.MENUSMASTERTYPE);
//				Map<String,Menu> mymenus=menumanager.convert2tree(allmenus);
//				String jsonmenus=menumanager.convert2Json(mymenus);
//				
//				allmenus.clear();
//				System.out.println(mymenus.values().size());
//				
//				for(Menu menu : mymenus.values())
//					allmenus.add(menu);
//				
//				ServletActionContext.getRequest().getSession().setAttribute(MenuManager.MENUSSESSIONKEY, allmenus);
//				ServletActionContext.getRequest().getSession().setAttribute(MenuManager.MENUSSESSIONJSONKEY, jsonmenus);
			//}
			
		} catch (Exception e) {
			e.printStackTrace();
			infos.clear();
			infos.put("error","1");
			infos.put("msg","操作异常，"+e.getMessage());
		}
		return "infos";
	}
	
	public String doDelete() throws Exception
	{
		if(!StringUtil.IsEmpty(editid))
		{
			Menu menu=menumanager.loadMenuById(editid);
			menumanager.delete(menu);
			
			infos.clear();
			infos.put("error","0");
			infos.put("msg","删除成功！");
		}
		else
		{
			infos.clear();
			infos.put("error","1");
			infos.put("msg","无效的菜单ID:"+editid);
			return "infos";
		}
		return "infos";
	}
}
