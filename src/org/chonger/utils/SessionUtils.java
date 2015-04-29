package org.chonger.utils;

import org.apache.struts2.ServletActionContext;
import org.chonger.entity.system.User;
import org.chonger.service.system.UserManager;

public class SessionUtils {
	/**
	 * 获取Session用户对象
	 */
	public static User getUser()
	{
		Object sessionObject=ServletActionContext.getRequest().getSession().getAttribute(UserManager.USERSESSIONKEY);	
		return sessionObject==null?null:(User)sessionObject;
	}
}
