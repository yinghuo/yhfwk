package org.chonger.web.master.jbfy;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbfy.JBXX;
import org.chonger.service.jbfy.JbglServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 疾病登记管理的常用Action处理
 * @ClassName: JbxxAction
 * @Description: 疾病登记信息Action
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
	@Result(name = "list.jsp", location = "/admin/pages/jbfy/jb-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/jbfy/jb-add.jsp")
})
public class JbxxAction extends ActionSupport {

	@Autowired
	private JbglServer server;

	public JbxxAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {return jsonResult;}
	
	/** 发情登记实体 */
	private JBXX jb;
	public JBXX getJb() {return jb;	}
	public void setJb(JBXX jb) {this.jb = jb;}
	
	private List<JBXX> jblist;
	public List<JBXX> getJblist() {return jblist;}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<JBXX> pager;
	private int p;
	public void setP(int p) {this.p = p;}
	
	private String id;
	public void setId(String id) {this.id = id;}
	
	/** 搜索查询参数定义 */
	private String bh, eb;
	public String getBh() {	return bh;}
	public void setBh(String bh) {this.bh = bh;}
	public String getEb() {return eb;}
	public void setEb(String eb) {this.eb = eb;}
	
	/** 搜索参数获取，方便翻页使用 */
	public String getSearchString() {
		String searchString = "";
		if (!StringUtil.IsEmpty(bh))searchString += ("&bh=" + bh);
		if (!StringUtil.IsEmpty(eb))searchString += ("&eb=" + eb);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh, eb), pager.pageSize, p);
		jblist = pager.getDataSource();
		return "list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(jb.getXh()) ? "新增"
					: "更新") + "疾病登记信息成功！");
			
			server.saveOrUpdate(jb);
		} catch (Exception ex) {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(jb.getXh()) ? "新增"
					: "更新") + "疾病登记信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			jb=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只疾病登记信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
}
