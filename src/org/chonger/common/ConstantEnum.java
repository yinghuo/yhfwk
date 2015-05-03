package org.chonger.common;

import info.yinghuo.enums.BaseEnum;

/**
 * 枚举常量
 * @ClassName: ConstantEnum
 * @Description: 
 * @author Daniel
 * @date May 2, 2015 11:25:55 AM
 * @version V1.0
 *
 */
public class ConstantEnum {
	
	//================================
	//  注意：如果这里对常量的值进行更新，请同时更新数据库表中的对应值
	//================================
	
	//如果需要使用枚举常量，可以在这里进行声明定义。
	
	
	
	/**
	 * 定义牛只的入群类型常量
	 */
	public static enum NZRQLX implements BaseEnum<Integer>{
		
		自繁(0),购买(1);
		
		private int value;
		NZRQLX(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义牛只的类别常量
	 */
	public static enum NZLB implements BaseEnum<Integer>{
		
		哺乳犊牛(0),
		断奶犊牛(1),
		育成牛(2),
		青年牛(3),
		泌乳牛(4),
		干奶牛(5),
		留养公牛(6);
		
		private int value;
		NZLB(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义牛只的性别常量
	 */
	public static enum NZXB implements BaseEnum<Integer>{
		
		母(0),公(1);
		
		private int value;
		NZXB(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	
}
