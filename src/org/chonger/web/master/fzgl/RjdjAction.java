package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.RSJCXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.fzgl.RjdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 妊娠检查登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 妊娠检查登记管理Action
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
	@Result(name = "rj-list.jsp", location = "/admin/pages/fzgl/rjdj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/rjdj-add.jsp")
})
public class RjdjAction extends ActionSupport {
	
	@Autowired
	private RjdjServer server;
	
	public RjdjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**妊娠检查登记实体*/
	private RSJCXX rj;

	
	public RSJCXX getRj() {
		return rj;
	}

	public void setRj(RSJCXX rj) {
		this.rj = rj;
	}

	private List<RSJCXX> rjlist;

	public List<RSJCXX> getRjlist() {
		return rjlist;
	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<RSJCXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(), pager.pageSize, p);
		rjlist = pager.getDataSource();
		return "rj-list.jsp";
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
						rj.setNcbh(ncxx.getXh());
					}
				}
				server.saveOrUpdate(rj);

				jsonResult.sendSuccessMessage("新增妊娠检查信息成功！");
			} else {
				jsonResult.sendSuccessMessage("请重新登录！");
			}
		} catch (Exception ex) {
			jsonResult.sendErrorMessage("新增妊娠检查信息异常！");
		}
		return "infos";
	}
	
}
	
