package org.chonger.web.master.nzgl;

import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantEnum;
import org.chonger.common.ConstantEnum.NZMRZT;
import org.chonger.common.ConstantEnum.NZZT;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZMRZTXX;
import org.chonger.service.nzgl.NzfzServer;
import org.chonger.service.nzgl.NzmrServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛只信息的常用Action处理
 * @ClassName: NzxxAction
 * @Description: 牛只信息管理Action
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
	@Result(name = "list.jsp", location = "/admin/pages/nzgl/nz-index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/nzgl/nz-add.jsp"),
	@Result(name = "info.jsp", location = "/admin/pages/nzgl/nz-info.jsp")
})
public class NzxxAction extends ActionSupport {
	
	@Autowired
	private NzxxServer server;
	
	@Autowired
	private NzfzServer fzServer;
	@Autowired
	private NzmrServer mrServer;
	
	public NzxxAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}

	/**牛只基本信息实体*/
	private NZJBXX nz;
	public NZJBXX getNz() {		return nz;	}
	public void setNz(NZJBXX nz) {		this.nz = nz;	}
	
	private List<NZJBXX> nzlist;
	public List<NZJBXX> getNzlist() {		return nzlist;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NZJBXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	private String id;
	public void setId(String id) {	this.id = id;	}
	
	/**搜索查询参数定义*/
	private String bh,jbq,eb;
	public String getBh() {	return bh;	}
	public void setBh(String bh) {this.bh = bh;}
	public String getJbq() {	return jbq;	}
	public void setJbq(String jbq) {this.jbq = jbq;}
	public String getEb() {	return eb;	}
	public void setEb(String eb) {this.eb = eb;}
	/**搜索参数获取，方便翻页使用*/
	public String getSearchString()
	{
		String searchString="";
		if(!StringUtil.IsEmpty(bh))searchString+=("&bh="+bh);
		if(!StringUtil.IsEmpty(jbq))searchString+=("&jbq="+jbq);
		if(!StringUtil.IsEmpty(eb))searchString+=("&eb="+eb);
		return searchString;
	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(bh,eb,jbq),pager.pageSize,p);
		nzlist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		try{
			jsonResult.sendSuccessMessage((StringUtil.IsEmpty(nz.getXh())?"新增":"更新")+"牛只信息成功！");
			//根据牛只月龄计算牛只的类别
			server.updateLBFromYL(nz);
			server.saveOrUpdate(nz);
			
			//modify 2015-06-28 1：更新牛只信息时同步更新牛只的繁殖状态和泌乳状态，老牛可能会填写信息
			//如果是母牛则更新状态
			if(nz.getXb()==ConstantEnum.NZXB.母.getValue())
			{
				fzServer.saveOrUpDate(nz,nz.getFzzt());
				mrServer.saveOrUpDate(nz, nz.getMrzt());
			}
			
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage((StringUtil.IsEmpty(nz.getXh())?"新增":"更新")+"牛只信息异常！");
		}		
		return "infos";
	}
	
	/**修改数据操作*/
	public String edit() throws Exception{
		
		if(!StringUtil.IsEmpty(id))
		{
			nz=server.queryNZById(id);
		}
		return "edit.jsp";
	}
	
	/**
	 * 删除数据操作
	 * 
	 * @modify 2015-07-25	Daniel	1:注释删除操作，牛只功能无删除操作！
	 */	
	public String delete() throws Exception{
		try{
			//server.delete(id);
			jsonResult.sendSuccessMessage("删除牛只信息成功！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}
		return "infos";
	}
	
	/**淘汰数据操作*/
	public String eliminate() throws Exception{
		
		try
		{
			server.eliminate(id);
			jsonResult.sendSuccessMessage("淘汰牛只完成！");
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage(ex.getMessage());
		}		
		return "infos";
	}
	
	/**
	 * 加载牛只的其他信息
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public String info()
	{
		if(!StringUtil.IsEmpty(id))
		{
			nz=server.queryNZById(id);
		}
		return "info.jsp";
	}
	
	/**
	 * 加载牛只信息
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public String load()
	{
		List<NZJBXX> nzxxList=server.getAllNZ();
		if(nzxxList!=null&&nzxxList.size()>0)
		{
			jsonResult.objListInitOrClear();
			for(NZJBXX item : nzxxList)
			{
				Map<String,String> itemMap=new LinkedHashMap<String,String>();
				itemMap.put("id",item.getXh());
				itemMap.put("name",item.getNzbh());
				jsonResult.getObjList().add(itemMap);
			}
		}
		
		return "infolist";
	}
	
	/**
	 * 获取当前牛只的统计信息
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * 
	 * modify 2015-07-25
	 */
	public String loadType()
	{
		jsonResult.infosInitOrClear();
		try
		{
			//查询统计结果
			List<Object> countResult=server.queryByGroupLb();
			
			long iCountAll = server.getNZCountByJSXX("");
			
			long ttCount=server.queryCountByNzzt(NZZT.淘汰);
			
			//统计分类 哺乳犊牛、断奶犊牛、小育成牛、大育成牛、青年母牛、成年母牛、留养公牛
			List<Object[]> lbList=new LinkedList<Object[]>();
			lbList.add(new Object[]{"哺乳犊牛",0});
			lbList.add(new Object[]{"断奶犊牛",0});
			lbList.add(new Object[]{"小育成牛",0});
			lbList.add(new Object[]{"大育成牛",0});
			lbList.add(new Object[]{"青年母牛",0});
			lbList.add(new Object[]{"成年母牛",0});
			lbList.add(new Object[]{"留养公牛",0});
			
			if(countResult!=null&&countResult.size()>0)
			{
				for(int i=0;i<countResult.size();i++)
				{
					Object[] values=(Object[])countResult.get(i);
					
					if(values[0]!=null&&!StringUtil.IsEmpty(values[0].toString()))
					{
						//判断类别序号，计入统计
						if(values[0].equals("0"))
						{
							lbList.get(0)[1]=values[1];
						}
						else if(values[0].equals("1"))
						{
							lbList.get(1)[1]=values[1];
						}
						else if(values[0].equals("2"))
						{
							lbList.get(2)[1]=values[1];
						}
						else if(values[0].equals("3"))
						{
							lbList.get(3)[1]=values[1];
						}
						else if(values[0].equals("4"))
						{
							lbList.get(4)[1]=values[1];
						}
						else if(values[0].equals("5"))
						{
							lbList.get(5)[1]=values[1];
						}
						else if(values[0].equals("6"))
						{
							lbList.get(6)[1]=values[1];
						}
					}				
				}
			}
			
			jsonResult.getInfos().put(JsonResultUtils.ERROR, JsonResultUtils.OKVALUE);
			jsonResult.getInfos().put("data",lbList);
			jsonResult.getInfos().put("icount", iCountAll);
			jsonResult.getInfos().put("tcount",ttCount);
			
		}catch(Exception ex)
		{
			jsonResult.getInfos().put(JsonResultUtils.ERROR, JsonResultUtils.ERRORVALUE);
			jsonResult.getInfos().put(JsonResultUtils.MESSAGE,"未完成的统计查询！");
		}
		
		return "infos";
	}
	
	/**
	 * 获取泌乳牛统计信息
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public String loadCount()
	{
		jsonResult.infosInitOrClear();
		jsonResult.getInfos().put("a",0);
		jsonResult.getInfos().put("m",0);
		jsonResult.getInfos().put("g",0);
		
		//获取繁殖中的泌乳牛
		List<NZJBXX> nzxxList=server.queryNZByLB(ConstantEnum.NZLB.成年母牛.getValue());
		
		if(nzxxList!=null&&nzxxList.size()>0)
		{
			jsonResult.getInfos().put("a",nzxxList.size());
			int miru=0;
			int gann=0;
			//通知牛只的泌乳状态
			for(NZJBXX nzxx : nzxxList)
			{
				NZMRZTXX mrzt=nzxx.getNzmrzt();
				if(mrzt!=null)
				{
					if(mrzt.getZt()==NZMRZT.干奶期.getValue())
						gann+=1;
					else
						miru+=1;
				}
			}
			jsonResult.getInfos().put("m",miru);
			jsonResult.getInfos().put("g",gann);
			jsonResult.getInfos().put(JsonResultUtils.ERROR, JsonResultUtils.OKVALUE);
		}
		
		return "infos";
	}
	
}
	
