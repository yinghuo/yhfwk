package org.chonger.web.master.ncgl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantKey;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.ncgl.NcglServer;
import org.chonger.service.system.UserManager;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SHAUtils;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛场管理的常用Action处理
 * @ClassName: NcglAction
 * @Description: 牛场管理Action
 * @author Daniel
 * @date Apr 10, 2015 10:39:15 PM
 * @version V1.0
 * 
 * @modify 2015-04-28	Daniel	1:修改Save函数，新增企业信息保存
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "infolist", type = "json", params = { "root", "jsonResult.objList"}),
	@Result(name = "list.jsp", location = "/admin/pages/ncgl/index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/ncgl/add.jsp")
})
public class NcglAction extends ActionSupport {
	
	public NcglAction(){
		jsonResult=new JsonResultUtils();
	}
	
	@Autowired
	private NcglServer server;
	@Autowired
	private UserManager userManager;
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**农场基本信息实体*/
	private NCJBXX nc;
	public NCJBXX getNc() {		return nc;	}
	public void setNc(NCJBXX nc) {		this.nc = nc;	}
	
	/**牛场管理员用户信息*/
	private User u;
	public User getU() {	return u;	}
	public void setU(User u) {	this.u = u;	}
	
	private List<NCJBXX> nclist;
	public List<NCJBXX> getNclist() {		return nclist;	}
	
	private boolean edit;
	public boolean getEdit() {return edit;}
	public void setEdit(boolean edit) {	this.edit = edit;}
	
	private String id;
	public String getId() {return id;}
	public void setId(String id) {this.id = id;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NCJBXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(),pager.pageSize,p);
		nclist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		
		try{			
			//当前用户
			User user=SessionUtils.getUser();			
			if(user!=null)
			{
				//企业用户角色
				if(user.getRole().getRtype()==2)
				{
					NCJBXX _ncjbxx=user.getNcjbxx();
					if(_ncjbxx!=null)
					{
						nc.setNcbh(_ncjbxx.getNcbh());
						nc.setXh(_ncjbxx.getXh());
						nc.setKssysj(_ncjbxx.getKssysj());
						nc.setTzsysj(_ncjbxx.getTzsysj());
					}
					nc.setYhid(user.getUid());
					
					
				}
				else if(user.getRole().getRtype()==1)//管理员调用牛场保存的函数
				{
					//modify 新增管理员修改操作
					if(nc!=null&&!StringUtil.IsEmpty(nc.getXh()))
					{
						//修改操作，加载牛只信息、用户信息
						NCJBXX _ncjbxx=server.findNcxxById(nc.getXh());
						if(_ncjbxx!=null)
						{
							User _user=userManager.findUserById(_ncjbxx.getYhid());
							if(_user!=null)
							{
								//更新牛场信息
								nc.setNcbh(_ncjbxx.getNcbh());
								nc.setYhid(_ncjbxx.getYhid());
								nc.setNcxz(_ncjbxx.getNcxz());
								nc.setPzy(_ncjbxx.getPzy());
								nc.setPzhdg(_ncjbxx.getPzhdg());
								nc.setFqxtsybz(_ncjbxx.getFqxtsybz());
								nc.setLxyx(_ncjbxx.getLxyx());
								nc.setKddz(_ncjbxx.getKddz());
								nc.setBz(_ncjbxx.getBz());
								
								//更新用户信息
								_user.setUloginname(u.getUloginname());
								_user.getUserInfo().setPhonenum(u.getUserInfo().getPhonenum());
								_user.getUserInfo().setEmail(u.getUserInfo().getEmail());
								if(!StringUtil.IsEmpty(u.getUpassword()))//用户密码更新
								{
									_user.setUpassword(SHAUtils.CreateSHAKey(u.getUpassword()));
								}
							}
							else
							{
								jsonResult.sendErrorMessage("非法的牛场信息更新操作！");
								return "infos";
							}
						}
						else
						{
							jsonResult.sendErrorMessage("非法的牛场信息更新操作！");
							return "infos";
						}
					}
					else
					{
						if(u!=null)//用户信息不为空，提交的是授权信息
						{
							//进行信息检测
							if(!server.checkNCBHExist(nc.getNcbh()))
							{
								//检测登陆名是否存在
								if(!userManager.checkLoginNameExist(u.getUloginname()))
								{
									server.authorize(nc,u);
									jsonResult.sendSuccessMessage("新的牛场授权开通成功！");
									return "infos";
								}
								else
								{
									jsonResult.sendErrorMessage("管理员登录名已经存在，请重新分配登录名！");
									return "infos";
								}
							}
							else
							{
								jsonResult.sendErrorMessage("牛场编号已经存在，请确实是否重复授权！");
								return "infos";
							}
						}
					}
				}
				
				server.saveOrUpdate(nc);
				jsonResult.sendSuccessMessage("更新牛场信息成功！");
				
				//更新用户缓存
				if(user.getRole().getRtype()==2)
				{
					user.setNcjbxx(nc);
					SessionUtils.setSession(ConstantKey.SESSION_USER_NCXX_OBJECT, nc);
				}				
			}
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("操作异常，请举报问题给平台管理员！");
		}
		
		return "infos";
	}
	
	/**编辑数据*/
	public String edit() throws Exception{
		
		//根据ID加载牧场信息
		if(!StringUtil.IsEmpty(id))
		{
			nc=server.findNcxxById(id);
			u=userManager.findUserById(nc.getYhid());
			edit=true;
		}
		return "edit.jsp";
	}
	
	
	
	
//	public String loadname() throws Exception{
//		
//		List<NCJBXX> ncjbxxList=server.findAll();
//		
//		if(ncjbxxList!=null&&ncjbxxList.size()>0)
//		{
//			jsonResult.objListInitOrClear();
//			for(NCJBXX item : ncjbxxList)
//			{
//				HashMap<String,String> infoMap=new LinkedHashMap<String,String>();
//				infoMap.put("name",item.getNcmc());
//				infoMap.put("id",item.getNcbh());
//				jsonResult.getObjList().add(infoMap);
//			}
//		}
//		
//		return "infolist";
//	}
}
