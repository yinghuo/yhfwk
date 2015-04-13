package org.chonger.web.master.jsgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.service.jsgl.JsglServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
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
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	private JSJBXX js;
	public JSJBXX getJs() {		return js;	}
	public void setJs(JSJBXX js) {		this.js = js;	}
	
	private List<JSJBXX> jslist;
	public List<JSJBXX> getJslist() {		return jslist;	}
	
	
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(),pager.pageSize,p);
		jslist=pager.getDataSource();
		return "list.jsp";
	}
	
	public String save() throws Exception{
		
		try{
			server.saveOrUpdate(js);
			
			jsonResult.sendSuccessMessage("新增圈舍信息成功！");
			
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("新增圈舍信息异常！");
		}
		
		return "infos";
	}
	
}
