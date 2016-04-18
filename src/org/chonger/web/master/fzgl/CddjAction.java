package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantEnum.NZMRZT;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.fzgl.CddjServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
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
		@Result(name = "infos", type = "json", params = { "root","jsonResult.infos" }),
		@Result(name = "infolist", type = "json", params = { "root","jsonResult.objList" }),
		@Result(name = "cd-list.jsp", location = "/admin/pages/fzgl/cddj-index.jsp"),
		@Result(name = "edit.jsp", location = "/admin/pages/fzgl/cddj-add.jsp") 
})
public class CddjAction extends ActionSupport {

	@Autowired
	private CddjServer server;
	@Autowired
	private NzxxServer nzServer;
	
	public CddjAction() {
		jsonResult = new JsonResultUtils();
	}

	/** 返回的json消息 */
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {return jsonResult;}

	/** 产犊登记实体 */
	private CDDJXX cd;
	public CDDJXX getCd() {return cd;}
	public void setCd(CDDJXX cd) {this.cd = cd;}

	private List<CDDJXX> cdlist;
	public List<CDDJXX> getCdlist() {return cdlist;}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<CDDJXX> pager;
	public RollPage<CDDJXX> getPager() {return pager;}
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
		cdlist = pager.getDataSource();
		return "cd-list.jsp";
	}

	/** 保存数据操作 */
	public String save() throws Exception {

		try {
			
			//检查牛只是否可以进行产犊登记
			NZJBXX _nzxx=nzServer.queryNZById(cd.getNzbh());
//			if(_nzxx==null||_nzxx.getNzfzzt()==null||_nzxx.getNzfzzt().getZt()!=NZFZZT.围产前期.getValue())
			if(_nzxx==null||_nzxx.getNzmrzt()==null||_nzxx.getNzmrzt().getZt()!=NZMRZT.围产前期.getValue())
			{
				jsonResult.sendErrorMessage("该牛只当前未处于产犊状态，无法进行产犊登记！");
			}
			else
			{				
				jsonResult.sendSuccessMessage((StringUtil.IsEmpty(cd.getXh()) ? "新增" : "更新") + "产犊信息成功！");
				server.saveOrUpdate(cd);
			}
		} catch (Exception ex) {
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(cd.getXh()) ? "新增" : "更新") + "产犊信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			cd=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只产犊信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
}
