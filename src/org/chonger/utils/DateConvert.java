package org.chonger.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.conversion.impl.DefaultTypeConverter;

/**
 * 修复日期转换，保证可以被正确转换
 * @ClassName: DateConvert
 * @Description: TODO
 * @author Daniel
 * @date Apr 18, 2016 4:05:02 PM
 *
 */
public class DateConvert extends DefaultTypeConverter {
	private static final DateFormat[] ACCEPT_DATE_FORMATS = {
			new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
			new SimpleDateFormat("dd/MM/yyyy"),   
			new SimpleDateFormat("yyyy-MM-dd"),   
			new SimpleDateFormat("yyyy/MM/dd")
			};  //支持转换的日期格式  

	@Override
	public Object convertValue(Map<String, Object> context, Object value, Class toType) {
		
		if (toType == Date.class) {
			Date date = null;
			String dateString = null;
			
			String[] params = (String[])value;
			dateString = params[0]; //获取日期的字符串
			
			for (DateFormat format : ACCEPT_DATE_FORMATS) {   
				try {   
					return format.parse(dateString); //遍历日期支持格式，进行转换   
				} catch(Exception e) {   
					continue;   
				}   
			}   
			return null;   
		}else if (toType == String.class) {   //服务器向浏览器输出时，进行Date to String的类型转换   
			Date date = (Date)value;   
			return new SimpleDateFormat("yyyy-MM-dd").format(date); //输出的格式是yyyy-MM-dd   
		}   
		return null;
	}

	
	
}
