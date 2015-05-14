package org.chonger.web.master;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 主页管理的常用Action处理
 * @ClassName: IndexAction
 * @Description: 个体产奶Action
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
	@Result(name = "index.jsp", location = "/admin/pages/my.jsp")
})
public class IndexAction extends ActionSupport {

	@Override
	public String execute() throws Exception {
		
		
		
		return "index.jsp";
	}
	
}
