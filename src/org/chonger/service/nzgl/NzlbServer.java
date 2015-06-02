package org.chonger.service.nzgl;

import java.util.Date;

import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.common.ConstantEnum.NZLBZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLBXX;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 关于牛只类别的计算类
 * @author Daniel
 * @date Jun 1, 2015 4:32:31 PM
 * @version V1.0
 *
 */
@Service
@Transactional
public class NzlbServer {
	
	public static final int beginday=2;//默认提前两天发送
	
	@Autowired
	private NzxxServer nzServer;
	
	@Autowired
	private CommonDAO<NZLBXX> dao;
	
	
	public void saveOrUpdate(NZLBXX lbxx,NZJBXX nzxx)
	{
		if(StringUtil.IsEmpty(lbxx.getXh()))
		{
			lbxx.setXh(nzxx.getXh());
			dao.save(lbxx);
		}
		else
		{
			dao.saveOrUpdate(lbxx);
		}
	}
	
	//新增牛只，更新牛只信息的时候，计算月龄，如果时间大于了18月该如何处理？等待其他信息录入？按照月龄等待发情信息、、、
	
	//检查月龄适合的牛只的发情信息是否合理？计算配种时间，比对是否提示
	//新增发情信息，发情信息针对的牛只，按照时间计算 配种时间 和提示
	
	//新增配种信息后，更新牛只状态为妊娠前期，开始更新天数信息。
	//
	
	/**
	 * 计算牛只类别
	 */
	public void setNzlb(NZJBXX nzxx)
	{
		String lb=nzxx.getLb();		
		NZLBXX lbxx=nzxx.getNzlbxx();//获取牛只的状态信息
		
		//判断牛只的状态
		if("0".equals(lb))//哺乳犊牛，0-3个月龄。提前2天提示断奶
		{
			//判断当前时间+上2天是否是断奶时间？
			Date dnDate=DateTimeUtil.addDate(nzxx.getCsrq(),0,3,-2);
			if(new Date().getTime()>=dnDate.getTime())//当前时间小于断奶时间
			{
				//提示该断奶了
			}			
			
			//检查月龄是否满3个月
			int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
			
			if(yl>=4)
			{
				//更新牛只类别
				nzxx.setLb(NZLB.断奶犊牛.getValue()+"");
				nzServer.saveOrUpdate(nzxx);
			}			
		}
		else if("1".equals(lb))//断奶犊牛，3-6个月龄。
		{
			//检查月龄是否满6个月
			int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
			if(yl>=6)
			{
				//更新牛只类别
				nzxx.setLb(NZLB.小育成牛.getValue()+"");
				nzServer.saveOrUpdate(nzxx);
			}			
		}
		else if("2".equals(lb))//小育成牛,6-12个月龄。
		{
			//检查月龄是否满12个月
			int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
			if(yl>=12)
			{
				//更新牛只类别
				nzxx.setLb(NZLB.大育成牛.getValue()+"");
				nzServer.saveOrUpdate(nzxx);
			}	
		}
		else if("3".equals(lb))//大青年牛,12-18个月龄。
		{
			//检查是否超过15月龄
			//体重达到370Kg,身高130cm
			//是否有发情登记信息？发情信息时间大于15个月龄时间  发情登记信息需要变更牛只的列别状态表，设置为已发情，并记录时间
			
			//获取大青年牛的月龄
			int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
			if(yl>15)
			{
				
				if(lbxx!=null)//状态不是空，为空表示未进行发情登记
				{
					if(lbxx.getLb()==NZLBZT.发情期.getValue())
					{
						//该牛只处于发情状态
						//提示需要配种信息
					}
					else if(lbxx.getLb()==NZLBZT.已配种.getValue())//已配种，记录配种的天数，提示初检
					{
						//计算配种的天数
						int count=lbxx.getDay();
						lbxx.setDay(count++);
						
						//判断天数是否达到提示天数
						if(count>=26)
						{
							//提示初检信息
							
						}
						
						saveOrUpdate(lbxx, nzxx);
					}
					
				}
			}
			
			//牛只的类别信息为发情状态，记录时间
			//是否配种状态，配种多少天，配种时间，开始记录天数，每次配种操作都会更新牛只的类别状态
			//如果是配种，并且26+2天进行初检提示(抽血测试)
			//如果是配种，并且38+2天进行摸卵泡初检
			
			//初检登记，会更新牛只的类别状态为青年牛，进入妊娠期，更新牛只的类别信息为妊娠，记录最后配种时间(不用变更时间)，并计算天数，依据平均280天计算产期
		}
		else if("4".equals(lb))
		{
			//牛只为妊娠期，依据计算的天数进行前、后期判断。最后一次配种时间开始计算
			//自动更新妊娠后期
			
			
		}
		else if("5".equals(lb))//妊娠后期
		{
			//
			//干奶期，产前60天进行干奶操作
			//计算产期，围产期
			
			//产犊登记会更新牛只的类别状态信息为泌乳期，同时开始计算泌乳天数
		}
		else if("6".equals(lb))//泌乳期天数
		{
			//280~320
		}
		//
		
	}
	
}
