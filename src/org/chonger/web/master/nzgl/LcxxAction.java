package org.chonger.web.master.nzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLCXX;
import org.chonger.service.nzgl.LcxxServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "infolist", type = "json", params = { "root", "jsonResult.objList"}),
	@Result(name = "list.jsp", location = "/admin/pages/nzgl/lc-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/nzgl/lc-add.jsp")
})
public class LcxxAction extends ActionSupport {
	
	@Autowired
	private NzxxServer nzServer;
	@Autowired
	private LcxxServer lcServer;
	
	public LcxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**牛只基本信息实体，用于展示转舍牛只信息*/
	private NZJBXX nz;
	public NZJBXX getNz() {		return nz;	}
	public void setNz(NZJBXX nz) {		this.nz = nz;	}
	
	/**离场记录基本信息实体*/
	private NZLCXX lc;
	public NZLCXX getLc() {	return lc;	}
	public void setLc(NZLCXX lc) {	this.lc = lc;	}
	
	private List<NZLCXX> lclist;
	public List<NZLCXX> getLclist() {	return lclist;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NZLCXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	/**id参数，作为请求id使用*/
	private String id;	
	public void setId(String id) {		this.id = id;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(lcServer.getQueryString(),pager.pageSize,p);
		lclist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		try{
			lcServer.saveOrUpdate(lc);
			jsonResult.sendSuccessMessage("牛只离场登记成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("牛只离场登记异常！");
		}		
		return "infos";
	}
	
	/**跳转操作*/
	public String add() throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			nz=nzServer.queryNZById(id);
			
			//判断当前牛只是否符合离场的条件
			
		}
		return "edit.jsp";
	}
	
}