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
	 * 定义牛只离场登记的离群原因
	 */
	public static enum LCDJYY implements BaseEnum<Integer>{
		出售(0),死亡(1),乳腺疾病(2),肢蹄疾病(3),生殖疾病(4);
		private int value;
		LCDJYY(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义牛只离场登记的离群类型
	 */
	public static enum LCDJLX implements BaseEnum<Integer>{
		出售(0),淘汰(1),死亡(2);
		
		private int value;
		LCDJLX(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义产犊登记的产犊胎位常量
	 */
	public static enum CDTW implements BaseEnum<Integer>{
		
		正常(0),坐生(1),倒产(2),人工矫正(3),其他(4);
		
		private int value;
		CDTW(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义产犊登记的产犊难易程度常量
	 */
	public static enum CDNYCD implements BaseEnum<Integer>{
		
		自产(0),轻度助产(1),难产产道正常(2),难产产道拉伤(3),碎胎(4),其他(5);
		
		private int value;
		CDNYCD(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义妊检登记的检查类型常量
	 */
	public static enum RJJCLX implements BaseEnum<Integer>{
		
		初检(0),复检(1),其他(2);
		
		private int value;
		RJJCLX(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义发情登记的是否配种常量
	 */
	public static enum SFPZ implements BaseEnum<Integer>{
		
		未配(0),已配(1);
		
		private int value;
		SFPZ(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义发情登记的发现类型常量
	 */
	public static enum FXFS implements BaseEnum<Integer>{
		
		人工(0),计步器(1);
		
		private int value;
		FXFS(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义发情登记的发情类型常量
	 */
	public static enum FQLX implements BaseEnum<Integer>{
		
		自然发情(0),人工催情(1);
		
		private int value;
		FQLX(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
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
		小育成牛(2),
		大育成牛(3),
		妊娠前期青年母牛(4),
		妊娠后期青年母牛(5),
		成年母牛(6),
		留养公牛(7);
		
		private int value;
		NZLB(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	/*
	 * 哺乳犊牛、断奶犊牛，小育成牛、大育成牛，妊娠前期青年母牛，妊娠后期青年母牛，妊娠前期成年母牛，妊娠后期成年母牛，留养公牛，这是类别
空怀牛，干奶牛，泌乳牛，这是状态，查询、显示需要   分娩期
	 * 
	 * */
	/**
	 * 定义牛只的类别状态常量
	 */
	public static enum NZLBZT implements BaseEnum<Integer>{
		
		发情期(0),
		已配种(1),//无效
		已初检(2),//无效 //已初检|妊娠前期  已初检|空杯期
		已复检(3),//无效
		
		空杯期(4),
		
		//流产
		
		干奶期(5),//216天
		
		妊娠前期(6),
		妊娠后期(7),
		
		围产期(8),//产前21天 前期、产犊后围产后期 15天
		
		//泌乳盛期 到产牛后100天 
		//泌乳中期 101-200
		//泌乳后期 201 
		
		//216进入干奶期
		
		//干奶期60天 
		
		
		泌乳期(9);
		//分娩期(10);
		
		private int value;
		NZLBZT(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	
	
	/**
	 * 定义牛只的状态常量
	 */
	public static enum NZZT implements BaseEnum<Integer>{
		
		正常(0),离场(1);
		
		private int value;
		NZZT(int value){this.value=value;}
		
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
	
	/**
	 * 定义牛只妊娠初检结果
	 */
	public static enum CJJG implements BaseEnum<Integer>{
		
		已孕(0),未孕(1),待查(9);
		
		private int value;
		CJJG(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
	
	/**
	 * 定义牛只妊娠初检方式
	 */
	public static enum CJFS implements BaseEnum<Integer>{
		
		直肠(0),孕酮(1),超声(2),其他(9);
		
		private int value;
		CJFS(int value){this.value=value;}
		
		@Override
		public Integer getValue() {	return value;}
	}
}
