package org.chonger.web.master.nzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
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
	@Result(name = "nz-list.jsp", location = "/admin/pages/nzgl/nz-index.jsp"),
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
	
	@Override
	public String execute() throws Exception {
		
		return "nz-list.jsp";
	}
	
	
	
}
	
