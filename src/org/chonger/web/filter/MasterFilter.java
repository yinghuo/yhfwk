package org.chonger.web.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.chonger.entity.system.Role;
import org.chonger.entity.system.User;
import org.chonger.service.system.UserManager;

/**
 * 后台过滤器，在没有登陆信息的情况下不允许访问后台内容。
 * 
 * 登陆情况，如何更好地区分前台用户和后台用户？
 * 目前只完成是否登录校验。当用户访问后台数据的时候进行登陆校验。
 * @author Daniel
 *
 */
public class MasterFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)arg0;
		HttpServletResponse response=(HttpServletResponse)arg1;
		//判断用户的请求路径是否符合过滤规则
		String rurl=request.getRequestURI();
		//System.out.println(rurl);
		if(PathFilter(rurl))
		{
			HttpSession session=request.getSession();
			Object objuser=session.getAttribute(UserManager.USERSESSIONKEY);
			if(objuser==null)//TODO 监测校验前台用户和后台用户，依据用户的权限进行过滤
			{
				response.addHeader("Referer", rurl);
				//response.sendRedirect(request.getContextPath()+loginpath);//未登录
				response.sendRedirect(request.getContextPath()+"/logout.jsp?t="+loginpath);
//				response.setContentType("text/xml;charset=UTF-8");
//				PrintWriter pw=response.getWriter();
//				pw.write("{\"error\":10000,\"msg\":\"登陆已失效，请重新登陆！\"}");
//				pw.flush();
			}
			else//用户已登录，进行用户角色校验
			{
				User user=(User)objuser;
				
				Role role = user.getRole();
				
				if(role.getRtype()!=2||index==2||index==3)//管理员  不是前台校验
				{
					arg2.doFilter(arg0, arg1);
				}
				else
				{
					response.sendRedirect(request.getContextPath());
				}
			}
				
		}
		else
		{
			arg2.doFilter(arg0, arg1);
		}
	}
	
	//判断是否是是否符合过滤规则，过滤管理目录的jsp和action文件
	private Pattern 
		patternother=Pattern.compile(".*/admin/.*\\..*"),
		//patternpath=Pattern.compile(".*/admin/[a-zA-Z0-9/]"),
		patternjsp=Pattern.compile(".*/admin/.*\\.jsp.*"),
		patternaction=Pattern.compile(".*/maser/.*\\.action.*");
	
	/**
	 * 需要权限过滤的匹配集合
	 */
	//private List<String> masterParrernStr;
	private List<Pattern> masterParrerns;
	
	private int index=-1;
	/**
	 * 判断路径是否符合过滤的特征
	 * @param value
	 * @return
	 */
	private boolean PathFilter(String value)
	{
		boolean isTrue=false;
//		for(Pattern pattern : masterParrerns)
//		{
//			if(isTrue=pattern.matcher(value).find())break;
//		}
		index=-1;
		for(int i=0;i<masterParrerns.size();i++)
		{
			Pattern pattern=masterParrerns.get(i);
			if(isTrue=pattern.matcher(value).find())
			{
				index=i;
				break;
			}
		}
		return isTrue||!patternother.matcher(value).find();
		//return patternjsp.matcher(value).find()||patternaction.matcher(value).find()||!patternother.matcher(value).find();
	}
	
	private String loginpath;
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		loginpath=arg0.getInitParameter("page");
		
		//初始化过滤器，可以通过文件配置
		//masterParrern=new ArrayList<String>();
		masterParrerns=new  ArrayList<Pattern>();
		masterParrerns.add(Pattern.compile(".*/admin/(.*\\.jsp.*)?"));//web jsp目录的admin下的所有jsp资源
		masterParrerns.add(Pattern.compile(".*/master/.*\\.action.*"));//所有master域的所有action资源
		masterParrerns.add(Pattern.compile(".*/account/.*\\.jsp.*"));//web 前台账户管理的account下的jsp
		masterParrerns.add(Pattern.compile(".*/account/.*\\.action.*"));//web 前台账户管理的account下的action
		//Daniel 添加中心资源过滤
		masterParrerns.add(Pattern.compile(".*/center/(.*\\.jsp.*)?"));//中心目录下的jsp资源
		masterParrerns.add(Pattern.compile(".*/center/.*\\.action.*"));//中心操作的Acton资源
	}
	
}
