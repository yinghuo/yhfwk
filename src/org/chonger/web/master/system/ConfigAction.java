package org.chonger.web.master.system;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：配置管理Action 1.0 
 * @Description：主要应用于系统配置项管理
 * 
 * @fileName MenuAction
 * @create 2014-05-12
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "infos"})
})
public class ConfigAction extends ActionSupport {

	public String getConfig()
	{
		
		
		return null;
	}
	
}
