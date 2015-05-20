package org.chonger.web.master.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.service.data.ExportServer;
import org.chonger.service.data.ImportServer;
import org.chonger.utils.FileUpLoadUtils;
import org.chonger.utils.FileUtil;
import org.chonger.utils.JsonResultUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 数据导入Action处理
 * 
 * @ClassName: ImportAction
 * @Description: 数据导入Action
 * @author Daniel
 * @date 2015-5-18
 * @version V1.0
 * 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default")
@Results({
		@Result(name = "infos", type = "json", params = { "root","jsonResult.infos" }),
		@Result(name = "infolist", type = "json", params = { "root","jsonResult.objList" })
})
public class ImportAction extends ActionSupport {
	
	@Autowired
	private ImportServer server;
	
	public ImportAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**文件上传控件*/
	private FileUpLoadUtils upfile;
	public void setUpfile(File file) {
		if(upfile==null)
			upfile=new FileUpLoadUtils();
		this.upfile.setUpfile(file);
	}
	public void setUpfileFileName(String upfileFileName) {
		if(upfile==null)
			upfile=new FileUpLoadUtils();
		this.upfile.setUpfileFileName(upfileFileName);
	}
	
	/**数据类型*/
	private int fileType;
	public int getFileType() {return fileType;}
	public void setFileType(int fileType) {this.fileType = fileType;}

	private final int JSDATA=0;//圈舍数据导入
	private final int YGDATA=1;//员工数据导入
	
	
	@Override
	public String execute() throws Exception {
		jsonResult.infosInitOrClear();
		try
		{
			//图片保存
			if(upfile!=null&&upfile.getUpfile()!=null)
			{
				String[] fileParams=upfile.SaveFile(FileUtil.IMPORTDATA, true);
				String filePath=fileParams[3];
				//文件识别处理
				List<String[]> dataList=null;
				ActionContext.getContext().getSession().put(ImportServer.IMPORTDATATYPESESSIONKEY,fileType);
				switch(fileType)
				{
					case 0:
						dataList=server.readerExcel(filePath,ExportServer.JSXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.JSXXColumnNames);
						break;
					case 1:
						dataList=server.readerExcel(filePath,ExportServer.YGXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.YGXXColumnNames);
						break;
				}
				
				if(dataList!=null)
				{
					//数据解析完成，缓存session
					ActionContext.getContext().getSession().put(ImportServer.IMPORTDATASESSIONKEY, dataList);
					jsonResult.sendSuccessMessage(dataList.size()+"");
				}
				else
				{
					jsonResult.sendErrorMessage("数据文档中无法被识别，确认是否为指定模板！");
				}
				
			}
		}catch(IOException ex)
		{
			jsonResult.sendErrorMessage("数据处理异常："+ex.getMessage());
		}catch(Exception ex)
		{
			jsonResult.sendErrorMessage("数据导入异常："+ex.getMessage());
		}
		return "infos";
	};
	
	/**
	 * 将用户当前的识别数据导入到数据库中
	 * @throws Exception
	 * @retrun String 
	 * @author Daniel
	 * @version V1.0
	 */
	public String importData() throws Exception{
		jsonResult.infosInitOrClear();
		Object typeObject=ActionContext.getContext().getSession().get(ImportServer.IMPORTDATATYPESESSIONKEY);
		Object dataListObject=ActionContext.getContext().getSession().get(ImportServer.IMPORTDATASESSIONKEY);
		if(typeObject!=null&&dataListObject!=null)
		{
			try
			{
				fileType=Integer.parseInt(typeObject.toString());
				List<String[]> dataList=(List<String[]>)dataListObject;
				String url=null;
				switch(fileType)
				{
					case 0:
						//调用数据保存函数
						server.insertJSXX(dataList);
						url="/master/jsgl/jsgl.action";
						break;
					case 1:
						//调用数据保存函数
						server.insertYGXX(dataList);
						url="/master/yggl/ygxx.action";
						break;
				}
								
				jsonResult.sendSuccessMessage("导入数据成功！");
				jsonResult.getInfos().put("url",url);
				
			}catch(Exception ex)
			{
				jsonResult.sendErrorMessage("导入数据异常，请报告管理员！"+ex.getMessage());
			}finally{
				ActionContext.getContext().getSession().put(ImportServer.IMPORTDATATYPESESSIONKEY,null);
				ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, null);
				ActionContext.getContext().getSession().put(ImportServer.IMPORTDATASESSIONKEY, null);
			}
		}
		else
		{
			jsonResult.sendErrorMessage("无法找到可以导入的数据！");
		}
		
		return "infos";
	}
	
	
	
}
