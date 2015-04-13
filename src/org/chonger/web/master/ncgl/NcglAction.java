package org.chonger.web.master.ncgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.service.ncgl.NcglServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛场管理的常用Action处理
 * @ClassName: NcglAction
 * @Description: 牛场管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/ncgl/index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/ncgl/add.jsp")
})
public class NcglAction extends ActionSupport {
	
	public NcglAction(){
		jsonResult=new JsonResultUtils();
	}
	
	@Autowired
	private NcglServer server;
	
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**农场基本信息实体*/
	private NCJBXX nc;
	public NCJBXX getNc() {		return nc;	}
	public void setNc(NCJBXX nc) {		this.nc = nc;	}
	
	private List<NCJBXX> nclist;
	public List<NCJBXX> getNclist() {		return nclist;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NCJBXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(),pager.pageSize,p);
		nclist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		
		try{
			server.saveOrUpdate(nc);
			
			jsonResult.sendSuccessMessage("新增牛场信息成功！");
			
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("新增牛场信息异常！");
		}
		
		return "infos";
	}
	
	
}
