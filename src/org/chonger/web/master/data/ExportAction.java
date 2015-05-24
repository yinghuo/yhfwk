package org.chonger.web.master.data;

import java.io.InputStream;
import java.util.List;

import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.chonger.service.data.DataType;
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
				case DataType.YGDATA:
					dataList=server.selectYGXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.YGXXColumnNames);
					break;
				case DataType.NZDATA:
					dataList=server.selectNZXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZXXColumnNames);
					break;
				case DataType.ZSDATA:
					dataList=server.selectZSXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.ZSXXColumnNames);
					break;
				case DataType.LCDATA:
					dataList=server.selectLCXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.LCXXColumnNames);
					break;
				case DataType.FQXXDATA:
					dataList=server.selectNZFQXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZFQXXColumnNames);
					break;
				case DataType.PZXXDATA:
					dataList=server.selectNZPZXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZPZXXColumnNames);
					break;
				case DataType.RJCJDATA:
					dataList=server.selectNZRJCJXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZRJCJXXColumnNames);
					break;
				case DataType.RJFJDATA:
					dataList=server.selectRJFJXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZRJFJXXColumnNames);
					break;
				case DataType.GNXXDATA:
					dataList=server.selectNZGNXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZGNXXColumnNames);
					break;
				case DataType.CDXXDATA:
					dataList=server.selectNZCDXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZCDXXColumnNames);
					break;
				case DataType.LCXXDATA:
					dataList=server.selectNZLCXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZLCXXColumnNames);
					break;
				case DataType.GTCNXXDATA:
					dataList=server.selectNZGTCNXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZGTCNXXColumnNames);
					break;
				case DataType.QTCNXXDATA:
					dataList=server.selectNZQTCNXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZQTCNXXColumnNames);
					break;
				case DataType.JBXXDATA:
					dataList=server.selectNZJBXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZJBXXColumnNames);
					break;
				case DataType.MYXXDATA:
					dataList=server.selectNZMYXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZMYXXColumnNames);
					break;
				case DataType.JYXXDATA:
					dataList=server.selectNZJYXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZJYXXColumnNames);
					break;
				case DataType.QCXXDATA:
					dataList=server.selectNZQCXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZQCXXColumnNames);
					break;
				case DataType.HTXTXXDATA:
					dataList=server.selectNZHTXTXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.NZHTXTXXColumnNames);
					break;
				case DataType.XDXXDATA:
					dataList=server.selectXDXX();
					ActionContext.getContext().getSession().put(ExportServer.EXPORTHEADSESSIONKEY, ExportServer.XDXXColumnNames);
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
	
	/**
	 * 导出文件下载
	 * @return
	 * @throws Exception
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
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
				case DataType.NZDATA:
					downloadFileName="牛只信息";
					break;
				case DataType.ZSDATA:
					downloadFileName="牛只转舍信息";
					break;
				case DataType.LCDATA:
					downloadFileName="牛只离场信息";
					break;
				case DataType.FQXXDATA:
					downloadFileName="牛只发情登记信息";
					break;
				case DataType.PZXXDATA:
					downloadFileName="牛只配种登记信息";
					break;
				case DataType.RJCJDATA:
					downloadFileName="牛只妊检初检登记信息";
					break;
				case DataType.RJFJDATA:
					downloadFileName="牛只妊检复检登记信息";
					break;
				case DataType.GNXXDATA:
					downloadFileName="牛只干奶登记信息";
					break;
				case DataType.CDXXDATA:
					downloadFileName="牛只产犊登记信息";
					break;
				case DataType.LCXXDATA:
					downloadFileName="牛只流产登记信息";
					break;
				case DataType.GTCNXXDATA:
					downloadFileName="牛只个体产奶登记信息";
					break;
				case DataType.QTCNXXDATA:
					downloadFileName="牛只群体产奶登记信息";
					break;
				case DataType.JBXXDATA:
					downloadFileName="牛只疾病登记信息";
					break;
				case DataType.MYXXDATA:
					downloadFileName="牛只免疫登记信息";
					break;
				case DataType.JYXXDATA:
					downloadFileName="牛只检疫登记信息";
					break;
				case DataType.QCXXDATA:
					downloadFileName="牛只驱虫登记信息";
					break;
				case DataType.HTXTXXDATA:
					downloadFileName="牛只护蹄修蹄登记信息";
					break;
				case DataType.XDXXDATA:
					downloadFileName="消毒登记信息";
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
