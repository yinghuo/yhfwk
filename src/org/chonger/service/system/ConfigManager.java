package org.chonger.service.system;

import info.yinghuo.utils.StringUtils;

import java.util.List;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.system.Config;
import org.chonger.entity.system.User;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ConfigManager {
	
	@Autowired
	private CommonDAO<Config> dao;
	
	/**
	 * 通过名称获取配置信息
	 * @param name
	 * @return
	 */
	public Config queryConfigByName(String domain,String name)
	{
		//获取当前牧场信息
		String ncxh=null;
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			ncxh=user.getNcjbxx().getXh();
		}
		
		List<Config> confList=dao.find("from Config model where model.ncbh = '"+ncxh+"' and model.domain = '"+domain+"' and model.name='"+name+"'");
		if(confList!=null&&confList.size()>0)
		{
			return confList.get(0);
		}		
		return null;
	}
	
	/**
	 * 通过名称获取配置信息
	 * @param name
	 * @return
	 */
	public Config querySystemConfigByName(String domain,String name)
	{
		List<Config> confList=dao.find("from Config model where model.domain = '"+domain+"' and model.name='"+name+"'");
		if(confList!=null&&confList.size()>0)
		{
			return confList.get(0);
		}		
		return null;
	}
	
	/**
	 * 保存或更新配置信息
	 * @param name
	 * @param value
	 */
	public void saveOrUpdateConfig(Config config)
	{
		//获取当前牧场信息
		User user=SessionUtils.getUser();
		if(user!=null&&user.getRole().getRtype()==2)
		{
			config.setNcbh(user.getNcjbxx().getXh());
		}
		
		if(StringUtils.isEmptyOrNull(config.getId()))
		{
			config.setId(CommUUID.getUUID());
			dao.save(config);
		}
		else
		{
			dao.saveOrUpdate(config);
		}
	}
	
}
