package org.chonger.service.task;

import java.util.Date;
import java.util.List;

import org.chonger.common.ConstantEnum.NZLB;
import org.chonger.entity.fzgl.FQDJXX;
import org.chonger.entity.jbxx.NCJBXX;
import org.chonger.entity.nqgl.NCTJXX;
import org.chonger.utils.DateTimeUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.transaction.annotation.Transactional;

/**
 * 查询牧场信息，统计牧场的检出率等其他统计逻辑
 * @author Daniel
 * @date Jul 26, 2015 6:08:49 PM
 * @version V1.0
 *
 */
@Transactional
public class TongjiTask extends QuartzJobBean  {
	
	private Session session;
	private SessionFactory sessionFactory;	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		//session=sessionFactory.openSession();
		session=SessionFactoryUtils.getSession(sessionFactory, true);
	}
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		System.out.println("牛场统计处理：");
		if(sessionFactory!=null)
		{
			try
			{
				//查询所有牛场信息
				List<NCJBXX> listAll=getNCList();
				
				if(listAll!=null&&listAll.size()>0)
				{
					for(NCJBXX nzxx : listAll)
					{
						NCTJXX tjxx=getTJXX(nzxx.getXh());
						
						updateNZCount(tjxx);//获取牛场的统计牛只数量
						updateFQ30(tjxx);//获取牛场的发情信息
						updateFQ1(tjxx);
						updateFQTime(tjxx);
						updateCD30(tjxx);
						
						saveOrUpdate(tjxx);
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
	
	//获取所有牛场信息
	private List<NCJBXX> getNCList()
	{
		String hql="from NCJBXX model";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			return query.list();
		}
		return null;
	}
	
	//获取指定牛场的信息
	private NCTJXX getTJXX(String ncxh)
	{
		String hql="from NCTJXX model where model.ncxh = '"+ncxh+"'";
		NCTJXX rtjxx=null;
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			List<NCTJXX> rlist=query.list();
			if(rlist!=null&&rlist.size()>0)
				rtjxx = rlist.get(0);
			else
			{
				rtjxx=new NCTJXX();
				rtjxx.setNcxh(ncxh);
				
				//保存
				Transaction transaction = session.beginTransaction();
				transaction.begin();
				session.save(rtjxx);
				transaction.commit();
			}
		}
		
		return rtjxx;		
	}
	
	private void saveOrUpdate(NCTJXX tjxx)
	{
		if(sessionFactory!=null)
		{
			Transaction transaction = session.beginTransaction();
			transaction.begin();
			session.saveOrUpdate(tjxx);
			transaction.commit();
		}
	}
	
	//更新牛场的统计牛只信息
	private void updateNZCount(NCTJXX tjxx)
	{
		//根据统计信息的xh获取牛场的牛只个数
		String hql="select count(*) from NZJBXX model where model.ncbh='"+tjxx.getNcxh()+"' and (model.lb='"+NZLB.大育成牛.getValue()+"' or model.lb='"+NZLB.成年母牛.getValue()+"')";
		//String hql1="select count(*) from NZJBXX model where model.ncbh='"+tjxx.getNcxh()+"' and model.lb='"+NZLB.成年母牛.getValue()+"'";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			//获取执行的个数
			long nzCount=((Number)query.uniqueResult()).longValue();
			
//			Query query1=session.createQuery(hql1);
//			//获取执行的个数
//			long nzCount1=((Number)query.uniqueResult()).longValue();
//			
//			tjxx.setYcn((int)nzCount);
//			tjxx.setMrn((int)nzCount1);
			
			tjxx.setZts((int)(nzCount));
		}
	}
	
	//更新牛场的30日发情信息
	private void updateFQ30(NCTJXX tjxx)
	{
		//获取当前30天之前的时间
		Date date30=DateTimeUtil.addDate(new Date(), 0, 0, -30);		
		String hql="select count(*) from FQDJXX model where model.ncbh='"+tjxx.getNcxh()+"' and model.fqsj >= '"+DateTimeUtil.formatDateToString(date30)+"'";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			
			//获取执行的个数
			long nzCount=((Number)query.uniqueResult()).longValue();
			
			tjxx.setFq30((int)nzCount);
			
			//计算检出率
			double jcl=nzCount*12/tjxx.getZts()*100;
			tjxx.setFq30jcl(jcl);
		}		
	}
	
	//更新牛场的当天发情信息
	private void updateFQ1(NCTJXX tjxx)
	{
		//获取当前1天之前的时间
		Date date1=DateTimeUtil.addDate(new Date(), 0, 0, -1);		
		String hql="select count(*) from FQDJXX model where model.ncbh='"+tjxx.getNcxh()+"' and model.fqsj = '"+DateTimeUtil.formatDateToString(date1)+"'";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			
			//获取执行的个数
			long nzCount=((Number)query.uniqueResult()).longValue();
			
			tjxx.setFq1((int)nzCount);
			
			//计算检出率
			double jcl=nzCount*12/tjxx.getZts()*100;
			tjxx.setFq1jcl(jcl);
		}		
	}
	
	//更新牛场最后发情的日期
	private void updateFQTime(NCTJXX tjxx)
	{
		String hql="from FQDJXX model where model.ncbh='"+tjxx.getNcxh()+"' order by model.fqsj desc";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			List<FQDJXX> rlist=query.list();
			
			if(rlist!=null&&rlist.size()>0)
			{
				tjxx.setFq0t(rlist.get(0).getFqsj());
			}
		}
	}
	
	//更新30天产犊数量
	private void updateCD30(NCTJXX tjxx)
	{
		//获取当前30天之前的时间
		Date date30=DateTimeUtil.addDate(new Date(), 0, 0, -30);
		String hql="select sum(model.tesl) from CDDJXX model where model.ncbh='"+tjxx.getNcxh()+"' and model.cdsj >= '"+DateTimeUtil.formatDateToString(date30)+"'";
		
		if(sessionFactory!=null)
		{
			Query query=session.createQuery(hql);
			
			long nzCount=0;
			
			Object obj=query.uniqueResult();
			if(obj!=null)
				nzCount=((Number)obj).longValue();//获取执行的个数
			
			tjxx.setCd30((int)nzCount);
			
			//计算参配率
			double cpl=nzCount*12/tjxx.getZts()*100;
			tjxx.setCpl30(cpl);
			
		}		
	}
	
	//更新上一日产奶量
	private void updateCN1(NCTJXX tjxx)
	{
		//获取当前1天之前的时间
		Date date1=DateTimeUtil.addDate(new Date(), 0, 0, -1);		
		//String hql="select count(*) from FQDJXX model where model.ncbh='"+tjxx.getNcxh()+"' and model.fqsj = '"+date1+"'";
		
		
		
	}
}
