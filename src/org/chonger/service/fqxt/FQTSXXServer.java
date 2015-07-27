package org.chonger.service.fqxt;

import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.fqxt.FQTSXX;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.SessionUtils;
import org.chonger.utils.StringUtil;
import org.h2.util.DateTimeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
*
* @title FQTSXXServer.java 圈舍信息管理业务逻辑
* @package org.chonger.service.fqxt
* @author Daniel
* @create 2015-4-10 
 */
@Service
@Transactional
public class FQTSXXServer {
	
	@Autowired
	private CommonDAO<FQTSXX> dao;
	
	/**
	 * 
	 * @param bh
	 * @retrun String 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public String getQueryString(String bh)
	{
		String sql="from FQTSXX model where 1=1 ";		
		if(!StringUtil.IsEmpty(bh))sql+=" and model.nzjbxx.nzbh like '%"+bh+"%' ";
		
		//2015-05-18	Daniel	修复bug，增加牛只类型条件，状态0为正常牛只
		sql+=" and model.nzjbxx.nzzt = '0'";
		
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			sql+=" and model.ncbh='"+user.getNcjbxx().getXh()+"'";
		}
		
		//Daniel 添加排序
		//sql+=" order by model.sffq";
		
		return sql;
	}
	
	/**
	 * 根据序号id获取信息对象
	 * @param id
	 * @retrun FQTSXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public FQTSXX findEntity(String xh)
	{
		List<FQTSXX> resultList=dao.find(getQueryString(null)+" and model.xh='"+xh+"'");
		if(resultList!=null&&resultList.size()>0)
			return resultList.get(0);
		return null;
	}
	
	public void saveOrUpdate(FQTSXX tsxx)
	{
		if(tsxx!=null)
		{
			if(StringUtil.IsEmpty(tsxx.getXh()))
			{
				tsxx.setXh(CommUUID.getUUID());
				dao.save(tsxx);
			}
			else
			{
				dao.saveOrUpdate(tsxx);
			}	
		}
	}
	
	private Pattern datePattern=Pattern.compile("\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2}");
	/**
	 * 分析消息中的时间
	 * @param msg
	 * @retrun Date 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public Date parseDateByMsg(String msg)
	{
		Matcher matcher = datePattern.matcher(msg);
		if(matcher.find())
		{
			String dateString=matcher.group();
			System.out.println("解析时间："+dateString);
			
			return DateTimeUtil.parseDate2YMDHMS(dateString);
		}
		return null;
	}
	
}
