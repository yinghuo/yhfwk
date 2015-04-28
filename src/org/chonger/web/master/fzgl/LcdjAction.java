package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.LCXX;
import org.chonger.service.fzgl.LcdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 流产登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 流产登记管理Action
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
	@Result(name = "lc-list.jsp", location = "/admin/pages/fzgl/lcdj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/lcdj-add.jsp")
})
public class LcdjAction extends ActionSupport {
	
	@Autowired
	private LcdjServer server;
	
	public LcdjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**流产登记实体*/
	private LCXX lc;
	public LCXX getNz() {		return lc;	}
	public void setNz(LCXX nz) {		this.lc = nz;	}
	
	private List<LCXX> lcList;
	public List<LCXX> getCdlist() {		return lcList;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<LCXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(),pager.pageSize,p);
		lcList=pager.getDataSource();
		return "lc-list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		
		try{
			server.saveOrUpdate(lc);
			
			jsonResult.sendSuccessMessage("新增流产信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("新增流产信息异常！");
		}		
		return "infos";
	}
	
}
	
