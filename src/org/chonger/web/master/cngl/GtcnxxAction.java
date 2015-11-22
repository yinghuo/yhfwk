package org.chonger.web.master.cngl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.cngl.GTCNXX;
import org.chonger.service.cngl.GtcnServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 个体产奶管理的常用Action处理
 * @ClassName: GtcnxxAction
 * @Description: 个体产奶Action
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
	@Result(name = "list.jsp", location = "/admin/pages/cngl/index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/cngl/add.jsp")
})
public class GtcnxxAction extends ActionSupport {
	
	public GtcnxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	@Autowired
	private GtcnServer server;
	@Autowired
	private NzxxServer nzServer;
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<GTCNXX> pager;
	public RollPage<GTCNXX> getPager() {return pager;}
	private int p;
	public void setP(int p) {this.p = p;}
	
	private GTCNXX cn;
	public GTCNXX getCn() {	return cn;}
	public void setCn(GTCNXX cn) {	this.cn = cn;}
	
	private List<GTCNXX> cnlist;	
	public List<GTCNXX> getCnlist() {	return cnlist;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	private String bh;
	public String getBh() {	return bh;	}
	public void setBh(String bh) {	this.bh = bh;	}
	
	/** 搜索参数获取，方便翻页使用 */
	public String getSearchString() {
		String searchString = "";
		if (!StringUtil.IsEmpty(bh))searchString += ("&bh=" + bh);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh)+" order by model.jnrq desc",pager.pageSize,p);
		cnlist=pager.getDataSource();
		return "list.jsp";
	}

	public String save() throws Exception{		
		try{
			
			//根据日期查找牛只产奶信息
			if(cn.getJnrq()!=null)
			{
				GTCNXX cnxx=server.getGTCNXXByDate(cn.getJnrq(),1,cn.getNzbh());
				
				if(cnxx!=null)
				{
					//覆盖现有的产奶掺量数据
					cn.setXh(cnxx.getXh());
				}
				
				jsonResult.sendSuccessMessage((StringUtil.IsEmpty(cn.getXh())?"新增":"更新")+"个体产奶信息成功！");
				server.saveOrUpdate(cn);
			}
			else
				jsonResult.sendErrorMessage((StringUtil.IsEmpty(cn.getXh())?"新增":"更新")+"个体产奶信息异常！");
			
			//根据牛只信息获取牛只编号
			//NZJBXX nzxx=nzServer.queryNZByBH(cn.getNzbh());
			
			//if(nzxx!=null)
			//{	
//				jsonResult.sendSuccessMessage((StringUtil.IsEmpty(cn.getXh())?"新增":"更新")+"个体产奶信息成功！");
				//cn.setNzbh(nzxx.getXh());
//				server.saveOrUpdate(cn);				
			//}else{
			//	jsonResult.sendErrorMessage((StringUtil.IsEmpty(cn.getXh())?"新增":"更新")+"个体产奶信息错误，无效的牛只信息！");
			//}
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(cn.getXh())?"新增":"更新")+"个体产奶信息异常！");
		}		
		return "infos";
	}
	
}
