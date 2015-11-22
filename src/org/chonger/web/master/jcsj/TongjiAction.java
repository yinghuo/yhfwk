package org.chonger.web.master.jcsj;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.nqgl.NCTJXX;
import org.chonger.entity.system.User;
import org.chonger.service.jcsj.TongJiServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 统计管理的常用Action处理
 * @ClassName: TongjiAction
 * @Description: 统计信息Action
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
	@Result(name = "list.jsp", location = "/admin/pages/jcsj/tongji.jsp")
})
public class TongjiAction extends ActionSupport {
	
	@Autowired
	private TongJiServer server;
	
	public TongjiAction(){
		jsonResult = new JsonResultUtils();
	}
	
	/** 返回的json消息 */
	private JsonResultUtils jsonResult;

	public JsonResultUtils getJsonResult() {
		return jsonResult;
	}
	
	/** 统计信息 */
	private NCTJXX tjxx;
	public NCTJXX getTjxx() {return tjxx;}
	
	private NCTJXX stjxx;
	public NCTJXX getStjxx() {return stjxx;}
	

	@Override
	public String execute() throws Exception {
		
		//查询当前牧场的信息
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			tjxx=server.getTjxx(user.getNcjbxx().getXh());
			
			//依据统计信息查询相似的牛场统计
			//筛选检出率高于本牧场的牧场，并按照总头数从小到大排序
		}
		
		return "list.jsp";
	}
	
}
