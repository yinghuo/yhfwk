package org.chonger.web.master.fzgl;

import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fqxt.FQTSXX;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.service.fqxt.FQTSXXServer;
import org.chonger.service.fzgl.FqdjServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
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
	@Autowired
	private FQTSXXServer tsxxServer;
	
	
	
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
	public FQDJXX getFq() {return fq;}
	public void setFq(FQDJXX fq) {this.fq = fq;}
	
	private String id;
	public void setId(String id) {this.id = id;}
	
	private List<FQDJXX> fqlist;
	public List<FQDJXX> getFqlist() {return fqlist;}

	/** 列表翻页组件 */
	@Autowired
	public RollPage<FQDJXX> pager;
	private int p;
	public void setP(int p) {this.p = p;}
	

	/** 搜索查询参数定义 */
	private String bh, eb;	
	public String getBh() {return bh;}
	public void setBh(String bh) {this.bh = bh;}
	public String getEb() {return eb;}
	public void setEb(String eb) {this.eb = eb;}
	
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		if(!StringUtil.IsEmpty(eb))searchString+=("&eb="+eb);
		return searchString;
	}
	
	private String oname;
	private int otype;
	public void setOname(String oname) {this.oname = oname;}
	public void setOtype(int otype) {this.otype = otype;}
	public String getOname() { return oname; }
	public int getOtype() { return otype; }
	
	/** 排序获取，方便翻页使用 */
	public String getOrderString()
	{
		String orderString = "";
		
		return orderString;
	}
	
	@Override
	public String execute() throws Exception {
		//modify 2015-06-03	Daniel	添加排序，需要配种的排在前面
		
		String order = "model.sfpz";
		if(!StringUtil.IsEmpty(oname)){
			order = "model." + oname + " " + (otype==1?"desc":"asc");
		}
		
		pager.init(server.getQueryString(bh, eb)+" order by " + order, pager.pageSize, p);
		fqlist = pager.getDataSource();
		return "fq-list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(fq.getXh())?"新增":"更新")+"发情信息成功！");
			server.saveOrUpdate(fq);
		} catch (Exception ex) {
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(fq.getXh())?"新增":"更新")+"发情信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			fq=server.getFqxxById(id);
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
	
	/**
	 * 新增发情信息，通过其他信息
	 * 
	 * @modify 2015-07-25	Daniel	1:修改发情系统的确认发情到发情信息登记信息完善
	 * @modify 2015-07-25	Daniel	1:注销函数
	 */
	@Deprecated
	public String add() throws Exception
	{
		if(!StringUtil.IsEmpty(id))
		{
			//通过ID加载提示消息
			FQTSXX tsxx=tsxxServer.findEntity(id);
			
			if(tsxx!=null)
			{
				fq=new FQDJXX();
				fq.setNzbh(tsxx.getNzbh());
				fq.setNzjbxx(tsxx.getNzjbxx());
				
				//处理发情系统信息中的时间
				
				fq.setFxfs("1");
				
			}
		}
		
		return "edit.jsp";
	}
}
