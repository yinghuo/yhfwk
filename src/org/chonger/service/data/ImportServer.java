package org.chonger.service.data;

import info.yinghuo.excel.ExcelReader;
import info.yinghuo.excel.SheetReader;
import info.yinghuo.excel.TableReader;

import java.io.IOException;
import java.util.List;

import org.chonger.utils.StringUtil;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title ImportServer.java 导入数据业务逻辑
* @package org.chonger.service.data
* @author Daniel
* @create 2015-5-19
 */
@Service
@Transactional
public class ImportServer {
	
	public static final String IMPORTSESSIONKEY="_session_myimportdata_";
	
	/**
	 * 识别圈舍信息Excel
	 * @param filePath
	 * @retrun List<String[]> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws IOException 
	 */
	public List<String[]> readerJSXXExcel(String filePath) throws IOException
	{
		List<String[]> dataList=null;
		if(!StringUtil.IsEmpty(filePath))
		{
			//解析文件
			ExcelReader excelReader=new ExcelReader(filePath);
			//加载表
			if(excelReader.hasSheet())
			{
				SheetReader sheetReader=excelReader.getSheetReader(0);
				
				TableReader table=sheetReader.getTableReader(0);
				if(table!=null)
				{
					//检查表头
					if(table.hasColumnNamesWith(ExportServer.JSXXColumnNames))
					{
						//读取数据项
						dataList=table.getTableData();
						System.out.println("读取数据行数："+dataList.size());
						//删除文档
						
					}
					else
						throw new IOException("数据标头识别错误，确认文档是否为标准模板！");
				}
				else
					throw new IOException("无法读取数据表，确认文档中是否有数据表！");
			}
			else
				throw new IOException("文档中无可用数据！");
		}
		return dataList;
	}
	
}
