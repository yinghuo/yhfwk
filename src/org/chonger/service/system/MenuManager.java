package org.chonger.service.system;


import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.system.Menu;
import org.chonger.entity.system.Role;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @modify by Daniel@2014-05-12	1：添加菜单类型常量MENUSFRONTTYPE、MENUSMASTERTYPE作为菜单类型之分
 * @modify by Daniel@2014-05-13	1：添加菜单类型常量MENUSSESSIONKEY、MENUSSESSIONJSONKEY作为菜单在session中的存储Key
 */
@Service
@Transactional
public class MenuManager {
	/**	前台菜单类型 */
	public static final String MENUSFRONTTYPE="0";
	/**	管理菜单类型 */
	public static final String MENUSMASTERTYPE="1";
	
	/**	菜单SessionKey */
	public static final String MENUSSESSIONKEY="_sys_mymenus";
	public static final String MENUSSESSIONJSONKEY="_sys_mymenus_json";
	
	@Autowired
	private CommonDAO<Menu> menuDao;
	
	@Autowired
	private RoleManager roleManager;
	
	/**
	 * 依据参数菜单类型加载可用菜单
	 * @Note 菜单的mstatus属性为1在该模块为启用状态，0为未启用
	 * @param strType 菜单类型，属性应为<code>MenuManager.MENUSFRONTTYPE</code> 或者 <code>MenuManager.MENUSMASTERTYPE</code>
	 * @return 查找到的菜单集合
	 */
	public List<Menu> loadMenuByType(String strType)
	{
		return menuDao.find("from Menu model where model.mtype=? and model.mstatus='1' order by model.mparentid,model.mseq",strType);
	}
	
	/**
	 * 根据角色加载菜单
	 * @param role
	 * @return
	 */
	public List<Menu> loadMenusByUserRole(Role role)
	{
		//获取角色的菜单ID，
		//处理role的可用菜单ID
		String ids=role.getRmids().replaceAll(",","','");
		List<Menu> menus=menuDao.find("from Menu model where model.mstatus='1' and model.mid in ('"+ids+"') order by model.mparentid,model.mseq");
		return menus;
	}
	
	/**
	 * 加载处理所有的菜单信息，并转换为Tree结构
	 * 
	 * @modify Daniel@2014-08-01 1:修改查询所有菜单的逻辑，只操作后台菜单
	 * 
	 * @return
	 */
	public List<Menu> loadAllMenu()
	{
		List<Menu> menus = menuDao.find("from Menu model where model.mtype='"+MENUSMASTERTYPE+"' order by model.mparentid,model.mseq");
		Map<String,Menu> mymenus=convert2tree(menus);
		menus.clear();
		for(Menu menu : mymenus.values())
			menus.add(menu);
		return menus;
	}
	
	/**
	 * 依据菜单列表转换菜单为Tree结构
	 * @param menus
	 * @return
	 */
	public Map<String,Menu> convert2tree(List<Menu> menus)
	{
		Map<String,Menu> myMenus=new LinkedHashMap<String,Menu>();
		Map<String,Menu> allmenus=new HashMap<String,Menu>();
		for(Menu menu : menus)
		{
			allmenus.put(menu.getMid(),menu);
			if(StringUtil.IsEmpty(menu.getMparentid()))
			{
				String key=menu.getMid();
				if(myMenus.containsKey(key))
				{
					Menu unNameMenu=myMenus.get(key);
					for(Menu item : unNameMenu.child)
						menu.child.add(item);
				}
				myMenus.put(key, menu);				
			}
			else
			{
				String pKey=menu.getMparentid();
				if(myMenus.containsKey(pKey))
				{
					Menu pMenu=myMenus.get(pKey);
					pMenu.child.add(menu);
				}
				else if(allmenus.containsKey(pKey))
				{
					Menu pMenu=allmenus.get(pKey);
					pMenu.child.add(menu);
				}
				else
				{
					Menu unNameMenu=new Menu();
					unNameMenu.setMname("未知父菜单");
					unNameMenu.child.add(menu);
					myMenus.put(pKey, unNameMenu);
				}
				//扫描子级
				if(myMenus.containsKey(menu.getMid()))
				{
					Menu unNameMenu=myMenus.get(menu.getMid());
					for(Menu item : unNameMenu.child)
						menu.child.add(item);
					myMenus.remove(menu.getMid());
				}
			}
		}
		return myMenus;
	}
	/**
	 * 依据菜单列表转换菜单为Tree结构
	 * @param menus
	 * @return
	 */
	public Map<String,Menu> convert2tree(Map<String,Menu> menus)
	{
		List<Menu> menulst=new ArrayList<Menu>();
		Iterator iter=menus.keySet().iterator();
		while(iter.hasNext())
		{
			String key=iter.next().toString();
			menulst.add(menus.get(key));
		}
		return convert2tree(menulst);
	}
	/**
	 * 依据菜单列表转换菜单为Tree结构
	 * @param menus
	 * @return
	 */
	public List queryMenuByRole(List<Role> list)
	{
		List rolelist=new ArrayList();
		Map<String,Object> roleMap=new HashMap<String, Object>();
		for(int i=0;i<list.size();i++){
			roleMap=new HashMap<String, Object>();
			String menuid=list.get(i).getRmids();
			//@modify Daniel 2014-08-04 1：添加校验，由于删除将会造成null的角色
			String menuName=null;
			if(!StringUtil.IsEmpty(menuid))
			{
				String menuids[]=menuid.split(",");
				for(int b=0;b<menuids.length;b++){
					//modify Daniel 2015-01-08 添加菜单读取校验
					List<Menu> menuobjs=menuDao.find("from Menu model where model.mid=?",menuids[b].toString());
					if(menuobjs!=null&&menuobjs.size()>0)
					{
						Menu menu=menuobjs.get(0);
						if(menuName==null||menuName.length()<1){
							menuName=menu.getMname();
						}else{
							menuName=menuName+","+menu.getMname();
						}
					}
					
				}
			}
			roleMap.put("rid", list.get(i).getRid());
			roleMap.put("rname", list.get(i).getRname());
			roleMap.put("menuname", menuName);
			rolelist.add(roleMap);
		}
		return rolelist;
	}
	/**
	 * 依据菜单ID加载菜单的实体对象
	 * @param id
	 * @return
	 * 
	 * @author Daniel
	 * @create 2014-05-14
	 */
	public Menu loadMenuById(String id)
	{
		List<Menu> menus=null;
		menus=menuDao.find("from Menu model where model.mid=? order by model.mseq",id);
		if(menus!=null&&menus.size()>0)
			return menus.get(0);
		return null;
	}
	
	/**
	 * 依据父级ID查询菜单列表
	 * @param id
	 * @return
	 */
	public List<Menu> loadMenuByParentId(String id)
	{
		return menuDao.find("from Menu model where model.mparentid=? order by model.mseq",id);
	}
	/**
	 * 根据父级ID加载菜单
	 * @param id
	 * @return
	 */
	public List<Menu> loadMenusByParentId(String id)
	{
		List<Menu> menus=menuDao.find("from Menu model where model.mparentid=? order by model.mseq",id);
		return menus;
	}
	
	/**
	 * 依据菜单列表转换菜单为json结构
	 * @param Map
	 * @return
	 */
	public String convert2Json(Map<String,Menu> myMenus)
	{
		StringBuffer buffer=new StringBuffer("[");
		for(Menu menu : myMenus.values())
		{
			buffer.append(each2Json(menu));
			buffer.append(",");
		}
		buffer.deleteCharAt(buffer.length()-1).append("]");
		return buffer.toString();
	}
	
	/**
	 * 解析为Json数据
	 * @param menu
	 * @return
	 */
	public String each2Json(Menu menu)
	{
		StringBuffer buffer=new StringBuffer("{");
		buffer.append("\"key\":\""+menu.getMid()+"\",");
		buffer.append("\"title\":\""+menu.getMname()+"\",");
		buffer.append("\"url\":\""+menu.getMaction()+"\",");
		buffer.append("\"children\":[");
		for(int i=0;i<menu.child.size();i++)
		{
			buffer.append(each2Json(menu.child.get(i)));
			if(i<menu.child.size()-1)buffer.append(",");
		}
		buffer.append("]");
		buffer.append("}");
		return buffer.toString();
	}
	
	
	//获取菜单的方法
	public List query(){
		List mList=new ArrayList();
		List <Menu> onemenu=menuDao.find("from Menu m where m.mlevel=? and m.mtype=0 order by model.mparentid,model.mseq","0");
		//List <Menu> twomenu=menuDao.find("from Menu m where m.mparentid=?","6");
		mList.add(onemenu);
		//mList.add(twomenu);
		return mList;
		
	}
	
	
	/**
	 * 保存或者更新实体
	 * @param menu
	 */
	public void saveOrUpdate(Menu menu) throws Exception
	{
		menuDao.saveOrUpdate(menu);
	}
	
	/**
	 * 保存菜单操作
	 * @param menu
	 * @throws Exception
	 */
	public void save(Menu menu) throws Exception
	{
		menuDao.save(menu);
	}
	
	/**
	 * 删除菜单操作
	 * 
	 * 先执行删除角色中的该菜单，然后删除菜单
	 * 
	 * @param menu
	 * @throws Exception
	 */
	public void delete(Menu menu) throws Exception
	{
		roleManager.delete(menu.getMid());
		//删除菜单的子菜单
		List<Menu> menusChild=loadMenuByParentId(menu.getMid());
		if(menusChild!=null&&menusChild.size()>0)
		{
			for(Menu cmenu : menusChild)
				delete(cmenu);
		}
		
		menuDao.delete(menu);
	}

	
	
	private ComparatorMenuList clst;
	/**
	 * 获取可用的List比较器
	 * @return
	 */
	public ComparatorMenuList getComparatorList()
	{
		if(clst==null)clst=new ComparatorMenuList();
		return clst;
	}
	
	//@modity Daniel 2014-08-01 1:对菜单进行排序处理
	public class ComparatorMenuList implements Comparator
	{
		@Override
		public int compare(Object o1, Object o2) {
			Menu menu1=(Menu)o1;
			Menu menu2=(Menu)o2;
			return Integer.valueOf(menu1.getMseq()).compareTo(Integer.valueOf(menu2.getMseq()));

		}
		
	}
	
}
