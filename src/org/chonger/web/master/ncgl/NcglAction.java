package org.chonger.web.master.ncgl;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.utils.JsonResultUtils;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛场管理的常用Action处理
 * @ClassName: NcglAction
 * @Description: 牛场管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/ncgl/index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/ncgl/add.jsp")
})
public class NcglAction extends ActionSupport {
	
	public NcglAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	@Override
	public String execute() throws Exception {
		System.out.println("action访问");
		return "list.jsp";
	}
	
}
