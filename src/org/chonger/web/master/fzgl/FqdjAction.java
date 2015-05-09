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
		pager.init(server.getQueryString(), pager.pageSize, p);
		fqlist = pager.getDataSource();
		return "fq-list.jsp";
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
						fq.setNcbh(ncxx.getXh());
					}
				}
				server.saveOrUpdate(fq);

				jsonResult.sendSuccessMessage("新增发情信息成功！");
			} else {
				jsonResult.sendSuccessMessage("请重新登录！");
			}

		} catch (Exception ex) {
			jsonResult.sendErrorMessage("新增发情信息异常！");
		}
		return "infos";
	}
}
