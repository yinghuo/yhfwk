package org.chonger.web.master.fqxt;

import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.entity.fqxt.FQTSXX;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.service.fqxt.FQTSXXServer;
import org.chonger.service.fzgl.FqdjServer;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 发情提示消息管理的常用Action处理
 * @ClassName: FqtsAction
 * @Description: 发情提示消息Action
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
	@Result(name = "list.jsp", location = "/admin/pages/fqxt/ts-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/fqxt/ts-add.jsp")
})
public class FqtsAction extends ActionSupport {
	
	@Autowired
	private FQTSXXServer server;
	@Autowired
	private FqdjServer fqServer;
	
	public FqtsAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	/**列表翻页组件*/
	@Autowired
	public RollPage<FQTSXX> pager;
	public RollPage<FQTSXX> getPager() {return pager;}
	private int p;
	public void setP(int p) {this.p = p;}
	
	private FQTSXX ts;
	public FQTSXX getTs() {	return ts;}
	public void setTs(FQTSXX ts) {	this.ts = ts;}
	
	private List<FQTSXX> tslist;	
	public List<FQTSXX> getTslist() {return tslist;	}
	public void setTslist(List<FQTSXX> tslist) {this.tslist = tslist;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	private String bh;
	public String getBh() {	return bh;	}
	public void setBh(String bh) {	this.bh = bh;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh)+" order by model.sffq,xh desc",pager.pageSize,p);
		tslist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**
	 * 查看提示信息详情
	 * @throws Exception
	 * @retrun String 
	 * @author Daniel
	 * @version V1.0
	 */
	public String info() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			ts=server.findEntity(id);
		}		
		return "edit.jsp";
	}
	
	/**
	 * 确认已发情，用户点击已发情。
	 * 对id对应的已发情信息进行处理，生成发情信息
	 * @throws Exception
	 * @retrun String 
	 * @author Daniel
	 * @version V1.0
	 */
	public String yes() throws Exception{
		if(!StringUtil.IsEmpty(id))
		{
			//查询提示信息
			ts=server.findEntity(id);
			if(ts!=null)
			{
				if(ts.getSffq()==0)
				{
					
					
					//依据发情提示信息生成发情信息
					FQDJXX fq=new FQDJXX();
					fq.setNzbh(ts.getNzbh());
					fq.setNzjbxx(ts.getNzjbxx());
					
					//处理发情系统信息中的时间
					fq.setFqsj(server.parseDateByMsg(ts.getTsms()));
					
					fq.setFqlx("0");
					fq.setFxfs("1");
					fq.setSfpz(0);
					fq.setShy("");
					
//					Date tssj=DateTimeUtil.addDate(fq.getFqsj(), 0, 0,0,8,0,0);
//					Date tssj1=DateTimeUtil.addDate(fq.getFqsj(), 0, 0,0,12,0,0);
//					
//					fq.setPzsj(tssj);
//					fq.setPzsj1(tssj1);
					
					//保存发情登记信息
					fqServer.saveOrUpdate(fq);
					
					//更改提示信息
					ts.setSffq(1);//更改为确认发情
					ts.setShy("");
					ts.setFqid(fq.getXh());
					server.saveOrUpdate(ts);
					
					
					
					jsonResult.sendSuccessMessage("确认成功！最佳配种时间为:"+DateTimeUtil.formatDateToString(fq.getPzsj())+" 到 "+DateTimeUtil.formatDateToString(fq.getPzsj1())+"之间！");
					jsonResult.getInfos().put("id",bh);
					jsonResult.getInfos().put("shy",fq.getShy());
				}
				else
					jsonResult.sendErrorMessage("发情信息无法重复确认！");
			}
			else
				jsonResult.sendErrorMessage("无效的发情提示信息！");
		}
		return "infos";
	}
	
	/**
	 * 信息确认未发情
	 * @throws Exception
	 * @retrun String 
	 * @author Daniel
	 * @version V1.0
	 */
	public String pass() throws Exception{
		
		jsonResult.infosInitOrClear();
		if(!StringUtil.IsEmpty(id))
		{
			//更新信息的状态
			ts=server.findEntity(id);
			if(ts!=null)
			{
				if(ts.getSffq()==0)
				{				
					ts.setSffq(2);//确认未发情	
					ts.setShy("");
					server.saveOrUpdate(ts);					
					jsonResult.sendSuccessMessage("操作成功！");
					jsonResult.getInfos().put("id",bh);
					jsonResult.getInfos().put("shy",ts.getShy());
				}
				else
					jsonResult.sendErrorMessage("无效的信息状态！");					
			}
			else
			{
				jsonResult.sendErrorMessage("无效的信息编号！");
			}
		}
		else
		{
			jsonResult.sendErrorMessage("无效的信息编号！");
		}
		
		return "infos";
	}
	
}
