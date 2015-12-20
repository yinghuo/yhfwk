package org.chonger.web.master.fqxt;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：控制器管理Action 1.0 
 * @Description：主要应用于控制器的信息管理
 * 
 * @fileName kzqAction
 * @create 2015-12-13
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "list.page", location = "/admin/pages/fqxt/kzq-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fqxt/kzq-add.jsp")
})
public class kzqAction extends ActionSupport {

}
