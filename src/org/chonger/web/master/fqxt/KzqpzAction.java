package org.chonger.web.master.fqxt;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.system.Config;
import org.chonger.service.system.ConfigManager;
import org.chonger.utils.JsonResultUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @Title：控制器管理Action 1.0 
 * @Description：主要应用于控制器的配置信息加载
 * 
 * @fileName KzqpzAction
 * @create 2015-12-13
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "info.page", location = "/admin/pages/fqxt/kzqsxx-add.jsp")
})
public class KzqpzAction extends ActionSupport {
	
	private final String domain="_DM_KZQPZ_";
	private final String shangKey="SHANGXIAN";
	private final String xiaKey="XIAXIAN";
	
	public KzqpzAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	@Autowired
	private ConfigManager manager;
	
	private Config conf;
	public Config getConf() {return conf;}
	public void setConf(Config conf) {this.conf = conf;}
	
	private Config conf1;
	public Config getConf1() {return conf1;}
	public void setConf1(Config conf1) {this.conf1 = conf1;}
	
	
	
	@Override
	public String execute() throws Exception {
		//加载信息
		conf=manager.queryConfigByName(domain, shangKey);
		conf1=manager.queryConfigByName(domain,xiaKey);
		return "info.page";
	}
	
	/**
	 * 保存配置
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		
		jsonResult.infosInitOrClear();
		
		try
		{
			if(conf!=null)
			{
				//设置查询
				Config updateConfig=manager.queryConfigByName(domain, shangKey);
				if(updateConfig==null)
					updateConfig=new Config();
				
				updateConfig.setDomain(domain);
				updateConfig.setName(shangKey);
				updateConfig.setValue(conf.getValue());
				manager.saveOrUpdateConfig(updateConfig);
			}
			if(conf1!=null)
			{
				Config updateConfig=manager.queryConfigByName(domain, xiaKey);
				if(updateConfig==null)
					updateConfig=new Config();
				
				updateConfig.setDomain(domain);
				updateConfig.setName(xiaKey);
				updateConfig.setValue(conf1.getValue());
				manager.saveOrUpdateConfig(updateConfig);
			}
			jsonResult.sendSuccessMessage("更新设置成功！");			
		}catch(Exception ex){
			jsonResult.sendErrorMessage("更新失败："+ex.getMessage());
		}	
		
		return "infos";
	}
	
}
