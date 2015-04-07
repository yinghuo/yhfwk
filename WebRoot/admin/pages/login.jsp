<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <%@include file='importResource.jsp'%>
   <script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/login.css" />
   <title>登录信任体系平台</title>
  </head>
  <body>
  	<div class="loginContainer">
	    <div>
		  	<a href="/" class="logo"></a>
		</div>
		  <!--页面内容区域-->
		  <form id="loginfrm">   
		    <div class="login-box">
		      <div class="login-img"></div>
		      <div class="login-content">
			        <div class="login-content-title">登录信任体系平台</div>
			        <dl>
			          <dd class="mt5">
			          	<input id="username"  type='text' name="loginName"  class="ipt ipt-account" tabindex="1" required placeholder="邮箱/用户名"/>
			          	<div id="rname" class="error"/>
			          </dd>
			        </dl>
			        <dl>
			          <dd class="mt5">
			          <input id="pwd" type='password'   name='loginPwd'  autocomplete="off" class="ipt ipt-password" tabindex="2" required placeholder="密码"/>
			           <div id="pas" class="error"></div>
			          </dd>
			        </dl>
			        <dl>
			          <dd>
		          <div class="mt20 gray">验证码</div>
		          <div class="mb20">
			         <input type="text" value="" id="randNum" name="randNum" required  class="ipt ipt-min"  tabindex="3" />
			         <%-- <img src="${pageContext.request.contextPath}/makeCertPic.jsp" id="code" onClick="reloadcode()"/> --%>
			         <a class="fontColorBlue">看不清，换一张</a>
			      </div>
		          <div class="mb20">
					 <input type="checkbox"  name="_spring_security_remember_me">自动登录
		          </div>
		          <div class="mb20  ">
		            <a href="http://chonger.org:8080/otherLogin.jsp?tager=sinaweibo&lurl=http://localhost${pageContext.request.contextPath}/login!yh3a.action" type="submit" onclick="" class="left green-large-btn" id="greenbtn" name="greenbtn">登录</a><a href="javascript:{}" class="block left ml10 mt10 find-pass">忘记密码？</a>
		            <a href="/reg" class="right mt10 sign-btn"></a>
		            <div class="clearFloat"></div>
		          </div>
		          <div class="border-bottom-dotted"></div>
		          <div class="login-sns">
		            <div class="login-sns-title">你也可以使用以下账号登录</div>
		            <div class="login-sns-content">
		            	<a href="http://chonger.org:8080/otherLogin.jsp?tager=sinaweibo&lurl=http://localhost${pageContext.request.contextPath}/login!yh3a.action" class="weibo left">新浪微博</a>
		            	<a href="http://chonger.org:8080/otherLogin.jsp?tager=qq&lurl=http://localhost${pageContext.request.contextPath}/login!yh3a.action" class="qq left ml20">QQ</a>
		            	<div class="clearFloat"></div>
		            </div>
		          </div>
		      </div>
		      <div class="clearFloat"></div>
		    </div>
		  </form>
		  <script type="text/javascript">
		 
		  
		  	function login()
		  	{
		  		$("#loginfrm").ajaxSubmit({
					dataType:  'json',
					success: function(data) {
						if(data["login"]=="fail")
							alert(data["msg"]);
						else if(data["login"]=="access")
							window.location="${pageContext.request.contextPath}/login!access.action";
						else
							alert("异常代码！");
					},
					error:function(xhr){
						alert("提交过程中发生网络错误，请与管理员联系!");
					}
				});
		  	}
		  </script>
		  <div class="footer-box">
				<!--认证信息-->
			    <div class="footer-info">
			    	<div class="youji"></div><span>生产环节有机认证</span>
			        <div class="jidi"></div><span>生产基地直接供应</span>
			        <div class="suyuan"></div><span>生产过程追踪溯源</span>
			        <div class="gongkai"></div><span>生产信息透明公开</span>
			        <div class="kaocha"></div><span class="footer-info-last">会员参与认证考察</span>
			        <div class="clearFloat"></div>
			    </div>
			    <!--页脚导航-->
				<div class="footer">
			    	<div>
				        <div class="left">
				            <div class="footer-navigation">
				            
				            	<a href="">网站首页</a>
				            
				            	<a href="">关于我们</a>
				            
				            	<a href="">免责条款</a>
				            	
				            	<a href="">保护隐私</a>
				            
				            	<a href="">网站导航</a>
				            	
				            	<a href="">客服中心</a>
				            
				            </div>
						</div>
						<div class="right">
				        	<div class="copyright">©2013 Rockontrol Corporation.All reserved. 版权所有</div>
				        </div>
				        <div class="clearFloat"></div>
			        </div>
			        <div class="footer-service">客服热线：4008-000-999（周一至周日：8：00-20：00）</div>
				</div>
			</div> 
	</div>
  </body>
</html>
