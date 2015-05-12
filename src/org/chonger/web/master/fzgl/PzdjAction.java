package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fzgl.PZDJXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.fzgl.PzdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 配种登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 配种登记管理Action
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
	@Result(name = "pz-list.jsp", location = "/admin/pages/fzgl/pzdj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/pzdj-add.jsp")
})
public class PzdjAction extends ActionSupport {
	
	@Autowired
	private PzdjServer server;
	
	public PzdjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**配种登记实体*/
	private PZDJXX pz;

	
	public PZDJXX getPz() {
		return pz;
	}

	public void setPz(PZDJXX pz) {
		this.pz = pz;
	}


	private List<PZDJXX> pzlist;

	
	public List<PZDJXX> getPzlist() {
		return pzlist;
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
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<PZDJXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(nzbh, ebbh), pager.pageSize, p);
		pzlist = pager.getDataSource();
		return "pz-list.jsp";
	}

	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			server.saveOrUpdate(pz);

			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(pz.getXh()) ? "新增"
					: "更新" + "配种信息成功！");
		} catch (Exception ex) {
			jsonResult.sendSuccessMessage(StringUtil.IsEmpty(pz.getXh()) ? "新增"
					: "更新" + "配种信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			pz=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只配种信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}

	
}
	
