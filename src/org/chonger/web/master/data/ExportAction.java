package org.chonger.web.master.data;

import java.io.InputStream;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.service.data.ExportServer;
import org.chonger.utils.JsonResultUtils;
import org.chonger.utils.YhFileInputStream;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
/**
 * 数据导出Action处理
 * 
 * @ClassName: ExportAction
 * @Description: 数据导入Action
 * @author Daniel
 * @date 2015-5-23
 * @version V1.0
 * 
 */
@SuppressWarnings("serial")
@ParentPackage("json-default")
@Results({
		@Result(name = "infos", type = "json", params = { "root","jsonResult.infos" }),
		@Result(name = "infolist", type = "json", params = { "root","jsonResult.objList" }),
		@Result(params = {
					"contentType","application/octet-stream",
					"inputName","downloadInputStream",
					"contentDisposition","attachment;filename=\"${downloadFileName}\"", 
					"bufferSize","4096"},
				name = "downloadfile", type="stream")
})
public class ExportAction extends ActionSupport {
	
	@Autowired
	private ExportServer server;
	
	public ExportAction(){
		jsonResult=new JsonResultUtils();
	}
	
	/**返回的json消息*/
	private JsonResultUtils jsonResult;
	public JsonResultUtils getJsonResult() {	return jsonResult;	}
	
	/**数据类型*/
	private int fileType;
	public int getFileType() {return fileType;}
	public void setFileType(int fileType) {this.fileType = fileType;}
	
	/**文件下载通用属性*/
	private String downloadFileName;
	public String getDownloadFileName() {return downloadFileName;}
	private InputStream downloadInputStream;
	public InputStream getDownloadInputStream() {return downloadInputStream;}
	
	
	//加载导出数据
	@Override
	public String execute() throws Exception {
		jsonResult.infosInitOrClear();
		try
		{
			//保存文件类型
			ActionContext.getContext().getSession().put(ExportServer.EXPORTDATATYPESESSIONKEY,fileType);
			List<String[]> dataList=null;
			switch(fileType)//判断数据类型，进行各类文件读取
			{
				case DataType.JSDATA:
					dataList=server.selectJSXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.JSXXColumnNames);
					break;
			}
			ActionContext.getContext().getSession().put(ExportServer.EXPORTDATASESSIONKEY, dataList);
			jsonResult.sendSuccessMessage(dataList.size()+"");
		}
		catch(Exception ex)		
		{
			jsonResult.sendErrorMessage("数据导出异常："+ex.getMessage());
		}
		return "infos";
	}
	
	//生成导出文件
	public String exportData() throws Exception{
		jsonResult.infosInitOrClear();
		//获取列名
		String[] columnName=null;
		Object columnObject=ActionContext.getContext().getSession().get(ExportServer.EXPORTHEADSESSIONKEY);
		if(columnObject!=null)
		{
			columnName=(String[])columnObject;
		}
		else
			jsonResult.sendErrorMessage("无效的列名数据！");
		//获取数据
		List<String[]> dataList=null;
		Object dataObject=ActionContext.getContext().getSession().get(ExportServer.EXPORTDATASESSIONKEY);
		if(dataObject!=null)
		{
			dataList=(List<String[]>)dataObject;
		}
		else
			jsonResult.sendErrorMessage("无效的导出数据！");
		
		//生成文件
		if(columnName!=null&&dataList!=null)
		{
			String filepath=server.createExcel(dataList, columnName);
			
			ActionContext.getContext().getSession().put(ExportServer.EXPORTFILESESSIONKEY,filepath);
			//清空其他数据
			ActionContext.getContext().getSession().remove(ExportServer.EXPORTHEADSESSIONKEY);
			ActionContext.getContext().getSession().remove(ExportServer.EXPORTDATASESSIONKEY);
			
			jsonResult.sendSuccessMessage("");
		}
		return "infos";
	}
	
	public String download() throws Exception{
		String filepath=null;
		int fileType=-1;
		Object fileObject=ActionContext.getContext().getSession().get(ExportServer.EXPORTFILESESSIONKEY);
		if(fileObject!=null)
			filepath=(String)fileObject;
		
		Object fileTypeObject=ActionContext.getContext().getSession().get(ExportServer.EXPORTDATATYPESESSIONKEY);
		if(fileTypeObject!=null)
		{
			fileType=Integer.parseInt(fileTypeObject.toString());
			switch(fileType)
			{
				case DataType.JSDATA:
					downloadFileName="圈舍信息";
					break;
				case DataType.YGDATA:
					downloadFileName="员工信息";
					break;
			}
		}
		
		if(filepath!=null)
		{
			downloadFileName=new String((downloadFileName+".xls").getBytes(),"ISO-8859-1");
			downloadInputStream=new YhFileInputStream(filepath,true);
		}
		
		return "downloadfile";
	}
	
}
