package org.chonger.web.master.jsgl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.service.jsgl.JsglServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 圈舍管理的常用Action处理
 * @ClassName: JsglAction
 * @Description: 圈舍管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/jsgl/index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/jsgl/add.jsp")
})
public class JsglAction extends ActionSupport {
	
	@Autowired
	private JsglServer server;
	
	public JsglAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<JSJBXX> pager;
	public RollPage<JSJBXX> getPager() {return pager;}
	private int p;
	public void setP(int p) {this.p = p;}
	
	private JSJBXX js;
	public JSJBXX getJs() {		return js;	}
	public void setJs(JSJBXX js) {		this.js = js;	}
	
	private List<JSJBXX> jslist;
	public List<JSJBXX> getJslist() {		return jslist;	}
	
	/**参数列表*/
	private String ncbh;//牛场编号参数。
	public String getNcbh() {		return ncbh;	}
	public void setNcbh(String ncbh) {		this.ncbh = ncbh;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	/**搜索查询参数定义*/
	private String bh,mc;
	public String getBh() {	return bh;	}
	public void setBh(String bh) {	this.bh = bh;	}
	public String getMc() {	return mc;	}
	public void setMc(String mc) {	this.mc = mc;	}
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		if(!StringUtil.IsEmpty(mc))searchString+=("&mc="+mc);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		
		pager.init(server.getQueryString(bh,mc),pager.pageSize,p);
		jslist=pager.getDataSource();
		return "list.jsp";
	}
	
	public String save() throws Exception{		
		try{
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(js.getXh())?"新增":"更新")+"圈舍信息成功！");		
			server.saveOrUpdate(js);				
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(js.getXh())?"新增":"更新")+"圈舍信息异常！");
		}		
		return "infos";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除圈舍信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			js=server.getEntityById(id);
		}
		
		return "edit.jsp";
	}
	
	/**加载圈舍的选择信息，如果存在牛场编号，则加载该牛场编号的圈舍信息*/
	public String loadname() throws Exception{
		
		if(!StringUtil.IsEmpty(ncbh))
		{
			List<JSJBXX> jsjbxxList=server.findAllByNcbh(ncbh);
			
			if(jsjbxxList!=null&&jsjbxxList.size()>0)
			{
				jsonResult.objListInitOrClear();
				for(JSJBXX item : jsjbxxList)
				{
					HashMap<String,String> infoMap=new LinkedHashMap<String,String>();
					infoMap.put("name",item.getJsmc());
					infoMap.put("id",item.getXh());
					jsonResult.getObjList().add(infoMap);
				}
			}
		}
		
		return "infolist";
	}
	
}
