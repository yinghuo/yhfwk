package org.chonger.service.task;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum.NZFZZT;
import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.common.ConstantEnum.NZMRZT;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.nqgl.NZFZZTXX;
import org.chonger.entity.nqgl.NZJBXX;
import org.chonger.entity.nqgl.NZMRZTXX;
import org.chonger.utils.DateTimeUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
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
		//session=sessionFactory.openSession();
		session=SessionFactoryUtils.getSession(sessionFactory, true);
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
	
	public void test() throws JobExecutionException{
		executeInternal(null);
	}
	
	private Session session;
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		//调用牛只查询服务
		String hql="from NZJBXX model where model.nzzt = '0'";
		
		if(sessionFactory!=null)
		{
			try
			{
				Query query=session.createQuery(hql);
				List<NZJBXX> nzjbxx=query.list();
				
				System.out.println("牛只个数："+nzjbxx.size());
				
				if(nzjbxx!=null&&nzjbxx.size()>0)
				{
					for(NZJBXX nzxx : nzjbxx)
					{
						try
						{
							updateNzxx(nzxx);
						}catch(Exception ex)
						{
							ex.printStackTrace();
							System.out.println("继续处理牛只!");
						}
					}
				}
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}finally{
				if(session!=null)
					SessionFactoryUtils.releaseSession(session, sessionFactory);
			}
			
		}
	}
	
	/**
	 * 根据ID获取发情信息
	 * @param id
	 * @retrun FQDJXX 
	 * @throws 
	 * @author Daniel
	 * @version V1.0
	 */
	public FQDJXX getFqxxById(String id)
	{
		String hql="from FQDJXX model where model.xh = '"+id+"'";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			List<FQDJXX> fqxx=query.list();
			
			if(fqxx!=null&&fqxx.size()>0)
				return fqxx.get(0);
			
		}
		return null;
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
		System.out.println("处理牛只信息："+nzxx.getNzbh());
		String lb=nzxx.getLb();
		System.out.println("  牛只类别："+lb);
		//NZLBXX lbxx=nzxx.getNzlbxx();//获取牛只的状态信息
		NZFZZTXX fzzt=nzxx.getNzfzzt();//牛只的繁殖状态信息
		NZMRZTXX mrzt=nzxx.getNzmrzt();//牛只的泌乳状态信息
		
		//如果牛只是成长状态
		if(lb.equals("0")||lb.equals("1")||lb.equals("2")||lb.equals("3"))
		{
			if(lb.equals("0"))//哺乳犊牛
			{
				System.out.print("  牛只为哺乳牛：");
				Date dnDate=DateTimeUtil.addDate(nzxx.getCsrq(),0,3,-2);
				if(new Date().getTime()>=dnDate.getTime())//当前时间小于断奶时间
				{
					//提示该断奶了
				}
				
				//检查月龄是否满3个月
				int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
				System.out.print("  ，月龄："+yl+"\n");
				if(yl>=4)
				{
					//更新牛只类别
					nzxx.setLb(NZLB.断奶犊牛.getValue()+"");
				}
				
			}
			else if(lb.equals("1"))//断奶犊牛
			{
				System.out.print("  \n牛只为断奶牛：");
				//检查月龄是否满6个月
				int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
				System.out.print("  ，月龄："+yl+"\n");
				if(yl>=6)
				{
					//更新牛只类别
					nzxx.setLb(NZLB.小育成牛.getValue()+"");
				}
			}
			else if(lb.equals("2"))//小育成牛
			{
				System.out.print("  \n牛只为小育成牛：");
				//检查月龄是否满12个月
				int yl=DateTimeUtil.getMonthNow(nzxx.getCsrq());
				System.out.print("  ，月龄："+yl+"\n");
				if(yl>=12)
				{
					//更新牛只类别
					nzxx.setLb(NZLB.大育成牛.getValue()+"");
				}
			}
			else if(lb.equals("3"))//大育成牛
			{
				System.out.print("  \n牛只为大育成牛：\n");
				//检查是否超过15月龄
				//体重达到370Kg,身高130cm
			}
			session.saveOrUpdate(nzxx);
			session.flush();
			
			return;//无需计算天数
		}
		
		//如果牛只是繁殖状态
		if(fzzt!=null&&fzzt.getZt()>-1)
		{	
			System.out.println("  牛只有繁殖状态："+fzzt.getZt());
			//fzzt.setDay(fzzt.getDay()+1);//天数增加1天
			int allDay=DateTimeUtil.getDayBetween(fzzt.getSj(),new Date());//Daniel 修改天数计算
			fzzt.setDay(allDay);
			
			//判断牛只的繁殖状态
			if(fzzt.getZt()==NZFZZT.发情期.getValue())
			{
				
				System.out.print("  牛只处于发情期：");
				//判断牛只是否配种，当前数据状态tid为发情信息编号
				//@modify 2015-12-21 修复计算bug，当发情信息登记后将会更新为配种信息ID
				//优先判断当前是否配种：bj=0未配种 1已配种
				if(fzzt.getBj()==0)//未配种
				{
					
				}
				else if(fzzt.getBj()==1)//已配种
				{
					int countDay=fzzt.getDay();
					//Daniel添加日期总数，当前日期减去配种日期
					//countDay=
					System.out.println("  已配天数："+countDay);
					if(countDay>26&&fzzt.getBj()!=1)//到初检时间，未初检
					{
						//提示初检信息
						//TODO 提示消息
					}
				}
				
//				FQDJXX fqxx=getFqxxById(fzzt.getTid());
//				if(fqxx!=null)
//				{
//					System.out.print("  发情ID："+fqxx.getXh()+",配种："+fqxx.getSfpz());
//					//判断发情信息是否显示已配种
//					if(fqxx.getSfpz()==SFPZ.未配.getValue())
//					{
//						//提示配种信息
//					}
//					else//已配
//					{
//						
//						
//					}
//				}
				
				
			}
			else if(fzzt.getZt()==NZFZZT.妊娠前期.getValue())
			{
				System.out.print("  牛只处于妊娠前期：");
				//60天提示复检
				int countDay=fzzt.getDay();		
				//countDay=DateTimeUtil.getDayBetween(fzzt.getSj(),new Date());
				System.out.println("妊娠前期天数："+countDay);
				if(countDay>26&&fzzt.getBj()!=2)//到复检时间，未复检
				{
					//TODO 提示消息
				}
				
				//状态更新
				int yl=DateTimeUtil.getMonth(fzzt.getSj(),new Date());
				System.out.println("妊娠前期月龄："+yl);
				if(yl>6)
				{
					System.out.println("牛只状态变更：");
					//更新为后期
					fzzt.setZt(NZFZZT.妊娠后期.getValue());
//					session.saveOrUpdate(fzzt);
//					session.flush();
				}
			}
			else if(fzzt.getZt()==NZFZZT.妊娠后期.getValue())
			{
				System.out.println("  牛只处于妊娠后期：");
				
				//产前21天进入围产前期
				//计算当前状态的预产期的天数
				Date dnDate=DateTimeUtil.addDate(fzzt.getTssj(),0,0,-21);
				if(new Date().getTime()>=dnDate.getTime())//当前时间小于断奶时间
				{
					//进入围产期
					fzzt.setZt(NZFZZT.围产前期.getValue());
//					session.saveOrUpdate(fzzt);
//					session.flush();
					//提示围产期消息
				}
			}
			else if(fzzt.getZt()==NZFZZT.围产前期.getValue())
			{
				System.out.println("  牛只处于围产前期：");
				//产前5天左右提示
			}
			else if(fzzt.getZt()==NZFZZT.围产后期.getValue())
			{
				System.out.println("  牛只处于围产后期：");
				//围产后期15天
				int countDay=fzzt.getDay();//产犊后day更新
				if(countDay>15)
				{
					//进入泌乳期
					fzzt.setZt(NZFZZT.泌乳期.getValue());
//					session.saveOrUpdate(fzzt);
//					session.flush();
				}
			}
			else if(fzzt.getZt()==NZFZZT.空怀期.getValue())
			{
				
			}
			else if(fzzt.getZt()==NZFZZT.流产.getValue())
			{
				
			}
			
			//统一更新
			session.saveOrUpdate(fzzt);
			session.flush();
		}
		
		//计算泌乳信息
		if(mrzt!=null&&mrzt.getZt()>-1)
		{
//			mrzt.setDay(mrzt.getDay()+1);
			int allCount=DateTimeUtil.getDayBetween(mrzt.getSj(),new Date());
			mrzt.setDay(allCount);
			System.out.println("牛只["+nzxx.getNzbh()+"]泌乳状态天数："+allCount);
			
			if(mrzt.getZt()==NZMRZT.泌乳盛期.getValue())
			{
				//nzxx.setMrzt(nzxx.getMrzt()+1);
				session.saveOrUpdate(nzxx);
				session.flush();
				
				//大于100天为中期
				//int countDay=fzzt.getDay();
				//countDay=DateTimeUtil.getDayBetween(fzzt.getSj(),new Date());
				//mrzt.setDay(countDay);
				if(allCount>100)
				{
					mrzt.setZt(NZMRZT.泌乳中期.getValue());
//					session.saveOrUpdate(mrzt);
//					session.flush();
				}
				
			}
			else if(mrzt.getZt()==NZMRZT.泌乳中期.getValue())
			{
				//nzxx.setMrzt(nzxx.getMrzt()+1);
				session.saveOrUpdate(nzxx);
				session.flush();
				
				//大于200天为中期
				//int countDay=fzzt.getDay();
				//countDay=DateTimeUtil.getDayBetween(fzzt.getSj(),new Date());
				//mrzt.setDay(countDay);
				if(allCount>200)
				{
					mrzt.setZt(NZMRZT.泌乳后期.getValue());
//					session.saveOrUpdate(mrzt);
//					session.flush();
				}
			}
			else if(mrzt.getZt()==NZMRZT.泌乳后期.getValue())
			{
				//nzxx.setMrzt(nzxx.getMrzt()+1);
				session.saveOrUpdate(nzxx);
				session.flush();
				
				//int countDay=fzzt.getDay();
				//countDay=DateTimeUtil.getDayBetween(fzzt.getSj(),new Date());
				//mrzt.setDay(countDay);
				if(allCount>216)
				{
					mrzt.setZt(NZMRZT.干奶期.getValue());
//					session.saveOrUpdate(mrzt);
//					session.flush();
				}
			}
			else if(mrzt.getZt()==NZMRZT.干奶期.getValue())
			{
				//干奶期60天
				
			}
			
			//统一更新
			session.saveOrUpdate(mrzt);
			session.flush();
		}
		
			//牛只的类别信息为发情状态，记录时间
			//是否配种状态，配种多少天，配种时间，开始记录天数，每次配种操作都会更新牛只的类别状态
			//如果是配种，并且26+2天进行初检提示(抽血测试)
			//如果是配种，并且38+2天进行摸卵泡初检
			
			//初检登记，会更新牛只的类别状态为青年牛，进入妊娠期，更新牛只的类别信息为妊娠，记录最后配种时间(不用变更时间)，并计算天数，依据平均280天计算产期
		
		
		//
		
	}
	
//	public void nzlbSaveOrUpdate(NZLBXX lbxx,String nzxxId)
//	{
//		if(StringUtil.IsEmpty(lbxx.getXh()))
//		{
//			lbxx.setXh(nzxxId);
//			session.save(lbxx);
//		}
//		else
//		{
//			session.saveOrUpdate(lbxx);
//		}
//	}
	
	
}
