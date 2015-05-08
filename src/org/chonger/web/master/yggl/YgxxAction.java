package org.chonger.web.master.yggl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbxx.YGJBXX;
import org.chonger.service.yggl.YgxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 员工管理的常用Action处理
 * @ClassName: YgxxAction
 * @Description: 员工管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/yggl/list.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/yggl/add.jsp")
})
public class YgxxAction extends ActionSupport {
	
	
	@Autowired
	private YgxxServer server;
	
	public YgxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<YGJBXX> pager;
	public RollPage<YGJBXX> getPager() {return pager;}
	private int p;
	public void setP(int p) {this.p = p;}
	
	private YGJBXX yg;
	public YGJBXX getYg() {	return yg;	}
	public void setYg(YGJBXX yg) {	this.yg = yg;	}
	
	private List<YGJBXX> yglist;
	public List<YGJBXX> getYglist() {	return yglist;	}
	
	
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(null,null),pager.pageSize,p);
		yglist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		try{
			server.saveOrUpdate(yg);			
			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(yg.getXh())?"新增":"更新"+"员工信息成功！");			
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(StringUtil.IsEmpty(yg.getXh())?"新增":"更新"+"员工信息异常！");
		}
		return "infos";
	}
	
}