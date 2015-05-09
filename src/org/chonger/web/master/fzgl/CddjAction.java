package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.fzgl.CddjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

/**
 * 产犊登记的常用Action处理
 * 
 * @ClassName: CddjAction
 * @Description: 产犊登记管理Action
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
		@Result(name = "cd-list.jsp", location = "/admin/pages/fzgl/cddj-index.jsp"),
		@Result(name = "edit.jsp", location = "/admin/pages/fzgl/cddj-add.jsp") })
public class CddjAction extends ActionSupport {

	@Autowired
	private CddjServer server;

	public CddjAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;

	public JsonResultUtils getJsonResult() {
		return jsonResult;
	}

	/** 产犊登记实体 */
	private CDDJXX cd;

	public CDDJXX getCd() {
		return cd;
	}

	public void setCd(CDDJXX cd) {
		this.cd = cd;
	}

	private List<CDDJXX> cdlist;

	public List<CDDJXX> getCdlist() {
		return cdlist;
	}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<CDDJXX> pager;
	public RollPage<CDDJXX> getPager() {return pager;}
	private int p;
	public void setP(int p) {
		this.p = p;
	}

	/**参数列表*/
	private String ncbh;//牛场编号参数。
	public String getNcbh() {		return ncbh;	}
	public void setNcbh(String ncbh) {		this.ncbh = ncbh;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	/**搜索查询参数定义*/
	private String nzbh,ebbh;
	public String getNzbh() {	return nzbh;	}
	public void setNzbh(String bh) {	this.nzbh = bh;	}
	public String getEbbh() {	return ebbh;	}
	public void setEbbh(String ebbh) {	this.ebbh = ebbh;	}
	

	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(nzbh))searchString+=("&nzbh="+nzbh);
		if(!StringUtil.IsEmpty(ebbh))searchString+=("&ebbh="+ebbh);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(null,null), pager.pageSize, p);
		cdlist = pager.getDataSource();
		return "cd-list.jsp";
	}
	

	/** 保存数据操作 */
	public String save() throws Exception {

		try {
			// 增加当前用户的信息
			User user = SessionUtils.getUser();

			if (user != null) {
				// 企业用户关联我的牛场信息
				if (user.getRole().getRtype() == 2) {
					NCJBXX ncxx = user.getNcjbxx();

					if (ncxx != null) {
						cd.setNcbh(ncxx.getXh());
					}
				}
				server.saveOrUpdate(cd);

				jsonResult.sendSuccessMessage("新增产犊信息成功！");
			} else {
				jsonResult.sendSuccessMessage("请重新登录！");
			}
		} catch (Exception ex) {
			jsonResult.sendErrorMessage("新增产犊信息异常！");
		}
		return "infos";
	}
}
