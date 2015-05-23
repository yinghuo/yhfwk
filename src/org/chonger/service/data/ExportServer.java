package org.chonger.service.data;

import info.yinghuo.excel.ExcelFileType;
import info.yinghuo.excel.writer.ExcelWriter;
import info.yinghuo.excel.writer.SheetWriter;
import info.yinghuo.excel.writer.TableWriter;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.LinkedList;
import java.util.List;

import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.service.jsgl.JsglServer;
import org.chonger.utils.CommUUID;
import org.chonger.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title ExportServer.java 导出数据业务逻辑
* @package org.chonger.service.data
* @author Daniel
* @create 2015-5-19
 */
@Service
@Transactional
public class ExportServer {
	
	public static final String EXPORTDATATYPESESSIONKEY="_session_myexportdata_type_";
	public static final String EXPORTDATASESSIONKEY="_session_myexportdata_";
	public static final String EXPORTHEADSESSIONKEY="_session_myexportdata_head_";
	public static final String EXPORTFILESESSIONKEY="_session_myexportdata_file_";
	
	private String defaultSheetName="Data";
	
	@Autowired
	private JsglServer jsxxServer;
	
	
	/**圈舍信息模板表头*/
	public static final String[] JSXXColumnNames=new String[]{"圈舍编号","圈舍名称","圈舍类型","备注信息"};
	/**员工信息模板表头*/
	public static final String[] YGXXColumnNames=new String[]{"员工编号","员工名称","员工类别","证件号码","联系电话","联系地址","备注信息"};
	
	/**
	 * 导出Excel文件
	 * @param dataList
	 * @param heads
	 * @retrun InputStream 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws IOException 
	 */
	public String createExcel(List<String[]> dataList,String[] heads) throws IOException
	{
		ExcelWriter excelWriter=new ExcelWriter(ExcelFileType.XLS);
		SheetWriter sheetWriter=excelWriter.createSheet(defaultSheetName);
		TableWriter tableWriter=sheetWriter.createTable(0);
		
		tableWriter.setColumnNames(heads);
		tableWriter.setTableData(dataList);
		
		//获取服务器文件路径
		String realPath = FileUtil.getServicePathMk(FileUtil.IMPORTDATA);
		realPath+=(File.separatorChar+CommUUID.getUUID()+".xls");
		
		excelWriter.saveFileTo(realPath);
		
		excelWriter.close();
		
		return realPath;
	}
	
	
	//****************************************************各实体类导出函数********************************************************************//
	
	/**
	 * 读取圈舍信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectJSXX() throws Exception
	{
		List<JSJBXX> jsxxList=jsxxServer.finaAll();
		List<String[]> dataList=null;
		
		if(jsxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(JSJBXX jsxx : jsxxList)
			{
				String[] dataItem=new String[JSXXColumnNames.length];
				dataItem[0]=jsxx.getJsbh();
				dataItem[1]=jsxx.getJsmc();
				dataItem[2]=jsxx.getJslb();
				dataItem[3]=jsxx.getBz();
				
				dataList.add(dataItem);
			}			
		}		
		return dataList;
	}
	
}
