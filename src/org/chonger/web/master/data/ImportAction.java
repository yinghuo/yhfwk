package org.chonger.web.master.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
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
				switch(fileType)
				{
					case 0:
						dataList=server.readerJSXXExcel(filePath);
						break;
				
				}
				
				if(dataList!=null)
				{
					//数据解析完成，缓存session
					ActionContext.getContext().getSession().put(ImportServer.IMPORTSESSIONKEY, dataList);
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
	
	
	
	
	
}
