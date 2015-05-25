package org.chonger.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtil {
	public static final String YMD = "yyyy-MM-dd";
	public static final String YMDHMS = "yyyy-MM-dd hh:mm:ss";//@2014-03-06 add Daniel
	public static SimpleDateFormat sdfYMDHMS;
	
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
	 * 默认格式化为yyyy-MM-dd
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
	 */
	public static int getMonth(Date beginDate,Date endDate)
	{
		if(beginDate!=null&&endDate!=null)
		{
			int bcount=beginDate.getYear()*12+beginDate.getMonth();
			int ecount=endDate.getYear()*12+endDate.getMonth();
			
			return Math.abs(ecount-bcount);
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
	
}
