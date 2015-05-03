package org.chonger.web.master.ncgl;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.common.ConstantKey;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.system.User;
import org.chonger.service.ncgl.NcglServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.RollPage;
import org.chonger.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;
/**
 * 牛场管理的常用Action处理
 * @ClassName: NcglAction
 * @Description: 牛场管理Action
 * @author Daniel
 * @date Apr 10, 2015 10:39:15 PM
 * @version V1.0
 * 
 * @modify 2015-04-28	Daniel	1:修改Save函数，新增企业信息保存
 */
@SuppressWarnings("serial")
@ParentPackage("json-default") 
@Results({ 
	@Result(name = "error", location = "/error.jsp"),
	@Result(name = "infos", type = "json", params = { "root", "jsonResult.infos"}),
	@Result(name = "infolist", type = "json", params = { "root", "jsonResult.objList"}),
	@Result(name = "list.jsp", location = "/admin/pages/ncgl/index.jsp"),
	@Result(name = "edit.jsp", location = "/admin/pages/ncgl/add.jsp")
})
public class NcglAction extends ActionSupport {
	
	public NcglAction(){
		jsonResult=new JsonResultUtils();
	}
	
	@Autowired
	private NcglServer server;
	
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**农场基本信息实体*/
	private NCJBXX nc;
	public NCJBXX getNc() {		return nc;	}
	public void setNc(NCJBXX nc) {		this.nc = nc;	}
	
	private List<NCJBXX> nclist;
	public List<NCJBXX> getNclist() {		return nclist;	}
	
	/**列表翻页组件*/
	@Autowired
	public RollPage<NCJBXX> pager;
	private int p;
	public void setP(int p) {		this.p = p;	}
	
	@Override
	public String execute() throws Exception {
		pager.init(server.getQueryString(),pager.pageSize,p);
		nclist=pager.getDataSource();
		return "list.jsp";
	}
	
	/**保存数据操作*/
	public String save() throws Exception{
		
		try{
			
			//当前用户
			User user=SessionUtils.getUser();			
			if(user!=null)
			{
				//企业用户角色
				if(user.getRole().getRtype()==2)
				{
					NCJBXX _ncjbxx=user.getNcjbxx();
					if(_ncjbxx!=null)
					{
						nc.setNcbh(_ncjbxx.getNcbh());
						nc.setKssysj(_ncjbxx.getKssysj());
						nc.setTzsysj(_ncjbxx.getTzsysj());
					}
					nc.setYhid(user.getUid());
				}
				server.saveOrUpdate(nc);
				jsonResult.sendSuccessMessage("更新牛场信息成功！");
				
				//更新用户缓存
				if(user.getRole().getRtype()==2)
				{
					user.setNcjbxx(nc);
					SessionUtils.setSession(ConstantKey.SESSION_USER_NCXX_OBJECT, nc);
				}				
			}
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("更新牛场信息异常！");
		}
		
		return "infos";
	}
	
	public String loadname() throws Exception{
		
		List<NCJBXX> ncjbxxList=server.findAll();
		
		if(ncjbxxList!=null&&ncjbxxList.size()>0)
		{
			jsonResult.objListInitOrClear();
			for(NCJBXX item : ncjbxxList)
			{
				HashMap<String,String> infoMap=new LinkedHashMap<String,String>();
				infoMap.put("name",item.getNcmc());
				infoMap.put("id",item.getNcbh());
				jsonResult.getObjList().add(infoMap);
			}
		}
		
		return "infolist";
	}
}
