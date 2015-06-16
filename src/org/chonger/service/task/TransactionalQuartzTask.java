package org.chonger.service.task;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.orm.hibernate3.SessionHolder;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.transaction.support.TransactionSynchronizationManager;

import common.Logger;

public abstract class TransactionalQuartzTask extends QuartzJobBean {
	
	private static final Logger log = Logger.getLogger(TransactionalQuartzTask.class);  

	
	private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {

		Session session = SessionFactoryUtils.getSession(sessionFactory, true);
		
		boolean existingTransaction = SessionFactoryUtils.isSessionTransactional(session, getSessionFactory());  

		if (existingTransaction) {  
		         log.info("Found thread-bound Session for TransactionalQuartzTask");  
		} else {  
			TransactionSynchronizationManager.bindResource(getSessionFactory(),new SessionHolder(session));  
		}
		try {  
			executeTransactional(arg0);  
		} catch (HibernateException ex) {  
			ex.printStackTrace();  
			throw ex;  
		} finally {  
			if (existingTransaction) {  
				log.debug("Not closing pre-bound Hibernate Session after TransactionalQuartzTask");  
			} else {  
				TransactionSynchronizationManager.unbindResource(getSessionFactory());  
				SessionFactoryUtils.releaseSession(session, getSessionFactory());  
			}  
		}
	}
	
	protected abstract void executeTransactional(JobExecutionContext ctx) throws JobExecutionException; 

	
}
