package org.chonger.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateTimeUtil {
	public static final String YMD = "yyyy-MM-dd";
	public static final String YMDHMS = "yyyy-MM-dd hh:mm:ss";//@2014-03-06 add Daniel
	public static SimpleDateFormat sdfYMDHMS;
	public static SimpleDateFormat sdfYMD=new SimpleDateFormat(YMD);  
	
	public static int timeCompare(Date t1, Date t2) {
		return t1.compareTo(t2);
	}

	public static int compareCurrent(Date t1) {
		Date currentTime = DateTimeUtil.parseDate(DateTimeUtil.crrentTime(YMD),
				YMD);
		return t1.compareTo(currentTime);
	}

	public static String formatDateToString(Date t1, String df) {
		SimpleDateFormat sdf=new SimpleDateFormat(df);
		return sdf.format(t1);
	}
	/**
	 * 默认格式化为yyyy-MM-dd hh:mm:ss
	 * @author Daniel
	 * @param t1 要格式化的时间
	 * @return
	 */
	public static String formatDateToString(Date t1)
	{
		if(t1==null)return null;
		if(sdfYMDHMS==null)
			sdfYMDHMS=new SimpleDateFormat(YMDHMS);
		return sdfYMDHMS.format(t1);
	}
	
	public static Date parseDate2YMDHMS(String date)
	{
		if(sdfYMDHMS==null)
			sdfYMDHMS=new SimpleDateFormat(YMDHMS);
		try {
			return sdfYMDHMS.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public static Date parseDate(String t1, String df) {
		SimpleDateFormat sdf = new SimpleDateFormat(df);
		try {
			return sdf.parse(t1);
		} catch (ParseException e) {
			e.printStackTrace();
			return null;
		}

	}

	public static String crrentTime(String df) {
		Date currentTime = new Date();
		if (df == null) {
			df = YMD;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(df);
		return sdf.format(currentTime);
	}
	
	/**
	 * 获取两个日期之间的相差月数
	 * @param beginDate
	 * @param endDate
	 * @retrun int 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 * @modify 修改月之间的满月计算
	 */
	public static int getMonth(Date beginDate,Date endDate)
	{
		if(beginDate!=null&&endDate!=null)
		{
			int bcount=beginDate.getYear()*12+beginDate.getMonth();
			int ecount=endDate.getYear()*12+endDate.getMonth();
			
			int month=Math.abs(ecount-bcount);
			//添加满月判断，如果结束的日期>开始的天数，表示已经满月进入下一个月份
			if(endDate.getDate()>beginDate.getDate())
				month++;
			
			return month;
		}
		return -1;
	}
	
	/**
	 * 获取指定日期和当前日期的相差月数
	 * @param beginDate
	 * @retrun int 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public static int getMonthNow(Date beginDate)
	{
		return getMonth(beginDate,new Date());
	}
	
	/**
	 * 获取两个日期之间的相差天数（从0点开始计算）
	 * @param beginDate
	 * @param endDate
	 * @retrun int 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public static int getDayBetween(Date beginDate,Date endDate)
	{
		try {
			beginDate=sdfYMD.parse(sdfYMD.format(beginDate));
			endDate=sdfYMD.parse(sdfYMD.format(endDate)); 
			Calendar cal = Calendar.getInstance();    
			cal.setTime(beginDate);    
			long time1 = cal.getTimeInMillis();                 
			cal.setTime(endDate);    
			long time2 = cal.getTimeInMillis();         
			long between_days=(time2-time1)/(1000*3600*24);  
			         
			return Integer.parseInt(String.valueOf(between_days));       

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public static int getDayBetweenHms(Date beginDate,Date endDate)
	{
		try {
			if(sdfYMDHMS==null)sdfYMDHMS=new SimpleDateFormat(YMDHMS);
			
			beginDate=sdfYMDHMS.parse(sdfYMD.format(beginDate));
			endDate=sdfYMDHMS.parse(sdfYMD.format(endDate)); 
			Calendar cal = Calendar.getInstance();    
			cal.setTime(beginDate);    
			long time1 = cal.getTimeInMillis();                 
			cal.setTime(endDate);    
			long time2 = cal.getTimeInMillis();         
			long between_days=(time2-time1)/(1000*3600*24);  
			         
			return Integer.parseInt(String.valueOf(between_days));       

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	/**
	 * 
	 * @param date
	 * @param y
	 * @param m
	 * @param d
	 * @retrun Date 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public static Date addDate(Date date,int y,int m,int d)
	{
		Calendar cal = Calendar.getInstance();    
		cal.setTime(date);
		cal.add(Calendar.YEAR,y);
		cal.add(Calendar.MONTH,m);
		cal.add(Calendar.DAY_OF_MONTH,d);
		return cal.getTime();
	}
	
	/**
	 * 
	 * @param date
	 * @param y
	 * @param m
	 * @param d
	 * @param h
	 * @param mi
	 * @param s
	 * @retrun Date 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public static Date addDate(Date date,int y,int m,int d,int h,int mi,int s)
	{
		Calendar cal = Calendar.getInstance();    
		cal.setTime(date);
		cal.add(Calendar.YEAR,y);
		cal.add(Calendar.MONTH,m);
		cal.add(Calendar.DAY_OF_MONTH,d);
		cal.add(Calendar.HOUR_OF_DAY,h);
		cal.add(Calendar.MINUTE,mi);
		cal.add(Calendar.SECOND,s);
		return cal.getTime();
	}
	
	public static void main(String[] args)
	{
		Date date=DateTimeUtil.parseDate2YMDHMS("2014-09-02 10:23:34");
		
		//Date dateDone=DateTimeUtil.addDate(date, 0,3, 0);
		
		//System.out.println(DateTimeUtil.formatDateToString(dateDone));
		
		//月计算
		//Date datend=DateTimeUtil.parseDate2YMDHMS("2015-01-15 14:23:27");
		Date datend=DateTimeUtil.parseDate2YMDHMS("2014-09-02 14:23:27");
		
		//int m=DateTimeUtil.getMonth(date, datend);
		
		//System.out.println("月："+m);
		
		System.out.println(DateTimeUtil.getDayBetween(date, datend));
		
	}
	
}
