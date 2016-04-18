package org.chonger.web.m;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantKey;
import org.chonger.entity.fqxt.FQTSXX;
import org.chonger.entity.fqxt.JBQXX;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.system.User;
import org.chonger.service.fqxt.FQTSXXServer;
import org.chonger.service.fqxt.JBQXXServer;
import org.chonger.service.fzgl.FqdjServer;
import org.chonger.service.fzgl.PzdjServer;
import org.chonger.service.system.UserManager;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.JsonResultUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import info.yinghuo.utils.StringUtils;
/**
 * 监控系统使用的Action
 * @ClassName: MAction
 * @Description: 移动端Action
 * @author Daniel
 * @date Apr 10, 2015 10:39:15 PM
 * @version V1.0
 *
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "infolist", type = "json", params = { "root", "jsonResult.objList"}),
	@Result(name = "index.jsp", location = "/admin/pages/m/index.jsp")
})
public class MAction  extends ActionSupport {
	
	public MAction()
	{
		jsonResult=new JsonResultUtils();
	}
	
	@Autowired
	private JBQXXServer server;
	
	@Autowired
	private PzdjServer pzServer;
	
	@Autowired
	private FQTSXXServer tsServer;
	
	@Autowired
	private FqdjServer fqServer;
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	public String access() throws IOException{
		
		//获取当前登录的用户信息，然后根据用户的角色加载用户菜单
		Object Userobj=ServletActionContext.getRequest().getSession().getAttribute(UserManager.USERSESSIONKEY);
		System.out.println("移动端登录成功："+Userobj);
		User user=null;
		if(Userobj!=null)
		{
			try {
				user=(User)Userobj;				
				ServletActionContext.getRequest().getSession().setAttribute("urole",user.getRole().getRname());
				ServletActionContext.getRequest().getSession().setAttribute(ConstantKey.SESSION_USER_NCXX_OBJECT,user.getNcjbxx());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else//未登录
		{
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/mlogin.jsp");
		}
		
		return "index.jsp";
	}
	
	/**
	 * 获取用户的计步器设备信息
	 * @return
	 * @throws IOException
	 */
	public String device() throws IOException{
		//获取当前登录的用户信息，然后根据用户的角色加载用户菜单
		Object Userobj=ServletActionContext.getRequest().getSession().getAttribute(UserManager.USERSESSIONKEY);
		User user=null;
		jsonResult.infosInitOrClear();
		if(Userobj!=null)
		{
			try {
				List<Map<String,String>> returnValues=new LinkedList<Map<String,String>>();
				//加载当前用户的所有计步器信息
				List<JBQXX> jbqList = server.findAll();
				
				if(jbqList!=null&&jbqList.size()>0){
					for(JBQXX jbqxx : jbqList){
						Map<String,String> item = new HashMap<String,String>();
						
						item.put("id",jbqxx.getXh());
						item.put("num", jbqxx.getJbqbh());
						item.put("nz", jbqxx.getNzjbxx().getNzbh());
						item.put("js", jbqxx.getNzjbxx().getJsjbxx().getJsmc());
						
						item.put("zt", "监控中");
						//牛只状态，获取繁殖状态信息
						NZFZZTXX fzzt = jbqxx.getNzjbxx().getNzfzzt();
						System.out.println("fzzt="+fzzt);
						if(fzzt!=null && fzzt.getZt()==0){
							item.put("zt", "发情未配");
							if(fzzt.getBj()==0){
								item.put("zt", "发情未配");
							}else if(fzzt.getBj()==2){
								item.put("zt", "已配种");
							}
						}
						
						returnValues.add(item);
					}
				}
				
				jsonResult.getInfos().put("error", 0);
				jsonResult.getInfos().put("data", returnValues);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else//未登录
		{
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/mlogin.jsp");
		}
		return "infos";
	}
	
	/**
	 * 获取用户的牧场提示信息
	 * @return
	 * @throws IOException
	 */
	public String info() throws IOException{
		//获取当前登录的用户信息，然后根据用户的角色加载用户菜单
		Object Userobj=ServletActionContext.getRequest().getSession().getAttribute(UserManager.USERSESSIONKEY);
		User user=null;
		jsonResult.infosInitOrClear();
		if(Userobj!=null)
		{
			try {
				List<Map<String,String>> returnValues=new LinkedList<Map<String,String>>();
				//加载发情提示信息
				List<FQTSXX> tsList = tsServer.findAll();
				if(tsList!=null && tsList.size()>0){
					for(FQTSXX tsxx : tsList){
						Map<String,String> item = new HashMap<String,String>();
						
						item.put("id",tsxx.getXh());
						item.put("nz", tsxx.getNzjbxx().getNzbh());
						item.put("js", tsxx.getNzjbxx().getJsjbxx().getJsmc());
						item.put("tc", tsxx.getNzjbxx().getTc()+"");
						item.put("sj", tsServer.parseStringByMsg(tsxx.getTsms()));
						
						item.put("zt", tsxx.getSffq()+"");
						
						item.put("pz", "---- ---- <br /> ---- ----");
						
						//提示时间
						if(!StringUtils.isEmptyOrNull(tsxx.getFqid())){
							FQDJXX fqxx=fqServer.getFqxxById(tsxx.getFqid());
							if(fqxx!=null){
								item.put("pz", DateTimeUtil.formatDateToString(fqxx.getPzsj())+"<br />"+DateTimeUtil.formatDateToString(fqxx.getPzsj1()));
							}
						}
						
//						if(==0){
//							疑似发情
//						}else if(tsxx.getSffq()==1){
//							item.put("zt", "已发情");
//						}else if(tsxx.getSffq()==2){
//							item.put("zt", "未发情");
//						}
						
						returnValues.add(item);
					}
				}
				
				jsonResult.getInfos().put("error", 0);
				jsonResult.getInfos().put("data", returnValues);
				
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		else//未登录
		{
			ServletActionContext.getResponse().sendRedirect(ServletActionContext.getRequest().getContextPath()+"/mlogin.jsp");
		}
		return "infos";
	}

}
