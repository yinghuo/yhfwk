package org.chonger.web.master.fzgl;

import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantEnum.NZFZZT;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.fzgl.PZDJXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.fzgl.FqdjServer;
import org.chonger.service.fzgl.PzdjServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.service.yggl.YgxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
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
	@Autowired
	private FqdjServer fqServer;
	@Autowired
	private NzxxServer nzServer;
	
	public PzdjAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**配种登记实体*/
	private PZDJXX pz;	
	public PZDJXX getPz() {return pz;}
	public void setPz(PZDJXX pz) {this.pz = pz;}
	
	private List<PZDJXX> pzlist;	
	public List<PZDJXX> getPzlist() {return pzlist;}
	
	private String id;
	public void setId(String id) {this.id = id;}
	public String getId() {return id;}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<PZDJXX> pager;
	private int p;
	public void setP(int p) {this.p = p;	}
	
	/** 搜索查询参数定义 */
	private String bh, eb;
	public String getBh() {return bh;}
	public void setBh(String bh) {this.bh = bh;	}
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
		//modify 2015-06-04	Daniel	添加排序，按照配种时间排序
		String order = "model.pzsj desc";
		if(!StringUtil.IsEmpty(oname)){
			order = "model." + oname + " " + (otype==1?"desc":"asc");
		}
		
		pager.init(server.getQueryString(bh, eb) + " order by " + order, pager.pageSize, p);
		pzlist = pager.getDataSource();
		return "pz-list.jsp";
	}

	/** 保存数据操作 */
	public String save() throws Exception {
		try {
			
			//检测当前牛只是否可以进行配种
			NZJBXX _nzxx=nzServer.queryNZById(pz.getNzbh());
			
			if(_nzxx==null||_nzxx.getNzfzzt()==null||_nzxx.getNzfzzt().getZt()!=NZFZZT.发情期.getValue())
			{
				jsonResult.sendErrorMessage("该牛只当前未发情，不能进行配种操作！");
			}
			else
			{			
				jsonResult.sendSuccessMessage((StringUtil.IsEmpty(pz.getXh()) ? "新增" : "更新") + "配种信息成功！");
				server.saveOrUpdate(pz);
			}
		} catch (Exception ex) {
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(pz.getXh()) ? "新增" : "更新") + "配种信息异常！");
		}
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			pz=server.getPzxxById(id);
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
	
	/**对已发情的牛只增加配种*/
	public String addPz() throws Exception{
		
		//依据发情的ID加载发情的牛只
		if(!StringUtil.IsEmpty(id))
		{
			//加载发情信息
			FQDJXX _fqxx=fqServer.getFqxxById(id);
			if(_fqxx!=null)
			{
				//转换发情信息为配种信息
				NZJBXX _nzjbxx=_fqxx.getNzjbxx();
				pz=new PZDJXX();
				pz.setNzjbxx(_nzjbxx);
				pz.setNzbh(_nzjbxx.getXh());
				pz.setPzsj(new Date());
				pz.setFqsj(_fqxx.getFqsj());
				pz.setFqlx(_fqxx.getFqlx());
				pz.setFxfs(_fqxx.getFxfs());
				//pz.setFxr(_fqxx.getFxr());
				
				//加载默认员工
				pz.setFxr((String)ServletActionContext.getRequest().getSession().getAttribute(YgxxServer.YGXXNAME));
				
			}
		}
		
		return "edit.jsp";
	}
	
	
}
	
