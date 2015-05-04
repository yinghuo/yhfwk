package org.chonger.web.master.nzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛只信息的常用Action处理
 * @ClassName: NzxxAction
 * @Description: 牛只信息管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/nzgl/nz-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/nzgl/nz-add.jsp")
})
public class NzxxAction extends ActionSupport {
	
	@Autowired
	private NzxxServer server;
	
	public NzxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**牛只基本信息实体*/
	private NZJBXX nz;
	public NZJBXX getNz() {		return nz;	}
	public void setNz(NZJBXX nz) {		this.nz = nz;	}
	
	private List<NZJBXX> nzlist;
	public List<NZJBXX> getNzlist() {		return nzlist;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NZJBXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	/**搜索查询参数定义*/
	private String bh,jbq,eb;
	public String getBh() {	return bh;	}
	public void setBh(String bh) {this.bh = bh;}
	public String getJbq() {	return jbq;	}
	public void setJbq(String jbq) {this.jbq = jbq;}
	public String getEb() {	return eb;	}
	public void setEb(String eb) {this.eb = eb;}
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		if(!StringUtil.IsEmpty(jbq))searchString+=("&jbq="+jbq);
		if(!StringUtil.IsEmpty(eb))searchString+=("&eb="+eb);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh,jbq,eb),pager.pageSize,p);
		nzlist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		try{
			server.saveOrUpdate(nz);
			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(nz.getXh())?"新增":"更新"+"牛只信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(StringUtil.IsEmpty(nz.getXh())?"新增":"更新"+"牛只信息异常！");
		}		
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			nz=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
}
	
