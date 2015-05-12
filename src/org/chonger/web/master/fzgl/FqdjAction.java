package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.fzgl.FqdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 发情登记的常用Action处理
 * 
 * @ClassName: FqdjAction
 * @Description: 发情登记管理Action
 * @author Liuzq
 * @date 2015-4-16
 * @version V1.0
 * 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default")
@Results({
		@Result(name = "error", location = "/error.jsp"),
		@Result(name = "infos", type = "json", params = { "root",
				"jsonResult.infos" }),
		@Result(name = "infolist", type = "json", params = { "root",
				"jsonResult.objList" }),
		@Result(name = "fq-list.jsp", location = "/admin/pages/fzgl/fqdj-index.jsp"),
		@Result(name = "edit.jsp", location = "/admin/pages/fzgl/fqdj-add.jsp") })
public class FqdjAction extends ActionSupport {

	@Autowired
	private FqdjServer server;

	public FqdjAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;

	public JsonResultUtils getJsonResult() {
		return jsonResult;
	}
	
	/** 发情登记实体 */
	private FQDJXX fq;

	public FQDJXX getFq() {
		return fq;
	}

	public void setFq(FQDJXX fq) {
		this.fq = fq;
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

	private List<FQDJXX> fqlist;

	public List<FQDJXX> getFqlist() {
		return fqlist;
	}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<FQDJXX> pager;
	private int p;

	public void setP(int p) {
		this.p = p;
	}

	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(nzbh, ebbh), pager.pageSize, p);
		fqlist = pager.getDataSource();
		return "fq-list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			server.saveOrUpdate(fq);

			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(fq.getXh()) ? "新增"
					: "更新" + "发情信息成功！");
		} catch (Exception ex) {
			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(fq.getXh()) ? "新增"
					: "更新" + "发情信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			fq=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只发情信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
}
