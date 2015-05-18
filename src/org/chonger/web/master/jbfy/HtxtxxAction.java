package org.chonger.web.master.jbfy;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.jbfy.HTXTXX;
import org.chonger.service.jbfy.HtxtglServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 护蹄修蹄登记管理的常用Action处理
 * @ClassName: HtxtxxAction
 * @Description: 护蹄修蹄登记信息Action
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
	@Result(name = "list.jsp", location = "/admin/pages/jbfy/htxt-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/jbfy/htxt-add.jsp")
})
public class HtxtxxAction extends ActionSupport {

	@Autowired
	private HtxtglServer server;

	public HtxtxxAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;

	public JsonResultUtils getJsonResult() {
		return jsonResult;
	}
	
	/** 发情登记实体 */
	private HTXTXX ht;

	public HTXTXX getHt() {
		return ht;
	}

	public void setHt(HTXTXX ht) {
		this.ht = ht;
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

	private List<HTXTXX> htlist;

	public List<HTXTXX> getHtlist() {
		return htlist;
	}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<HTXTXX> pager;
	private int p;

	public void setP(int p) {
		this.p = p;
	}

	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(nzbh, ebbh), pager.pageSize, p);
		htlist = pager.getDataSource();
		return "list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(ht.getXh()) ? "新增"
					: "更新") + "护蹄修蹄信息成功！");
			
			server.saveOrUpdate(ht);
		} catch (Exception ex) {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(ht.getXh()) ? "新增"
					: "更新") + "护蹄修蹄信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			ht=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只护蹄修蹄信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
}
