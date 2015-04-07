package org.chonger.utils;

import java.io.UnsupportedEncodingException;
import java.util.List;

/**
 * 
 * @author Daniel
 * 
 */
public class StringUtil {
	/**
	 * 字符串是否为空
	 * 
	 * @param string
	 * @return
	 * 
	 * @author Daniel
	 */
	public static boolean IsEmpty(String string) {
		return (string == null || "".equals(string) || "".equals(string.trim()));
	}

	public static boolean IsArrayEmpty(String[] string) {
		for (int i = 0; i < string.length; i++) {
			if (StringUtil.IsEmpty(string[i])) {
				return true;
			}
		}
		return false;
	}

	/**
	 * 判断LIST 集合是否是空
	 * 
	 * @param list
	 * @return
	 */
	public static boolean IsEmpty(List list) {
		if (list != null && list.size() > 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 字符串开始指定长度转换为大写
	 * 
	 * @param value
	 * @param count
	 * @return
	 * 
	 * @author Daniel
	 */
	public static String toUpperCase(String value, int count) {
		if (IsEmpty(value))
			return value;
		else if (count > value.length())
			return value;
		else {
			return value.substring(0, count).toUpperCase()
					+ value.substring(count);
		}
	}

	/**
	 * 将字符串转换为Url编码
	 * 
	 * @param value
	 * @return
	 * 
	 * @author Daniel
	 * 
	 */
	public static String string2Url(String value) {
		if (IsEmpty(value))
			return value;
		return java.net.URLEncoder.encode(java.net.URLEncoder.encode(value));
	}

	public static String firstCharToUpperCase(String value) {
		return value.replaceFirst(value.substring(0, 1), value.substring(0, 1)
				.toUpperCase());
	}
	
	
	public static String string2Url(String value,String coder)
	{
		try {
			return java.net.URLEncoder.encode(value, coder);
		} catch (UnsupportedEncodingException e) {
			return value;
		}
	}
}
