package org.chonger.service.task;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
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
		session=sessionFactory.openSession();
	}
	
	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		
		//查询所有牛场信息
		
		//获取牛场的统计牛只数量
		
		//获取牛场的发情信息
		
		
	}

}
