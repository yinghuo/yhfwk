package org.chonger.web.master.nzgl;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛只转舍信息的常用Action处理
 * @ClassName: ZsxxAction
 * @Description: 牛只转舍信息管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/nzgl/zs-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/nzgl/zs-add.jsp")
})
public class ZsxxAction extends ActionSupport {
	
	@Autowired
	private NzxxServer nzServer;
	
	public ZsxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**牛只基本信息实体，用于展示转舍牛只信息*/
	private NZJBXX nz;
	public NZJBXX getNz() {		return nz;	}
	public void setNz(NZJBXX nz) {		this.nz = nz;	}
	
	/**id参数，作为请求id使用*/
	private String id;	
	public void setId(String id) {		this.id = id;	}
	
	@Override
	public String execute() throws Exception {
		
		return "list.jsp";
	}
	
	/**添加牛只转舍记录*/
	public String add(){
		if(!StringUtil.IsEmpty(id))
		{
			nz=nzServer.queryNZById(id);
		}
		return "edit.jsp";
	}
	
}
