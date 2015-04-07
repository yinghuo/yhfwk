package org.chonger.service.system;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import org.chonger.dao.CommonDAO;
import org.chonger.entity.system.User;
import org.chonger.entity.system.UserInfo;
import org.chonger.utils.CommUUID;
import org.chonger.utils.SHAUtils;
import org.chonger.utils.StringUtil;

/**
 * 用户业务管理类
 * 主要实现系统中对用户的相关操作。
 * 
 * @author Daniel
 * @create 2014-05-21
 * @version 1.0
 * 
 */
@Service
@Transactional
public class UserManager {
	/**	用户SessionKey */
	public static final String USERSESSIONKEY="_sys_user";
	
	/**
	 * 普通用户
	 */
	public static final int USERTYPE_USER=0;
	
	/**
	 * 企业用户
	 */
	public static final int USERTYPE_ENTERPRISE=1;
	
	@Autowired
	private CommonDAO<User> userDao;
	@Autowired
	private CommonDAO<UserInfo> userInfoDao;
	
	/**
	 * 查询用户数据库表，获取所有的用户数据
	 * @return
	 */
	public List<User> findAllUsers()
	{
		List<User> users=userDao.find(findAllUsersSql(null));
		return users;
	}
	
	/**
	 * 查询所用户的语句，可以设置用户名过滤
	 * @return
	 */
	public String findAllUsersSql(String namefilter)
	{
		if(StringUtil.IsEmpty(namefilter))
			return "from User model";
		else
			return "from User model where model.uname like '%"+namefilter+"%'";
	}
	
	/**
	 * 检查指定的登录名是否存在
	 * @param lname
	 * @return
	 */
	public boolean checkLoginNameExist(String lname)
	{
		List<User> users=userDao.find("from User model where model.uloginname='"+lname+"'");
		return users.size()>0;
	}
	
	/**
	 * 检查指定的邮箱地址是否存在
	 * @param email
	 * @return
	 */
	//public boolean checkUserEmail(String email)
	//{
	//	List<UserInfo> userInfos=userDao.find("from UserInfo model where model.uloginname='"+lname+"'");
	//}
	
	/**
	 * 依据登陆名获取用户信息
	 * @param lname
	 * @return
	 */
	public User getUserByLoginName(String lname)
	{
		List<User> users=userDao.find("from User model where model.uloginname='"+lname+"'");
		if(users!=null&&users.size()>0)
			return users.get(0);
		return null;
	}
	
	/**
	 * 用户登录方法。
	 * 先对用户输入的密码进行加密，然后到数据库中进行查找，并返回查找到的结果
	 * @param name
	 * @param pwd
	 * @return
	 */
	public User LoginUser(String name,String pwd)
	{
		//创建密文，查找用户
		pwd=SHAUtils.CreateSHAKey(pwd);
		List<User> users=userDao.find("from User model where model.uloginname=? and model.upassword=?",name,pwd);
		if(users!=null&&users.size()>0)
		{
			return users.get(0);
		}
		return null;
	}
	
	/**
	 * 更新用户的登陆时间
	 * @param user
	 */
	public void UpdateLoginTime(User user)
	{
		//Daniel 添加登陆时间逻辑
		if(user.getUnowlogintime()==null)//第一次登陆
			user.setUlastlogintime(new Date());
		else
			user.setUlastlogintime(user.getUnowlogintime());
		user.setUnowlogintime(new Date());
		userDao.saveOrUpdate(user);
	}
	
	/**
	 * 根据ID获取用户
	 * @param id
	 * @return
	 */
	public User findUserById(String id)
	{
		List<User> users=userDao.find("from User model where model.uid='"+id+"'");
		if(users!=null&&users.size()>0)
		{
			return users.get(0);
		}
		else
			return null;
	}
	
	public void deleteUser(String id)
	{
		//删除用户wiki和用户信息
		userInfoDao.ExecutionHql("delete UserInfo model where model.uid='"+id+"'");
		userDao.ExecutionHql("delete User model where model.uid='"+id+"'");
	}
	
	/**
	 * 保存或者更新实体信息
	 * @param user
	 * @throws Exception
	 */
	public void saveOrUpdata(User user) throws Exception
	{
		//判断实体是否存在有效地ID，如果不存在ID则创建信的uuid并进行保存操作，如果存在则进行更新操作
		if(user.getUid()==null||"".equals(user.getUid()))
		{
			user.setUid(CommUUID.getUUID());
			userDao.save(user);
			//添加UserInfo的相关操作
			if(user.getUserInfo()==null)
			{
				UserInfo userInfo=new UserInfo();
				userInfo.setUid(user.getUid());
				user.setUserInfo(userInfo);
				userInfoDao.save(userInfo);
			}
			else
			{
				user.getUserInfo().setUid(user.getUid());
				userInfoDao.save(user.getUserInfo());
			}
		}
		else
		{
			userDao.saveOrUpdate(user);
			userInfoDao.saveOrUpdate(user.getUserInfo());
		}
	}
}
