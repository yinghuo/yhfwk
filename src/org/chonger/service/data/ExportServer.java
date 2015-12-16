package org.chonger.service.data;

import info.yinghuo.enums.BaseEnum;
import info.yinghuo.excel.ExcelFileType;
import info.yinghuo.excel.writer.ExcelWriter;
import info.yinghuo.excel.writer.SheetWriter;
import info.yinghuo.excel.writer.TableWriter;
import info.yinghuo.utils.EnumUtils;

import java.io.File;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

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
import org.chonger.service.fqxt.JBQXXServer;
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
import org.chonger.utils.CommUUID;
import org.chonger.utils.DateTimeUtil;
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
	@Autowired
	private JBQXXServer jbqxxServer;
	
	
	/**圈舍信息模板表头*/
	public static final String[] JSXXColumnNames=new String[]{"圈舍编号","圈舍名称","圈舍类型","备注信息"};
	/**员工信息模板表头*/
	public static final String[] YGXXColumnNames=new String[]{"员工编号","员工名称","员工类别","证件号码","联系电话","联系地址","备注信息"};
	/**牛只信息模板表头*/
	public static final String[] NZXXColumnNames=new String[]{"牛只编号","圈舍编号","电子耳标编号	","计步器编号","出生日期","性别","入群类型","入群时间","出生重","品种","毛色","胎次","产犊日期","父编号","母编号","泌乳状态","繁殖状态","备注信息"};
	/**牛只转舍信息模板表头*/
	public static final String[] ZSXXColumnNames=new String[]{};
	/**牛只离场信息模板表头*/
	public static final String[] LCXXColumnNames=new String[]{};
	/**牛只发情信息模板表头*/
	public static final String[] NZFQXXColumnNames=new String[]{"牛只编号","发情时间","发情类型","发现方式","发现人","审核员","是否配种","未配原因","备注信息"};
	/**牛只配种信息模板表头*/
	public static final String[] NZPZXXColumnNames=new String[]{"牛只编号","配种时间","冻精编号","冻精类型","配种员	","发情时间","发情类型","发现方式","发现人","数量","备注信息"};
	/**牛只妊检初检信息模板表头*/
	public static final String[] NZRJCJXXColumnNames=new String[]{"牛只编号","检查日期","初检结果","初检员","初检方式","备注信息"};
	/**牛只妊检复检信息模板表头*/
	public static final String[] NZRJFJXXColumnNames=new String[]{"牛只编号","复检日期","复检结果","复检员","胎儿状况","牛只性别","备注信息"};
	/**牛只干奶信息模板表头*/
	public static final String[] NZGNXXColumnNames=new String[]{"牛只编号","干奶日期","干奶方法","使用药物","兽医","备注信息"};
	/**牛只产犊信息模板表头*/
	public static final String[] NZCDXXColumnNames=new String[]{"牛只编号","产犊日期","产犊类型","产犊难易","胎位","接产员","胎儿数量","计步器","协助人"};
	/**牛只流产信息模板表头*/
	public static final String[] NZLCXXColumnNames=new String[]{"牛只编号","流产日期","流产原因","胎儿类型","发现人","发现方式","核实人","流产证人","备注信息"};
	/**牛只个体产奶信息模板表头*/
	public static final String[] NZGTCNXXColumnNames=new String[]{"牛只编号","挤奶日期","班次","产量","备注信息"};
	/**牛只群体产奶信息模板表头*/
	public static final String[] NZQTCNXXColumnNames=new String[]{};
	/**牛只疾病信息模板表头*/
	public static final String[] NZJBXXColumnNames=new String[]{"牛只编号","发病日期","疾病种类","疾病名称","主要症状","发病原因","严重程度","处置情况","是否弃奶","用药日期","药费累计","用药次数","结束休药日期","兽医","备注信息"};
	/**牛只免疫信息模板表头*/
	public static final String[] NZMYXXColumnNames=new String[]{"牛只编号","免疫日期","免疫项目","疫苗名称","使用剂量","批号","制造商","结果","兽医","备注信息"};
	/**牛只检疫信息模板表头*/
	public static final String[] NZJYXXColumnNames=new String[]{"牛只编号","检疫日期","检疫月龄","检疫项目","疫苗名称","检疫类型","使用剂量","批号","制造商","结果","兽医","备注信息"};
	/**牛只驱虫信息模板表头*/
	public static final String[] NZQCXXColumnNames=new String[]{"牛只编号","驱虫日期","驱虫方法","药物名称","使用剂量","批号","制造商","驱虫效果","兽医","备注信息"};
	/**牛只护蹄修蹄信息模板表头*/
	public static final String[] NZHTXTXXColumnNames=new String[]{"牛只编号","修蹄日期","左前肢","右前肢","左后肢","右后肢","兽医","备注信息"};
	/**消毒信息模板表头*/
	public static final String[] XDXXColumnNames=new String[]{"消毒日期","消毒区域","药剂名称","使用剂量","批号","制造商","兽医","备注信息"};	
	/**计步器模板表头*/
	public static final String[] JBQColumnNames=new String[]{"计步器编号","牛只编号","备注信息"};
	
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
		List<JSJBXX> jsxxList=jsxxServer.findAll();
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
	
	/**
	 * 读取员工信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectYGXX() throws Exception
	{
		List<YGJBXX> ygxxList=ygxxServer.findAllYGXX();
		List<String[]> dataList=null;
		if(ygxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(YGJBXX ygxx : ygxxList)
			{
				String[] dataItem=new String[YGXXColumnNames.length];
				dataItem[0]=ygxx.getYgbh();
				dataItem[1]=ygxx.getYgmc();
				dataItem[2]=ygxx.getYglb();
				dataItem[3]=ygxx.getZjhm();
				dataItem[4]=ygxx.getLxdh();
				dataItem[5]=ygxx.getLxdz();
				dataItem[6]=ygxx.getBz();
				
				dataList.add(dataItem);
			}	
		}
		return dataList;
	}
	
	/**
	 * 读取牛只信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZXX() throws Exception
	{
		List<NZJBXX> nzxxList=nzxxServer.getAllNZ();
		
		List<String[]> dataList=null;
		if(nzxxList!=null)
		{
			//牛只枚举
			Map<String,BaseEnum> nzEnumValues=EnumUtils.getEnum("NZXB");
			Map<String,BaseEnum> rqlxEnumValues=EnumUtils.getEnum("NZRQLX");
			
			dataList=new LinkedList<String[]>();
			for(NZJBXX nzxx : nzxxList)
			{
				String[] dataItem=new String[NZXXColumnNames.length];
				dataItem[0]=nzxx.getNzbh();
				dataItem[1]=nzxx.getJsjbxx().getJsbh();
				dataItem[2]=nzxx.getEbbh();
				dataItem[3]=nzxx.getJbqbh();
				dataItem[4]=DateTimeUtil.formatDateToString(nzxx.getCsrq());
				dataItem[5]=nzEnumValues.get(nzxx.getXb()+"").toString();
				dataItem[6]=rqlxEnumValues.get(nzxx.getRqlx()).toString();
				dataItem[7]=DateTimeUtil.formatDateToString(nzxx.getRqsj());
				dataItem[8]=nzxx.getCsz()+"";
				dataItem[9]=nzxx.getPz();
				dataItem[10]=nzxx.getMs();
				dataItem[11]=nzxx.getTc()+"";
				dataItem[12]=DateTimeUtil.formatDateToString(nzxx.getCdrq());
				dataItem[13]=nzxx.getFqh();
				dataItem[14]=nzxx.getMqh();
				dataItem[15]=nzxx.getMrzt()+"";
				dataItem[16]=nzxx.getFzzt()+"";
				dataItem[17]=nzxx.getBz();
				
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只转舍信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectZSXX() throws Exception
	{
		return null;
	}
	
	/**
	 * 读取牛只离场信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectLCXX() throws Exception
	{
		return null;
	}
	
	/**
	 * 读取牛只发情信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZFQXX() throws Exception
	{
		List<FQDJXX> fqxxList=fqxxServer.findAll();
		List<String[]> dataList=null;
		if(fqxxList!=null)
		{
			//发情枚举
			Map<String,BaseEnum> fqlxEnumValues=EnumUtils.getEnum("FQLX");
			Map<String,BaseEnum> fxfsEnumValues=EnumUtils.getEnum("FXFS");
			Map<String,BaseEnum> sfpzEnumValues=EnumUtils.getEnum("SFPZ");
			
			dataList=new LinkedList<String[]>();
			for(FQDJXX fqxx : fqxxList)
			{
				String[] dataItem=new String[NZFQXXColumnNames.length];
				dataItem[0]=fqxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(fqxx.getFqsj());
				dataItem[2]=fqlxEnumValues.get(fqxx.getFqlx()).toString();
				dataItem[3]=fxfsEnumValues.get(fqxx.getFxfs()).toString();
				dataItem[4]=fqxx.getFxr();
				dataItem[5]=fqxx.getShy();
				dataItem[6]=sfpzEnumValues.get(fqxx.getSfpz()+"").toString();
				dataItem[7]=fqxx.getWpyy();
				dataItem[8]=fqxx.getBz();
				
				dataList.add(dataItem);
			}
		}
		
		return dataList;
	}
	
	/**
	 * 读取牛只配种信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZPZXX() throws Exception
	{
		List<PZDJXX> pzxxList=pzxxServer.findAll();
		List<String[]> dataList=null;
		if(pzxxList!=null)
		{
			//发情枚举
			Map<String,BaseEnum> fqlxEnumValues=EnumUtils.getEnum("FQLX");
			Map<String,BaseEnum> fxfsEnumValues=EnumUtils.getEnum("FXFS");
			
			dataList=new LinkedList<String[]>();
			for(PZDJXX pzxx : pzxxList)
			{
				String[] dataItem=new String[NZPZXXColumnNames.length];
				dataItem[0]=pzxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(pzxx.getPzsj());
				dataItem[2]=pzxx.getDjbh();
				dataItem[3]=pzxx.getDjlx();
				dataItem[4]=pzxx.getPzy();
				dataItem[5]=DateTimeUtil.formatDateToString(pzxx.getFqsj());
				dataItem[6]=fqlxEnumValues.get(pzxx.getFqlx()).toString();
				dataItem[7]=fxfsEnumValues.get(pzxx.getFxfs()).toString();
				dataItem[8]=pzxx.getFxr();
				dataItem[9]=pzxx.getSl()+"";
				dataItem[10]=pzxx.getBz();
				dataList.add(dataItem);
			}
		}		
		return dataList;
	}
	
	/**
	 * 读取牛只妊检初检信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZRJCJXX() throws Exception
	{
		List<RJCJXX> rjcjxxList=rjcjxxServer.findAll();
		List<String[]> dataList=null;
		if(rjcjxxList!=null)
		{
			//使用枚举常量
			Map<String,BaseEnum> cjjgEnumValues=EnumUtils.getEnum("CJJG");
			Map<String,BaseEnum> cjfsEnumValues=EnumUtils.getEnum("CJFS");
			
			dataList=new LinkedList<String[]>();
			for(RJCJXX rjcjxx : rjcjxxList)
			{
				String[] dataItem=new String[NZRJCJXXColumnNames.length];
				dataItem[0]=rjcjxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(rjcjxx.getCjrq());
				dataItem[2]=cjjgEnumValues.get(rjcjxx.getCjjg()+"").toString(); 
				dataItem[3]=rjcjxx.getCjy();
				dataItem[4]=cjfsEnumValues.get(rjcjxx.getCjfs()+"").toString();
				dataItem[5]=rjcjxx.getBz();		
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只妊检复检信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectRJFJXX() throws Exception
	{
		List<RJFJXX> rjfjxxList=rjfjxxServer.findAll();
		List<String[]> dataList=null;
		if(rjfjxxList!=null)
		{
			//使用枚举常量
			Map<String,BaseEnum> nzxbEnumValues=EnumUtils.getEnum("NZXB");
			
			dataList=new LinkedList<String[]>();
			for(RJFJXX rjfjxx : rjfjxxList)
			{
				String[] dataItem=new String[NZRJFJXXColumnNames.length];
				dataItem[0]=rjfjxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(rjfjxx.getFjrq());
				dataItem[2]=rjfjxx.getFjjg();
				dataItem[3]=rjfjxx.getFjy();
				dataItem[4]=rjfjxx.getTezk();
				dataItem[5]=nzxbEnumValues.get(rjfjxx.getNzxb()+"").toString();
				dataItem[6]=rjfjxx.getBz();
				
				dataList.add(dataItem);
			}			
		}
		return dataList;
	}
	
	/**
	 * 读取牛只干奶信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZGNXX() throws Exception
	{
		List<GNDJXX> gnxxList=gnxxServer.findAll();
		List<String[]> dataList=null;
		if(gnxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(GNDJXX gnxx : gnxxList)
			{
				String[] dataItem=new String[NZGNXXColumnNames.length];
				dataItem[0]=gnxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(gnxx.getGnrq());
				dataItem[2]=gnxx.getGnff();
				dataItem[3]=gnxx.getSyyw();
				dataItem[4]=gnxx.getSy();
				dataItem[5]=gnxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只产犊信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZCDXX() throws Exception
	{		
		List<CDDJXX> cdxxList=cdxxServer.findAll();
		List<String[]> dataList=null;
		if(cdxxList!=null)
		{
			//使用枚举
			Map<String,BaseEnum> cdnycdEnumValues=EnumUtils.getEnum("CDNYCD");
			Map<String,BaseEnum> cdtwEnumValues=EnumUtils.getEnum("CDTW");
			
			dataList=new LinkedList<String[]>();
			for(CDDJXX cdxx : cdxxList)
			{
				String[] dataItem=new String[NZCDXXColumnNames.length];
				dataItem[0]=cdxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(cdxx.getCdsj());
				dataItem[2]=cdxx.getCdlx();
				dataItem[3]=cdnycdEnumValues.get(cdxx.getCdny()).toString();
				dataItem[4]=cdtwEnumValues.get(cdxx.getTw()).toString();
				dataItem[5]=cdxx.getJcy();
				dataItem[6]=cdxx.getTesl()+"";
				dataItem[7]=cdxx.getJbq();
				dataItem[8]=cdxx.getXzr();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只流产信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZLCXX() throws Exception
	{
		List<LCXX> lcxxList=lcxxServer.findAll();
		List<String[]> dataList=null;
		if(lcxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(LCXX lcxx : lcxxList)
			{
				String[] dataItem=new String[NZLCXXColumnNames.length];
				dataItem[0]=lcxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(lcxx.getLcrq());
				dataItem[2]=lcxx.getLcyy();
				dataItem[3]=lcxx.getTelx();
				dataItem[4]=lcxx.getFxr();
				dataItem[5]=lcxx.getFxfs();
				dataItem[6]=lcxx.getHsr();
				dataItem[7]=lcxx.getLczr();
				dataItem[8]=lcxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只个体产奶信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZGTCNXX() throws Exception
	{
		List<GTCNXX> gtcnxxList=gtcnServer.findAll();
		List<String[]> dataList=null;
		if(gtcnxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(GTCNXX gtcnxx : gtcnxxList)
			{
				String[] dataItem=new String[NZGTCNXXColumnNames.length];
				dataItem[0]=gtcnxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(gtcnxx.getJnrq());
				dataItem[2]=gtcnxx.getBc();
				//dataItem[3]=gtcnxx.getCl()+"";
				dataItem[4]=gtcnxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只群体产奶信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZQTCNXX() throws Exception
	{
		return null;
	}
	
	/**
	 * 读取牛只疾病信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZJBXX() throws Exception
	{
		List<JBXX> jbxxList=jbglServer.findAll();
		List<String[]> dataList=null;
		if(jbxxList!=null)
		{
			//使用枚举
			Map<String,BaseEnum> sfEnumValues=EnumUtils.getEnum("SFPZ");
			
			dataList=new LinkedList<String[]>();
			for(JBXX jbxx : jbxxList)
			{
				String[] dataItem=new String[NZJBXXColumnNames.length];
				dataItem[0]=jbxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(jbxx.getFbrq());
				dataItem[2]=jbxx.getJbzl();
				dataItem[3]=jbxx.getJbmc();
				dataItem[4]=jbxx.getZyzz();
				dataItem[5]=jbxx.getFbyy();
				dataItem[6]=jbxx.getYzcd();
				dataItem[7]=jbxx.getCzqk();
				dataItem[8]=sfEnumValues.get(jbxx.getFsqn()+"").toString();
				dataItem[9]=DateTimeUtil.formatDateToString(jbxx.getYyrq());
				dataItem[10]=jbxx.getYflj()+"";
				dataItem[11]=jbxx.getYycs()+"";
				dataItem[12]=DateTimeUtil.formatDateToString(jbxx.getJsxyrq());
				dataItem[13]=jbxx.getSys();
				dataItem[14]=jbxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只免疫信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZMYXX() throws Exception
	{
		List<MYXX> myxxList=myglServer.findAll();
		List<String[]> dataList=null;
		if(myxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(MYXX myxx : myxxList)
			{
				String[] dataItem=new String[NZMYXXColumnNames.length];
				dataItem[0]=myxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(myxx.getMyrq());
				dataItem[2]=myxx.getMyxm();
				dataItem[3]=myxx.getYmmc();
				dataItem[4]=myxx.getSyjl();
				dataItem[5]=myxx.getPh();
				dataItem[6]=myxx.getZzs();
				dataItem[7]=myxx.getJg();
				dataItem[8]=myxx.getSy();
				dataItem[9]=myxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只检疫信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZJYXX() throws Exception
	{
		List<JYXX> jyxxList=jyglServer.findAll();
		List<String[]> dataList=null;
		if(jyxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(JYXX jyxx : jyxxList)
			{
				String[] dataItem=new String[NZJYXXColumnNames.length];
				dataItem[0]=jyxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(jyxx.getJyrq());
				dataItem[2]=jyxx.getJyyl()+"";
				dataItem[3]=jyxx.getJyxm();
				dataItem[4]=jyxx.getYmmc();
				dataItem[5]=jyxx.getJylx();
				dataItem[6]=jyxx.getSyjl();
				dataItem[7]=jyxx.getPh();
				dataItem[8]=jyxx.getZzs();
				dataItem[9]=jyxx.getJg();
				dataItem[10]=jyxx.getSy();
				dataItem[11]=jyxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只驱虫信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZQCXX() throws Exception
	{
		List<QCXX> qcxxList=qcglServer.findAll();
		List<String[]> dataList=null;
		if(qcxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(QCXX qcxx : qcxxList)
			{
				String[] dataItem=new String[NZQCXXColumnNames.length];
				dataItem[0]=qcxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(qcxx.getQcrq());
				dataItem[2]=qcxx.getQcff();
				dataItem[3]=qcxx.getYwmc();
				dataItem[4]=qcxx.getSyjl();
				dataItem[5]=qcxx.getPh();
				dataItem[6]=qcxx.getZzs();
				dataItem[7]=qcxx.getQcxg();
				dataItem[8]=qcxx.getSy();
				dataItem[9]=qcxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取牛只护蹄修蹄信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectNZHTXTXX() throws Exception
	{
		List<HTXTXX> htxtxxList=htxtglServer.findAll();
		List<String[]> dataList=null;
		if(htxtxxList!=null)
		{
			//使用枚举
			Map<String,BaseEnum> sfEnumValues=EnumUtils.getEnum("SFPZ");
			
			dataList=new LinkedList<String[]>();
			for(HTXTXX htxtxx : htxtxxList)
			{
				String[] dataItem=new String[NZHTXTXXColumnNames.length];
				dataItem[0]=htxtxx.getNzjbxx().getNzbh();
				dataItem[1]=DateTimeUtil.formatDateToString(htxtxx.getXtrq());
				dataItem[2]=sfEnumValues.get(htxtxx.getZq()+"").toString();
				dataItem[3]=sfEnumValues.get(htxtxx.getYq()+"").toString();
				dataItem[4]=sfEnumValues.get(htxtxx.getZh()+"").toString();
				dataItem[5]=sfEnumValues.get(htxtxx.getYh()+"").toString();
				dataItem[6]=htxtxx.getSy();
				dataItem[7]=htxtxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
	/**
	 * 读取消毒信息
	 * @retrun 读取的信息 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @throws Exception 
	 */
	public List<String[]> selectXDXX() throws Exception
	{
		List<XDXX> xdxxList=xdglServer.findAll();
		List<String[]> dataList=null;
		if(xdxxList!=null)
		{
			dataList=new LinkedList<String[]>();
			for(XDXX xdxx : xdxxList)
			{
				String[] dataItem=new String[XDXXColumnNames.length];
				dataItem[0]=DateTimeUtil.formatDateToString(xdxx.getXdrq());
				dataItem[1]=xdxx.getXdqy();
				dataItem[2]=xdxx.getYjmc();
				dataItem[3]=xdxx.getSyjl();
				dataItem[4]=xdxx.getPh();
				dataItem[5]=xdxx.getZzs();
				dataItem[6]=xdxx.getSy();
				dataItem[7]=xdxx.getBz();
				dataList.add(dataItem);
			}
		}
		return dataList;
	}
	
}
