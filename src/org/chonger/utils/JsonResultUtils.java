package org.chonger.utils;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
/**
 * 在Action的Result中需要使用Json格式的辅助操作
 * 
 * 主要提供一些常用的Json类型数据供Action使用
 * 
 * @author Daniel
 * @create 2014-08-09
 * @version 1.0
 * 
 * @add 2015-04-13	Daniel 1：对该类进行函数扩展
 */
public class JsonResultUtils implements Serializable {
	
	/**
	 * 常用消息Key:error
	 */
	public static final String ERROR="error";
	/**
	 * 常用消息Key:msg
	 */
	public static final String MESSAGE="msg";
	/**
	 * 执行OK的常用值
	 */
	public static final String OKVALUE=0+"";
	/**
	 * 执行Error的常用值
	 */
	public static final String ERRORVALUE=1+"";
	
	/**json格式的简单消息。{"error":0,"message","消息内容"}*/
	private Map<String,String> infos;
	public void setInfos(Map<String, String> infos) {
		this.infos = infos;
	}
	public Map<String, String> getInfos() {
		return infos;
	}
	
	/**
	 * 消息集合初始化或者清空
	 */
	public void infosInitOrClear()
	{
		if(infos==null)
			infos=new LinkedHashMap<String,String>();
		else
			infos.clear();
	}
	
	/**json简单的数组数据。[{},{},{}]*/
	private List<Object> objList;
	public List<Object> getObjList() {
		return objList;
	}
	public void setObjList(List<Object> objList) {
		this.objList = objList;
	}
	
	/**
	 * 数据集合初始化或者清空
	 */
	public void objListInitOrClear()
	{
		if(objList==null)
			objList=new LinkedList<Object>();
		else
			objList.clear();
	}
	
	/**json单个对象数据。*/
	private Object object;
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
	
	//Add  2015-04-13	Daniel 扩展函数引用
	/**
	 * 回复成功消息，参数msg可以为空
	 */
	public void sendSuccessMessage(String msg)
	{
		this.infosInitOrClear();
		this.getInfos().put(ERROR,OKVALUE);
		if(!StringUtil.IsEmpty(msg))
			this.getInfos().put(MESSAGE,msg);
	}
	/**
	 * 回复失败消息，参数msg可以为空
	 */
	public void sendErrorMessage(String msg)
	{
		this.infosInitOrClear();
		this.getInfos().put(ERROR,ERRORVALUE);
		if(!StringUtil.IsEmpty(msg))
			this.getInfos().put(MESSAGE,msg);
	}
}
