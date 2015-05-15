package org.chonger.web.master.jbfy;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 疾病登记管理的常用Action处理
 * @ClassName: JbxxAction
 * @Description: 疾病登记信息Action
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
	@Result(name = "list.jsp", location = "/admin/pages/jbfy/jb-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/jbfy/jb-add.jsp")
})
public class JbxxAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		
		return "list.jsp";
	}
}
