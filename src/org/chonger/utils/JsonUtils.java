package org.chonger.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

/**
 * 主要用来生成简单的json对象
 * 解决低版本浏览器接收json字符串
 * @author Daniel
 *
 */
public class JsonUtils {

	public static String sendJson(String jsonstr) throws IOException
	{
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");//modify Daniel 1：修改返回类型为json，方便前端解析
		PrintWriter out = response.getWriter();
		out.println(jsonstr);  
		out.flush();  
		out.close();
		return null;
	}
	
	public static String sendJson(Map<String, Object> infos) throws IOException
	{
		if(infos!=null)
		{
			StringBuffer sbuffer=new StringBuffer();
			sbuffer.append("{");
			for(String key : infos.keySet())
			{
				sbuffer.append("\"").append(key).append("\":").append("\"").append(infos.get(key)).append("\",");
			}
			sbuffer.deleteCharAt(sbuffer.length()-1);
			sbuffer.append("}");
			System.out.println("Test Send:"+sbuffer.toString());
			sendJson(sbuffer.toString());
		}
		
		return null;
	}
	
//	public static String sendJson(Map<String,String> infos) throws IOException
//	{
//		StringBuilder strBuilder=null;
//		if(infos!=null&&infos.size()>0)
//		{
//			strBuilder=new StringBuilder("{");
//			for(String key : infos.keySet())
//				strBuilder.append("\"").append(key).append("\"=")
//		}
//	}
}
