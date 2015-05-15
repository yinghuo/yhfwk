package org.chonger.web.master.jbfy;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 免疫登记管理的常用Action处理
 * @ClassName: MyxxAction
 * @Description: 免疫信息Action
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
	@Result(name = "list.jsp", location = "/admin/pages/jbfy/my-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/jbfy/my-add.jsp")
})
public class MyxxAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		
		return "list.jsp";
	}
}
