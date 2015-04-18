package org.chonger.web.master.nzgl;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.utils.JsonResultUtils;

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
	
	public ZsxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	@Override
	public String execute() throws Exception {
		
		return "list.jsp";
	}
	
}
