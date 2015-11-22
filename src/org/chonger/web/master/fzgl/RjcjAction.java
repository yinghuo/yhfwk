package org.chonger.web.master.fzgl;

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantEnum.CJJG2;
import org.chonger.entity.fzgl.PZDJXX;
import org.chonger.entity.fzgl.RJCJXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.fzgl.PzdjServer;
import org.chonger.service.fzgl.RjcjServer;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 妊娠初检登记的常用Action处理
 * @ClassName: LcdjAction
 * @Description: 妊娠初检登记管理Action
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
	@Result(name = "rj-list.jsp", location = "/admin/pages/fzgl/rjcj-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fzgl/rjcj-add.jsp")
})
public class RjcjAction extends ActionSupport {
	
	@Autowired
	private RjcjServer server;
	@Autowired
	private PzdjServer pzServer;
	
	public RjcjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**妊娠检查登记实体*/
	private RJCJXX rj;	
	public RJCJXX getRj() {return rj;}
	public void setRj(RJCJXX rj) {this.rj = rj;}
	
	private List<RJCJXX> rjlist;
	public List<RJCJXX> getRjlist() {return rjlist;}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<RJCJXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	private String id;
	public void setId(String id) {this.id = id;}
	public String getId() {return id;}
	
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
	
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh, eb)+" order by model.cjrq desc", pager.pageSize, p);
		rjlist = pager.getDataSource();
		return "rj-list.jsp";
	}
	
	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(rj.getXh()) ? "新增"
					: "更新") + "妊娠初检信息成功！");
			
			server.saveOrUpdate(rj);
		} catch (Exception ex) {
			ex.printStackTrace();
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(rj.getXh()) ? "新增"
					: "更新") + "妊娠初检信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			rj=server.getCjxxById(id);
		}
		return "edit.jsp";
	}
	
	/**删除数据操作*/
	public String delete() throws Exception{
		try{
			server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只妊检初检信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
	
	/**对已发情的牛只增加初检*/
	public String addCj() throws Exception
	{
		//根据ID查询配种信息
		if(!StringUtil.IsEmpty(id))
		{
			//加载配种信息
			PZDJXX _pzxx=pzServer.getPzxxById(id);
			if(_pzxx!=null)
			{
				//转换配种信息为初检信息
				rj=new RJCJXX();
				rj.setNzbh(_pzxx.getNzbh());
				rj.setNzjbxx(_pzxx.getNzjbxx());
				rj.setCjrq(new Date());
				rj.setCjjg(-1);
				rj.setCjfs(-1);
			}
		}
		return "edit.jsp";
	}
	
	private String t,r;
	private int v;
	public String getT() {	return t;	}	
	public void setT(String t) {	this.t = t;	}
	public int getV() {	return v;	}
	public void setV(int v) {	this.v = v;	}
	public String getR() {	return r;	}
	public void setR(String r) {	this.r = r;	}
	
	/**
	 * 检查结果处理
	 * @Title: jc 
	 * @Description: Note(这里用一句话描述这个方法的作用) 
	 * @throws Exception
	 * @retrun String 
	 * @author Daniel
	 * @version V1.0
	 */
	public String jc() throws Exception
	{
		System.out.println("更新id:"+id);
		System.out.println("更新类型:"+t);
		System.out.println("更新值:"+v);
		System.out.println("更新行:"+r);
		System.out.println("更新时间:"+rj.getRj2rq());
		
		if(!StringUtil.IsEmpty(id))
		{
			//根据ID查找指定的检查信息
			RJCJXX rjxx=server.getCjxxById(id);
			
			if(rjxx!=null)
			{
				//更新数据项
				if(!StringUtil.IsEmpty(t))
				{
					if(t.equals("2"))//更新2
					{
						rjxx.setRj2rq(rj.getRj2rq());
						rjxx.setRj2jg(v);
						server.saveOrUpdate(rjxx);
						jsonResult.sendSuccessMessage("操作成功！");
						jsonResult.getInfos().put("t",t);
						jsonResult.getInfos().put("r",r);
						jsonResult.getInfos().put("d",rj.getRj2rq()!=null?DateTimeUtil.formatDateToString(rj.getRj2rq(),"yyyy年MM月dd日"):"");
						jsonResult.getInfos().put("v",v==0?CJJG2.有胎.toString():CJJG2.无胎.toString());
					}
					else if(t.equals("3"))
					{
						rjxx.setRj3rq(rj.getRj3rq());
						rjxx.setRj3jg(v);
						server.saveOrUpdate(rjxx);
						jsonResult.sendSuccessMessage("操作成功！");
						jsonResult.getInfos().put("t",t);
						jsonResult.getInfos().put("r",r);
						jsonResult.getInfos().put("d",rj.getRj3rq()!=null?DateTimeUtil.formatDateToString(rj.getRj3rq(),"yyyy年MM月dd日"):"");
						jsonResult.getInfos().put("v",v==0?CJJG2.有胎.toString():CJJG2.无胎.toString());
					}
					
				}
				else
					jsonResult.sendErrorMessage("无效的数据类型！");
			}
			else
				jsonResult.sendErrorMessage("无效的数据项！");
		}
		else
			jsonResult.sendErrorMessage("无效的数据项！");
		//获取id
		return "infos";
	}
	
}
	
