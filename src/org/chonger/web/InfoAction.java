package org.chonger.web;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.system.Config;
import org.chonger.service.system.ConfigManager;
import org.chonger.utils.JsonResultUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：其他综合信息管理Action 1.0 
 * @Description：主要应用于在未登录系统前的综合信息管理
 * 
 * @fileName InfoAction
 * @create 2015-12-13
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"})
})
public class InfoAction extends ActionSupport {
	
	public InfoAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	@Autowired
	private ConfigManager manager;
	
	private final String domain="_DM_SYSTEM_";
	private final String ncCountKey="NC_COUNT";//牛场总数量
	/**
	 * 获取系统中的牛场编号
	 */
	public String count()
	{
		//读取配置
		Config countConfig=manager.querySystemConfigByName(domain, ncCountKey);
		jsonResult.infosInitOrClear();
		if(countConfig!=null)
		{
			jsonResult.getInfos().put("count",countConfig.getValue());
		}
		else
		{
			jsonResult.getInfos().put("count","0");
		}
		return "infos";
	}
	
}
