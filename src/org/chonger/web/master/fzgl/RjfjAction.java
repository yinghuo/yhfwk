package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.RJFJXX;
import org.chonger.service.fzgl.RjfjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 妊娠复检登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 妊娠复检登记管理Action
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
	@Result(name = "fj-list.jsp", location = "/admin/pages/fzgl/rjfj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/rjfj-add.jsp")
})
public class RjfjAction extends ActionSupport {
	
	@Autowired
	private RjfjServer server;
	
	public RjfjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**妊娠检查登记实体*/
	private RJFJXX fj;

	
	public RJFJXX getFj() {
		return fj;
	}

	public void setFj(RJFJXX fj) {
		this.fj = fj;
	}

	/** 参数列表 */
	private String ncbh;// 牛场编号参数。

	public String getNcbh() {
		return ncbh;
	}

	public void setNcbh(String ncbh) {
		this.ncbh = ncbh;
	}

	private String id;

	public void setId(String id) {
		this.id = id;
	}
	
	/** 搜索查询参数定义 */
	private String nzbh, ebbh;

	public String getNzbh() {
		return nzbh;
	}

	public void setNzbh(String bh) {
		this.nzbh = bh;
	}

	public String getEbbh() {
		return ebbh;
	}

	public void setEbbh(String ebbh) {
		this.ebbh = ebbh;
	}
	
	private List<RJFJXX> fjlist;

	public List<RJFJXX> getFjlist() {
		return fjlist;
	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<RJFJXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(nzbh, ebbh), pager.pageSize, p);
		fjlist = pager.getDataSource();
		return "fj-list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(fj.getXh()) ? "新增"
					: "更新") + "妊娠复检信息成功！");
			
			server.saveOrUpdate(fj);
		} catch (Exception ex) {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(fj.getXh()) ? "新增"
					: "更新") + "妊娠复检信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			fj=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只妊娠复检信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
	
}
	
