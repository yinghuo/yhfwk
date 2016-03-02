package org.chonger.web;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.service.task.NzlbTask;
import org.chonger.utils.JsonResultUtils;
import org.quartz.JobExecutionException;

import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"})
})
public class TestAction extends ActionSupport {
	
	public TestAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**
	 * 
	 * @return
	 */
	public String task(){
		jsonResult.infosInitOrClear();
		//执行任务
		NzlbTask lbtask=new NzlbTask();
		
		try {
			lbtask.test();
		} catch (JobExecutionException e) {
			jsonResult.sendSuccessMessage(e.getMessage());
		}
		
		return "infos";
	}
}
