package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.RJCJXX;
import org.chonger.service.fzgl.RjcjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 妊娠初检登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 妊娠初检登记管理Action
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
	@Result(name = "rj-list.jsp", location = "/admin/pages/fzgl/rjcj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/rjcj-add.jsp")
})
public class RjcjAction extends ActionSupport {
	
	@Autowired
	private RjcjServer server;
	
	public RjcjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**妊娠检查登记实体*/
	private RJCJXX rj;	
	public RJCJXX getRj() {return rj;}
	public void setRj(RJCJXX rj) {this.rj = rj;}
	
	private List<RJCJXX> rjlist;
	public List<RJCJXX> getRjlist() {return rjlist;}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<RJCJXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	private String id;
	public void setId(String id) {this.id = id;}
	
	/** 搜索查询参数定义 */
	private String bh, eb;	
	public String getBh() {return bh;}
	public void setBh(String bh) {this.bh = bh;}
	public String getEb() {return eb;}
	public void setEb(String eb) {this.eb = eb;}
	
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		if(!StringUtil.IsEmpty(eb))searchString+=("&eb="+eb);
		return searchString;
	}
	
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh, eb), pager.pageSize, p);
		rjlist = pager.getDataSource();
		return "rj-list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(rj.getXh()) ? "新增"
					: "更新") + "妊娠初检信息成功！");
			
			server.saveOrUpdate(rj);
		} catch (Exception ex) {
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(rj.getXh()) ? "新增"
					: "更新") + "妊娠初检信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			rj=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只妊检初检信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
	
}
	
