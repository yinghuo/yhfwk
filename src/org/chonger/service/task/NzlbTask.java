package org.chonger.service.task;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum;
import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.common.ConstantEnum.NZLBZT;
import org.chonger.dao.CommonDAO;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZLBXX;
import org.chonger.service.nzgl.NzlbServer;
import org.chonger.utils.DateTimeUtil;
import org.chonger.utils.StringUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public class NzlbTask extends QuartzJobBean {
	
	private SessionFactory sessionFactory;	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		session=sessionFactory.openSession();
	}

	public void run() {
		/*
		 * 1:获取指定类型的牛只信息，
		 *     获取大育成牛信息，判断月龄是否在15-18个月，发出可配种信息，牛只状态更新为可配种
		 *     牛只登记配种信息，变更牛只状态为已配种，开始记录天数，28天左右发出初检提示，配种后60天提示复检
		 *     
		 *     确认怀孕后牛只类型变更为妊娠期，开始记录天数，平均280天。确认怀孕，最后一次配种时间开始计算
		 *     
		 *     
		 *     
		 *     
		 *     空杯牛
		 *     
		 *     干奶期
		 *     
		 *     
		 * 
		 * 
		 */

	}
	
	private Session session;
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		//调用牛只查询服务
		String hql="from NZJBXX model where model.nzzt = '0'";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			List<NZJBXX> nzjbxx=query.list();
			
			System.out.println("牛只个数："+nzjbxx.size());
			
			if(nzjbxx!=null&&nzjbxx.size()>0)
			{
				for(NZJBXX nzxx : nzjbxx)
					updateNzxx(nzxx);
			}
			
		}
	}
	
	
	//新增牛只，更新牛只信息的时候，计算月龄，如果时间大于了18月该如何处理？等待其他信息录入？按照月龄等待发情信息、、、
	
	//检查月龄适合的牛只的发情信息是否合理？计算配种时间，比对是否提示
	//新增发情信息，发情信息针对的牛只，按照时间计算 配种时间 和提示
	
	//新增配种信息后，更新牛只状态为妊娠前期，开始更新天数信息。
	//
	
	//2015-06-26
	//牛只分为 牛只类别 牛只繁殖状态 牛只泌乳状态
	//在牛只成长阶段使用牛只类别进行判断
	//牛只繁殖状态  发情期、妊娠前期、空怀期、围产前期、围产后期
	//牛只泌乳状态  泌乳盛期、中期、后期、干奶期
	
	/**
	 * 更新牛只信息
	 * @param nzxx
	 * @retrun void 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	private void updateNzxx(NZJBXX nzxx)
	{
		String lb=nzxx.getLb();		
		NZLBXX lbxx=nzxx.getNzlbxx();//获取牛只的状态信息
		
		if(lbxx==null)return;
		
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
				//数据库更新牛只信息
				session.saveOrUpdate(nzxx);
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
				session.saveOrUpdate(nzxx);
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
				session.saveOrUpdate(nzxx);
			}	
		}
		else if("3".equals(lb))//大青年牛,12-18个月龄。
		{
			//检查是否超过15月龄
			//体重达到370Kg,身高130cm
			//是否有发情登记信息？发情信息时间大于15个月龄时间  发情登记信息需要变更牛只的列别状态表，设置为已发情，并记录时间
			
			//获取大青年牛的月龄   //TODO 无需判断月龄
			int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
			if(yl>15)
			{
				
				if(lbxx!=null)//状态不是空，为空表示未进行发情登记
				{
					if(lbxx.getLb()==NZLBZT.发情期.getValue())
					{
						//该牛只处于发情状态
						//提示需要配种信息
						//TODO 提示消息
					}
					else if(lbxx.getLb()==NZLBZT.已配种.getValue())//已配种，记录配种的天数，提示初检
					{
						//计算配种的天数
						int count=lbxx.getDay();
						lbxx.setDay(count++);
						nzlbSaveOrUpdate(lbxx, nzxx.getXh());
						
						//判断天数是否达到提示天数
						if(count>=26)
						{
							//提示初检信息
							//TODO 提示消息
						}						
					}
					
				}
			}
			
			//牛只的类别信息为发情状态，记录时间
			//是否配种状态，配种多少天，配种时间，开始记录天数，每次配种操作都会更新牛只的类别状态
			//如果是配种，并且26+2天进行初检提示(抽血测试)
			//如果是配种，并且38+2天进行摸卵泡初检
			
			//初检登记，会更新牛只的类别状态为青年牛，进入妊娠期，更新牛只的类别信息为妊娠，记录最后配种时间(不用变更时间)，并计算天数，依据平均280天计算产期
		}
		//else if("4".equals(lb))//不应检测牛只的类型，应该检测牛只的状态
		else if(lbxx.getLb()==NZLBZT.妊娠前期.getValue())
		{
			//牛只为妊娠期，依据计算的天数进行前、后期判断。最后一次配种时间开始计算
			//自动更新妊娠后期
			if(lbxx!=null)//状态不是空，更新妊娠天数
			{
				//计算配种的天数
				int count=lbxx.getDay();
				lbxx.setDay(count++);
				nzlbSaveOrUpdate(lbxx, nzxx.getXh());
				
				//60天后提示复检
				if(count==60)
				{
					//TODO 提示信息
					
				}
				
			}
			else//新建状态
			{
				//如果类型数据缺失？
				
			}
			
			//判断月数，满6个月为后期
			int yl=DateTimeUtil.getMonth(lbxx.getSj(),new Date());
			if(yl>6)
			{
				//更新为后期
				nzxx.setLb(ConstantEnum.NZLB.妊娠后期青年母牛.getValue()+"");
				session.saveOrUpdate(nzxx);
			}			
		}
		//else if("5".equals(lb))//妊娠后期
		else if(lbxx.getLb()==NZLBZT.妊娠后期.getValue())
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
	
	public void nzlbSaveOrUpdate(NZLBXX lbxx,String nzxxId)
	{
		if(StringUtil.IsEmpty(lbxx.getXh()))
		{
			lbxx.setXh(nzxxId);
			session.save(lbxx);
		}
		else
		{
			session.saveOrUpdate(lbxx);
		}
	}
	
	
}
