package org.chonger.web.master.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.service.data.DataType;
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
					case DataType.JSDATA:
						dataList=server.readerExcel(filePath,ExportServer.JSXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.JSXXColumnNames);
						break;
					case DataType.YGDATA:
						dataList=server.readerExcel(filePath,ExportServer.YGXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.YGXXColumnNames);
						break;
					case DataType.NZDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZXXColumnNames);
						break;
					case DataType.ZSDATA:
						dataList=server.readerExcel(filePath,ExportServer.ZSXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.ZSXXColumnNames);
						break;
					case DataType.LCDATA:
						dataList=server.readerExcel(filePath,ExportServer.LCXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.LCXXColumnNames);
						break;
					case DataType.FQXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZFQXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZFQXXColumnNames);
						break;
					case DataType.PZXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZPZXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZPZXXColumnNames);
						break;
					case DataType.RJCJDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZRJCJXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZRJCJXXColumnNames);
						break;
					case DataType.RJFJDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZRJFJXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZRJFJXXColumnNames);
						break;
					case DataType.GNXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZGNXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZGNXXColumnNames);
						break;
					case DataType.CDXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZCDXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZCDXXColumnNames);
						break;
					case DataType.LCXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZLCXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZLCXXColumnNames);
						break;
					case DataType.GTCNXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZGTCNXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZGTCNXXColumnNames);
						break;
					case DataType.QTCNXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZQTCNXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZQTCNXXColumnNames);
						break;
					case DataType.JBXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZJBXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZJBXXColumnNames);
						break;
					case DataType.MYXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZMYXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZMYXXColumnNames);
						break;
					case DataType.JYXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZJYXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZJYXXColumnNames);
						break;
					case DataType.QCXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZQCXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZQCXXColumnNames);
						break;
					case DataType.HTXTXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.NZHTXTXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.NZHTXTXXColumnNames);
						break;
					case DataType.XDXXDATA:
						dataList=server.readerExcel(filePath,ExportServer.XDXXColumnNames);
						ActionContext.getContext().getSession().put(ImportServer.IMPORTHEADSESSIONKEY, ExportServer.XDXXColumnNames);
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
					case DataType.JSDATA:
						server.insertJSXX(dataList);
						url="/master/jsgl/jsgl.action";
						break;
					case DataType.YGDATA:
						server.insertYGXX(dataList);
						url="/master/yggl/ygxx.action";
						break;
					case DataType.NZDATA:
						server.insertNZXX(dataList);
						url="/master/nzgl/nzxx.action";
						break;
					case DataType.ZSDATA:
						server.insertZSXX(dataList);
						url="/master/nzgl/zsxx.action";
						break;
					case DataType.LCDATA:
						server.insertLCXX(dataList);
						url="/master/nzgl/lcxx.action";
						break;
					case DataType.FQXXDATA:
						server.insertNZFQXX(dataList);
						url="/master/fzgl/fqdj.action";
						break;
					case DataType.PZXXDATA:
						server.insertNZPZXX(dataList);
						url="/master/fzgl/pzdj.action";
						break;
					case DataType.RJCJDATA:
						server.insertNZRJCJXX(dataList);
						url="/master/fzgl/rjcj.action";
						break;
					case DataType.RJFJDATA:
						server.insertNZRJFJXX(dataList);
						url="/master/fzgl/rjfj.action";
						break;
					case DataType.GNXXDATA:
						server.insertNZGNXX(dataList);
						url="/master/fzgl/gndj.action";
						break;
					case DataType.CDXXDATA:
						server.insertNZCDXX(dataList);
						url="/master/fzgl/cddj.action";
						break;
					case DataType.LCXXDATA:
						server.insertNZLCXX(dataList);
						url="/master/fzgl/lcdj.action";
						break;
					case DataType.GTCNXXDATA:
						server.insertNZGTCNXX(dataList);
						url="/master/cngl/gtcnxx.action";
						break;
					case DataType.QTCNXXDATA:
						server.insertNZQTCNXX(dataList);
						//url="/master/cngl/";
						break;
					case DataType.JBXXDATA:
						server.insertNZJBXX(dataList);
						url="/master/jbfy/jbxx.action";
						break;
					case DataType.MYXXDATA:
						server.insertNZMYXX(dataList);
						url="/master/jbfy/myxx.action";
						break;
					case DataType.JYXXDATA:
						server.insertNZJYXX(dataList);
						url="/master/jbfy/jyxx.action";
						break;
					case DataType.QCXXDATA:
						server.insertNZQCXX(dataList);
						url="/master/jbfy/qcxx.action";
						break;
					case DataType.HTXTXXDATA:
						server.insertNZHTXTXX(dataList);
						url="/master/jbfy/htxtxx.action";
						break;
					case DataType.XDXXDATA:
						server.insertXDXX(dataList);
						url="/master/jbfy/xdxx.action";
						break;
				}
								
				jsonResult.sendSuccessMessage("导入数据成功！");
				jsonResult.getInfos().put("url",url);
				
			}catch(Exception ex)
			{
				jsonResult.sendErrorMessage("导入数据异常，请报告管理员！"+ex.getMessage());
			}finally{
				ActionContext.getContext().getSession().remove(ImportServer.IMPORTDATATYPESESSIONKEY);
				ActionContext.getContext().getSession().remove(ImportServer.IMPORTHEADSESSIONKEY);
				ActionContext.getContext().getSession().remove(ImportServer.IMPORTDATASESSIONKEY);
			}
		}
		else
		{
			jsonResult.sendErrorMessage("无法找到可以导入的数据！");
		}
		
		return "infos";
	}
	
	
	
}
