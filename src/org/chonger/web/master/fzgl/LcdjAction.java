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
		@Result(name = "infos", type = "json", params = { "root",
				"jsonResult.infos" }),
		@Result(name = "infolist", type = "json", params = { "root",
				"jsonResult.objList" }),
		@Result(name = "lc-list.jsp", location = "/admin/pages/fzgl/lcdj-index.jsp"),
		@Result(name = "edit.jsp", location = "/admin/pages/fzgl/lcdj-add.jsp") })
public class LcdjAction extends ActionSupport {

	@Autowired
	private LcdjServer server;

	public LcdjAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;

	public JsonResultUtils getJsonResult() {
		return jsonResult;
	}

	/** 流产登记实体 */
	private LCXX lc;

	public LCXX getLc() {
		return lc;
	}

	public void setLc(LCXX lc) {
		this.lc = lc;
	}

	private List<LCXX> lclist;

	public List<LCXX> getLclist() {
		return lclist;
	}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<LCXX> pager;
	private int p;

	public void setP(int p) {
		this.p = p;
	}

	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(), pager.pageSize, p);
		lclist = pager.getDataSource();
		return "lc-list.jsp";
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
						lc.setNcbh(ncxx.getNcbh());
					}
				}
				server.saveOrUpdate(lc);

				jsonResult.sendSuccessMessage("新增流产信息成功！");
			} else {
				jsonResult.sendSuccessMessage("请重新登录！");
			}
		} catch (Exception ex) {
			jsonResult.sendErrorMessage("新增流产信息异常！");
		}
		return "infos";
	}

}
