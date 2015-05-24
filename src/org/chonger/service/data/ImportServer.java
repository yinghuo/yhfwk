package org.chonger.service.data;

import info.yinghuo.excel.reader.ExcelReader;
import info.yinghuo.excel.reader.SheetReader;
import info.yinghuo.excel.reader.TableReader;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.chonger.common.ConstantEnum;
import org.chonger.entity.cngl.GTCNXX;
import org.chonger.entity.fzgl.CDDJXX;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.fzgl.GNDJXX;
import org.chonger.entity.fzgl.LCXX;
import org.chonger.entity.fzgl.PZDJXX;
import org.chonger.entity.fzgl.RJCJXX;
import org.chonger.entity.fzgl.RJFJXX;
import org.chonger.entity.jbfy.HTXTXX;
import org.chonger.entity.jbfy.JBXX;
import org.chonger.entity.jbfy.JYXX;
import org.chonger.entity.jbfy.MYXX;
import org.chonger.entity.jbfy.QCXX;
import org.chonger.entity.jbfy.XDXX;
import org.chonger.entity.jbxx.JSJBXX;
import org.chonger.entity.jbxx.YGJBXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.service.cngl.GtcnServer;
import org.chonger.service.fzgl.CddjServer;
import org.chonger.service.fzgl.FqdjServer;
import org.chonger.service.fzgl.GndjServer;
import org.chonger.service.fzgl.LcdjServer;
import org.chonger.service.fzgl.PzdjServer;
import org.chonger.service.fzgl.RjcjServer;
import org.chonger.service.fzgl.RjfjServer;
import org.chonger.service.jbfy.HtxtglServer;
import org.chonger.service.jbfy.JbglServer;
import org.chonger.service.jbfy.JyglServer;
import org.chonger.service.jbfy.MyglServer;
import org.chonger.service.jbfy.QcglServer;
import org.chonger.service.jbfy.XdglServer;
import org.chonger.service.jsgl.JsglServer;
import org.chonger.service.nzgl.NzxxServer;
import org.chonger.service.yggl.YgxxServer;
import org.chonger.utils.DateTimeUtil;
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
	@Autowired
	private NzxxServer nzxxServer;
	@Autowired
	private FqdjServer fqxxServer;
	@Autowired
	private PzdjServer pzxxServer;
	@Autowired
	private RjcjServer rjcjxxServer;
	@Autowired
	private RjfjServer rjfjxxServer;
	@Autowired
	private GndjServer gnxxServer;
	@Autowired
	private CddjServer cdxxServer;
	@Autowired
	private LcdjServer lcxxServer;	
	@Autowired
	private GtcnServer gtcnServer;
	@Autowired
	private JbglServer jbglServer;
	@Autowired
	private MyglServer myglServer;
	@Autowired
	private JyglServer jyglServer;
	@Autowired
	private QcglServer qcglServer;
	@Autowired
	private HtxtglServer htxtglServer;
	@Autowired
	private XdglServer xdglServer;
	
	
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
	
	/**
	 * 保存牛只信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZXX(List<String[]> dataList) throws Exception
	{
		if(dataList!=null)
		{
			try{
				//导入牛只信息需要进行圈舍的编号验证
				Map<String,String> jsxxMap=jsxxServer.findBh$IdMap();
				if(jsxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String jsbh=dataItem[1];
						if(jsxxMap.containsKey(jsbh))
						{
							NZJBXX nzxx=new NZJBXX();
							nzxx.setNzbh(dataItem[0]);
							nzxx.setJs(jsxxMap.get(jsbh));
							nzxx.setEbbh(dataItem[2]);
							nzxx.setJbqbh(dataItem[3]);
							nzxx.setCsrq(DateTimeUtil.parseDate2YMDHMS(dataItem[4]));
							nzxx.setXb(ConstantEnum.NZXB.valueOf(dataItem[5]).getValue());
							nzxx.setRqlx(ConstantEnum.NZRQLX.valueOf(dataItem[6]).getValue()+"");
							nzxx.setRqsj(DateTimeUtil.parseDate2YMDHMS(dataItem[7]));
							nzxx.setCsz(Double.parseDouble(dataItem[8]));
							nzxx.setPz(dataItem[9]);
							nzxx.setMs(dataItem[10]);
							nzxx.setTc((int)Double.parseDouble(dataItem[11]));
							nzxx.setCdrq(DateTimeUtil.parseDate2YMDHMS(dataItem[12]));
							nzxx.setFqh(dataItem[13]);
							nzxx.setMqh(dataItem[14]);
							nzxx.setMrzt(dataItem[15]);
							nzxx.setFzzt(dataItem[16]);
							nzxx.setBz(dataItem[17]);
							
							nzxxServer.saveOrUpdate(nzxx);
						}
						else
							throw new Exception("不可用的圈舍编号["+jsbh+"]！");
					}
				}
				else
					throw new Exception("无可用的圈舍信息，请先添加圈舍信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只转舍信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertZSXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只离场信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertLCXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只发情信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZFQXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只发情信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							FQDJXX fqxx=new FQDJXX();
							fqxx.setNzbh(nzxxMap.get(nzbh));
							fqxx.setFqsj(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							fqxx.setFqlx(ConstantEnum.FQLX.valueOf(dataItem[2]).getValue()+"");
							fqxx.setFxfs(ConstantEnum.FXFS.valueOf(dataItem[3]).getValue()+"");
							fqxx.setFxr(dataItem[4]);
							fqxx.setShy(dataItem[5]);
							fqxx.setSfpz(ConstantEnum.SFPZ.valueOf(dataItem[6]).getValue());
							fqxx.setWpyy(dataItem[7]);
							fqxx.setBz(dataItem[8]);
							fqxxServer.saveOrUpdate(fqxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只配种信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZPZXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只配种信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							PZDJXX pzxx=new PZDJXX();
							pzxx.setNzbh(nzxxMap.get(nzbh));
							pzxx.setPzsj(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							pzxx.setDjbh(dataItem[2]);
							pzxx.setDjlx(dataItem[3]);
							pzxx.setPzy(dataItem[4]);
							pzxx.setFqsj(DateTimeUtil.parseDate2YMDHMS(dataItem[5]));
							pzxx.setFqlx(ConstantEnum.FQLX.valueOf(dataItem[6]).getValue()+"");
							pzxx.setFxfs(ConstantEnum.FXFS.valueOf(dataItem[7]).getValue()+"");
							pzxx.setFxr(dataItem[8]);
							pzxx.setSl((int)Double.parseDouble(dataItem[9]));
							pzxx.setBz(dataItem[10]);
							pzxxServer.saveOrUpdate(pzxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只妊检初检信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZRJCJXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只妊检初检信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							RJCJXX rjcjxx=new RJCJXX();
							rjcjxx.setNzbh(nzxxMap.get(nzbh));
							rjcjxx.setCjrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							rjcjxx.setCjjg(ConstantEnum.CJJG.valueOf(dataItem[2]).getValue()); 
							rjcjxx.setCjy(dataItem[3]);
							rjcjxx.setCjfs(ConstantEnum.CJFS.valueOf(dataItem[4]).getValue());
							rjcjxx.setBz(dataItem[5]);							
							rjcjxxServer.saveOrUpdate(rjcjxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只妊检复检信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZRJFJXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只妊检复检需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							RJFJXX rjfjxx=new RJFJXX();
							rjfjxx.setNzbh(nzxxMap.get(nzbh));
							rjfjxx.setFjrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							rjfjxx.setFjjg(dataItem[2]);
							rjfjxx.setFjy(dataItem[3]);
							rjfjxx.setTezk(dataItem[4]);
							rjfjxx.setNzxb(ConstantEnum.NZXB.valueOf(dataItem[5]).getValue());
							rjfjxx.setBz(dataItem[6]);
							
							rjfjxxServer.saveOrUpdate(rjfjxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只干奶信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZGNXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只干奶信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							GNDJXX gnxx=new GNDJXX();
							gnxx.setNzbh(nzxxMap.get(nzbh));
							gnxx.setGnrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							gnxx.setGnff(dataItem[2]);
							gnxx.setSyyw(dataItem[3]);
							gnxx.setSy(dataItem[4]);
							gnxx.setBz(dataItem[5]);
							
							gnxxServer.saveOrUpdate(gnxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只产犊信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZCDXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只产犊信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							CDDJXX cdxx=new CDDJXX();
							cdxx.setNzbh(nzxxMap.get(nzbh));
							cdxx.setCdsj(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							cdxx.setCdlx(dataItem[2]);
							cdxx.setCdny(ConstantEnum.CDNYCD.valueOf(dataItem[3]).getValue()+"");
							cdxx.setTw(ConstantEnum.CDTW.valueOf(dataItem[4]).getValue()+"");
							cdxx.setJcy(dataItem[5]);
							cdxx.setTesl((int)Double.parseDouble(dataItem[6]));
							cdxx.setJbq(dataItem[7]);
							cdxx.setXzr(dataItem[8]);
							
							cdxxServer.saveOrUpdate(cdxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只流产信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZLCXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只流产信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							LCXX lcxx=new LCXX();
							lcxx.setNzbh(nzxxMap.get(nzbh));
							lcxx.setLcrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							lcxx.setLcyy(dataItem[2]);
							lcxx.setTelx(dataItem[3]);
							lcxx.setFxr(dataItem[4]);
							lcxx.setFxfs(dataItem[5]);
							lcxx.setHsr(dataItem[6]);
							lcxx.setLczr(dataItem[7]);
							lcxx.setBz(dataItem[8]);
							lcxxServer.saveOrUpdate(lcxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只个体产奶信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZGTCNXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只个体产奶信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							GTCNXX gtcnxx=new GTCNXX();
							gtcnxx.setNzbh(nzxxMap.get(nzbh));
							gtcnxx.setJnrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							gtcnxx.setBc(dataItem[2]);
							gtcnxx.setCl(Double.parseDouble(dataItem[3]));
							gtcnxx.setBz(dataItem[4]);
							
							gtcnServer.saveOrUpdate(gtcnxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只群体产奶信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZQTCNXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只XX信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只疾病信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZJBXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只疾病信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							JBXX jbxx=new JBXX();
							jbxx.setNzbh(nzxxMap.get(nzbh));
							jbxx.setFbrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							jbxx.setJbzl(dataItem[2]);
							jbxx.setJbmc(dataItem[3]);
							jbxx.setZyzz(dataItem[4]);
							jbxx.setFbyy(dataItem[5]);
							jbxx.setYzcd(dataItem[6]);
							jbxx.setCzqk(dataItem[7]);
							jbxx.setFsqn(ConstantEnum.SFPZ.valueOf(dataItem[8]).getValue());
							jbxx.setYyrq(DateTimeUtil.parseDate2YMDHMS(dataItem[9]));
							jbxx.setYflj(Double.parseDouble(dataItem[10]));
							jbxx.setYycs((int)Double.parseDouble(dataItem[11]));
							jbxx.setJsxyrq(DateTimeUtil.parseDate2YMDHMS(dataItem[12]));
							jbxx.setSys(dataItem[13]);
							jbxx.setBz(dataItem[14]);
							jbglServer.saveOrUpdate(jbxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只免疫信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZMYXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只免疫信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							MYXX myxx=new MYXX();
							myxx.setNzbh(nzxxMap.get(nzbh));
							myxx.setMyrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							myxx.setMyxm(dataItem[2]);
							myxx.setYmmc(dataItem[3]);
							myxx.setSyjl(dataItem[4]);
							myxx.setPh(dataItem[5]);
							myxx.setZzs(dataItem[6]);
							myxx.setJg(dataItem[7]);
							myxx.setSy(dataItem[8]);
							myxx.setBz(dataItem[9]);
							myglServer.saveOrUpdate(myxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只检疫信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZJYXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只检疫信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							JYXX jyxx=new JYXX();
							jyxx.setNzbh(nzxxMap.get(nzbh));
							jyxx.setJyrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							jyxx.setJyyl((int)Double.parseDouble(dataItem[2]));
							jyxx.setJyxm(dataItem[3]);
							jyxx.setYmmc(dataItem[4]);
							jyxx.setJylx(dataItem[5]);
							jyxx.setSyjl(dataItem[6]);
							jyxx.setPh(dataItem[7]);
							jyxx.setZzs(dataItem[8]);
							jyxx.setJg(dataItem[9]);
							jyxx.setSy(dataItem[10]);
							jyxx.setBz(dataItem[11]);
							jyglServer.saveOrUpdate(jyxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只驱虫信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZQCXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只驱虫信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							QCXX qcxx=new QCXX();
							qcxx.setNzbh(nzxxMap.get(nzbh));
							qcxx.setQcrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							qcxx.setQcff(dataItem[2]);
							qcxx.setYwmc(dataItem[3]);
							qcxx.setSyjl(dataItem[4]);
							qcxx.setPh(dataItem[5]);
							qcxx.setZzs(dataItem[6]);
							qcxx.setQcxg(dataItem[7]);
							qcxx.setSy(dataItem[8]);
							qcxx.setBz(dataItem[9]);
							qcglServer.saveOrUpdate(qcxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存牛只护蹄修蹄信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertNZHTXTXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				//导入牛只护蹄修蹄信息需要进行牛只的编号验证
				Map<String,String> nzxxMap=nzxxServer.findBh$IdMap();
				if(nzxxMap!=null)
				{
					for(String[] dataItem : dataList)
					{
						String nzbh=dataItem[0];						
						if(nzxxMap.containsKey(nzbh))
						{
							HTXTXX htxtxx=new HTXTXX();
							htxtxx.setNzbh(nzxxMap.get(nzbh));
							htxtxx.setXtrq(DateTimeUtil.parseDate2YMDHMS(dataItem[1]));
							htxtxx.setZq(ConstantEnum.SFPZ.valueOf(dataItem[2]).getValue());
							htxtxx.setYq(ConstantEnum.SFPZ.valueOf(dataItem[3]).getValue());
							htxtxx.setZh(ConstantEnum.SFPZ.valueOf(dataItem[4]).getValue());
							htxtxx.setYh(ConstantEnum.SFPZ.valueOf(dataItem[5]).getValue());
							htxtxx.setSy(dataItem[6]);
							htxtxx.setBz(dataItem[7]);
							htxtglServer.saveOrUpdate(htxtxx);
						}
						else
							throw new Exception("不可用的牛只编号["+nzbh+"]！");
					}
				}
				else
					throw new Exception("无可用的牛只信息，请先添加牛只信息！");
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
	/**
	 * 保存消毒信息
	 * @param dataList
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public void insertXDXX(List<String[]> dataList) throws Exception{
		if(dataList!=null)
		{
			try{
				for(String[] dataItem : dataList)
				{
					XDXX xdxx=new XDXX();
					xdxx.setXdrq(DateTimeUtil.parseDate2YMDHMS(dataItem[0]));
					xdxx.setXdqy(dataItem[1]);
					xdxx.setYjmc(dataItem[2]);
					xdxx.setSyjl(dataItem[3]);
					xdxx.setPh(dataItem[4]);
					xdxx.setZzs(dataItem[5]);
					xdxx.setSy(dataItem[6]);
					xdxx.setBz(dataItem[7]);
					xdglServer.saveOrUpdate(xdxx);
				}
			}catch(Exception ex)
			{
				throw ex;
			}
		}
	}
	
}
