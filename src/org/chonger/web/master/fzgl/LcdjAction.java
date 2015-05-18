package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.LCXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.fzgl.LcdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 流产登记的常用Action处理
 * 
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
		@Result(name = "infos", type = "json", params = { "root","jsonResult.infos" }),
		@Result(name = "infolist", type = "json", params = { "root","jsonResult.objList" }),
		@Result(name = "lc-list.jsp", location = "/admin/pages/fzgl/lcdj-index.jsp"),
		@Result(name = "edit.jsp", location = "/admin/pages/fzgl/lcdj-add.jsp") 
})
public class LcdjAction extends ActionSupport {

	@Autowired
	private LcdjServer server;

	public LcdjAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {return jsonResult;}

	/** 流产登记实体 */
	private LCXX lc;
	public LCXX getLc() {return lc;	}
	public void setLc(LCXX lc) {this.lc = lc;}
	
	private List<LCXX> lclist;
	public List<LCXX> getLclist() {	return lclist;}
	
	/** 列表翻页组件 */
	@Autowired
	public RollPage<LCXX> pager;
	private int p;
	public void setP(int p) {this.p = p;}
	
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
		pager.init(server.getQueryString(bh,eb), pager.pageSize, p);
		lclist = pager.getDataSource();
		return "lc-list.jsp";
	}

	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(lc.getXh()) ? "新增"
					: "更新") + "流产信息成功！");
			
			server.saveOrUpdate(lc);
		} catch (Exception ex) {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(lc.getXh()) ? "新增"
					: "更新") + "流产信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			lc=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只流产信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}

}
