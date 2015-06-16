package org.chonger.service.task;

import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.scheduling.quartz.SpringBeanJobFactory;

public class JobFactory extends SpringBeanJobFactory {
	@Autowired
    private AutowireCapableBeanFactory beanFactory;

	@Override
	protected Object createJobInstance(TriggerFiredBundle arg0) {
		Object jobInstance = super.createJobInstance(arg0);
		beanFactory.autowireBean(jobInstance);
		return jobInstance;		
	}
}
