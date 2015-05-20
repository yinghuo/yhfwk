package org.chonger.service.data;

import info.yinghuo.excel.ExcelReader;
import info.yinghuo.excel.SheetReader;
import info.yinghuo.excel.TableReader;

import java.io.IOException;
import java.util.List;

import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.entity.jbxx.YGJBXX;
import org.chonger.service.jsgl.JsglServer;
import org.chonger.service.yggl.YgxxServer;
import org.chonger.utils.FileUtil;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
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
	
	public static final String IMPORTDATATYPESESSIONKEY="_session_myimportdata_type_";
	public static final String IMPORTDATASESSIONKEY="_session_myimportdata_";
	public static final String IMPORTHEADSESSIONKEY="_session_myimportdata_head_";
	
	@Autowired
	private JsglServer jsxxServer;
	@Autowired
	private YgxxServer ygxxServer;
	
	/**
	 * 识别圈舍信息Excel
	 * @param filePath
	 * @param heads
	 * @retrun List<String[]> 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws IOException 
	 */
	public List<String[]> readerExcel(String filePath,String[] heads) throws IOException
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
					if(table.hasColumnNamesWith(heads))
					{
						//读取数据项
						dataList=table.getTableData();
						System.out.println("读取数据行数："+dataList.size());
						//删除文档
						excelReader.close();
						FileUtil.delFile(filePath);
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
	
	//****************************************************各实体类导入函数********************************************************************//
	
	/**
	 * 保存圈舍信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertJSXX(List<String[]> dataList) throws Exception
	{
		if(dataList!=null)
		{
			try{
				for(String[] dataItem : dataList)
				{
					JSJBXX jsxx=new JSJBXX();
					jsxx.setJsbh(dataItem[0]);
					jsxx.setJsmc(dataItem[1]);
					jsxx.setJslb(dataItem[2]);
					jsxx.setBz(dataItem[3]);
					
					jsxxServer.saveOrUpdate(jsxx);
				}
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存员工信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertYGXX(List<String[]> dataList) throws Exception
	{
		if(dataList!=null)
		{
			try{
				for(String[] dataItem : dataList)
				{
					YGJBXX ygxx=new YGJBXX();
					ygxx.setYgbh(dataItem[0]);
					ygxx.setYgmc(dataItem[1]);
					ygxx.setYglb(dataItem[2]);
					ygxx.setZjhm(dataItem[3]);
					ygxx.setLxdh(dataItem[4]);
					ygxx.setLxdz(dataItem[5]);					
					ygxx.setBz(dataItem[6]);
					
					ygxxServer.saveOrUpdate(ygxx);
				}
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
}
