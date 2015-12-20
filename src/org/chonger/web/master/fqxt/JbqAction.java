package org.chonger.web.master.fqxt;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fqxt.JBQXX;
import org.chonger.entity.system.User;
import org.chonger.service.fqxt.JBQXXServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @Title：计步器器管理Action 1.0 
 * @Description：主要应用于计步器的信息管理
 * 
 * @fileName JbqAction
 * @create 2015-12-13
 * @author Daniel
 * @version 1.0 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "list.page", location = "/admin/pages/fqxt/jbq-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fqxt/jbq-add.jsp")
})
public class JbqAction extends ActionSupport {
	
	public JbqAction()
	{
		jsonResult=new JsonResultUtils();
	}
	
	@Autowired
	private JBQXXServer server;
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	private JBQXX jbq;
	public JBQXX getJbq() {return jbq;}
	public void setJbq(JBQXX jbq) {this.jbq = jbq;}

	private List<JBQXX> jbqlst;
	public List<JBQXX> getJbqlst() {return jbqlst;}
	
	private String id;
	public String getId() {return id;}
	public void setId(String id) {this.id = id;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<JBQXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(null,null),pager.pageSize,p);
		jbqlst=pager.getDataSource();
		return "list.page";
	}
	
	/**
	 * 新增保存
	 * @return
	 * @throws Exception
	 */
	public String save() throws Exception{
		jsonResult.infosInitOrClear();
		try
		{
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(jbq.getXh())?"新增":"更新")+"计步器信息成功！");	
			server.saveOrUpdate(jbq);
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(jbq.getXh())?"新增":"更新")+"计步器信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			jbq=server.queryJBQById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除计步器信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
}
