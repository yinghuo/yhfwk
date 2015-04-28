package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.RSJCXX;
import org.chonger.service.fzgl.RjdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 妊娠检查登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 妊娠检查登记管理Action
 * @author Liuzq
 * @date 2015-4-16 
 * @version V1.0
 *
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "infolist", type = "json", params = { "root", "jsonResult.objList"}),
	@Result(name = "rj-list.jsp", location = "/admin/pages/fzgl/rjdj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/rjdj-add.jsp")
})
public class RjdjAction extends ActionSupport {
	
	@Autowired
	private RjdjServer server;
	
	public RjdjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**妊娠检查登记实体*/
	private RSJCXX rj;
	public RSJCXX getNz() {		return rj;	}
	public void setNz(RSJCXX nz) {		this.rj = nz;	}
	
	private List<RSJCXX> list;
	public List<RSJCXX> getCdlist() {		return list;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<RSJCXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		
		return "rj-list.jsp";
	}
	
	
	
}
	
