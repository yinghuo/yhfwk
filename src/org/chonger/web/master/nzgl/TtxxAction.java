package org.chonger.web.master.nzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZTTXX;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.service.nzgl.TtxxServer;
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
	@Result(name = "list.jsp", location = "/admin/pages/nzgl/tt-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/nzgl/tt-add.jsp")
})
public class TtxxAction extends ActionSupport {
	@Autowired
	private NzxxServer nzServer;
	@Autowired
	private TtxxServer ttServer;
	
	public TtxxAction(){
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
	private NZTTXX tt;
	public NZTTXX getTt() {	return tt;	}
	public void setTt(NZTTXX tt) {	this.tt = tt;	}
	
	private List<NZTTXX> ttlist;
	public List<NZTTXX> getTtlist() {	return ttlist;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NZTTXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	/**id参数，作为请求id使用*/
	private String id;	
	public void setId(String id) {		this.id = id;	}
	
	/**搜索查询参数定义*/
	private String bh;
	public String getBh() {	return bh;	}
	public void setBh(String bh) {	this.bh = bh;	}
	
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(ttServer.getQueryString(bh),pager.pageSize,p);
		ttlist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		try{
			ttServer.saveOrUpdate(tt);
			jsonResult.sendSuccessMessage("牛只淘汰信息登记成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("牛只淘汰信息登记异常！");
		}		
		return "infos";
	}
	
	/**跳转操作*/
	public String add() throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			nz=nzServer.queryNZById(id);
			
			//判断当前牛只是否符合淘汰的条件
			
		}
		return "edit.jsp";
	}
	
	
}
