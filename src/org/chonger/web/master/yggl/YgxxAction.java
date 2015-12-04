package org.chonger.web.master.yggl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbxx.YGJBXX;
import org.chonger.service.yggl.YgxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工管理的常用Action处理
 * @ClassName: YgxxAction
 * @Description: 员工管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/yggl/list.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/yggl/add.jsp")
})
public class YgxxAction extends ActionSupport {
	
	
	@Autowired
	private YgxxServer server;
	
	public YgxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<YGJBXX> pager;
	public RollPage<YGJBXX> getPager() {return pager;}
	private int p;
	public void setP(int p) {this.p = p;}
	
	private YGJBXX yg;
	public YGJBXX getYg() {	return yg;	}
	public void setYg(YGJBXX yg) {	this.yg = yg;	}
	
	private List<YGJBXX> yglist;
	public List<YGJBXX> getYglist() {	return yglist;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	/**搜索查询参数定义*/
	private String bh,xm;
	public String getBh() {	return bh;}
	public void setBh(String bh) {	this.bh = bh;}
	public String getXm() {	return xm;}
	public void setXm(String xm) {	this.xm = xm;}
	
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		if(!StringUtil.IsEmpty(xm))searchString+=("&xm="+xm);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh,xm),pager.pageSize,p);
		yglist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		try{
			server.saveOrUpdate(yg);			
			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(yg.getXh())?"新增":"更新"+"员工信息成功！");			
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(StringUtil.IsEmpty(yg.getXh())?"新增":"更新"+"员工信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			yg=server.getEntityById(id);
		}
		return "edit.jsp";
	}
	
	public String loadname()
	{
		yglist=server.findAllYGXX();
		if(yglist!=null&&yglist.size()>0)
		{
			jsonResult.objListInitOrClear();
			for(YGJBXX item : yglist)
			{
				HashMap<String,String> infoMap=new LinkedHashMap<String,String>();
				infoMap.put("id",item.getXh());
				infoMap.put("name",item.getYgmc());
				jsonResult.getObjList().add(infoMap);
			}
		}
		
		return "infolist";
	}
	
	/**加载默认登陆的用户信息*/
	public String loadDefaultUser()
	{
		Object id=null;
		if((id=ServletActionContext.getRequest().getSession().getAttribute(YgxxServer.YGXXID))!=null)
		{
			jsonResult.infosInitOrClear();
			jsonResult.getInfos().put(JsonResultUtils.ERROR, JsonResultUtils.OKVALUE);
			jsonResult.getInfos().put("id",id);
			jsonResult.getInfos().put("name",ServletActionContext.getRequest().getSession().getAttribute(YgxxServer.YGXXNAME));
			
		}
		else
		{
			jsonResult.sendErrorMessage("无效的默认用户！");
		}
		return "infos";
	}
	
}
