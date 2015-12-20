<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/boot/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/boot/bootstrap.min.js"></script>
	<title>智能云牧场管理系统</title>
</head>
<body>
	<div id="login_top">
		<div id="welcome">
			欢迎使用智能云牧场管理系统，咨询电话<span style="margin:0px 5px;">010-51957160</span>
		</div>
		<div id="back">
			<a href="#">快速注册</a>&nbsp;&nbsp; | &nbsp;&nbsp;
			<a href="#">帮助</a>
		</div>
	</div>
	<div id="login_center">
		<div id="login_area">
			<div id="login_form">
				<form id="loginfrm" action="${pageContext.request.contextPath}/login.action" method="post">
					<div id="login_tip">
						用户登录&nbsp;&nbsp;UserLogin
					</div>
					<div><input type="text" id="username" name="loginName" value="qiye1" class="username"></div>
					<div><input type="password" id="pwd"  name='loginPwd' value="1234567" class="pwd"></div>
					<div id="btn_area">
						<input type="button" name="submit" id="sub_btn" onclick="login()" value="登&nbsp;&nbsp;录">&nbsp;&nbsp;
						<%/*<input type="text" id="vcode" name="loginVcode" class="verify">
						<img id="vcodeimg" src="${pageContext.request.contextPath}/vimage.jsp?type=login" alt="" width="80" height="40">
						 */%>
						<input type="button" name="demo" id="sub_demo" onclick="" value="快速体验" />
					</div>
					<div style="margin-top:20px;float:right;font-size:16px;color:#555">
						当前已有<span style="color:#eeb900;margin:0px 3px;">00000000</span>个牧场在使用，期待您的加入！
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		Copyright © 2015 <a href="#" target="_blank"><strong>北京创捷世纪科技有限公司</strong></a> All rights reserved .
	</div>
	<!-- Select User -->
	<div class="modal fade" id="selectUserModal" tabindex="-1" role="dialog">
	   <div class="modal-dialog">
	      <div class="modal-content">
	         <div class="modal-header">
	            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	            <h4 class="modal-title" id="myModalLabel">请选择默认的员工信息</h4>
	         </div>
	         <div class="modal-body">
	            <ul id="userListPanel">
	            	
	            </ul>
	         </div>
	      </div>
	   </div>
	</div>

	<script type="text/javascript">		
 			function rvode()
	 		{
	 			document.getElementById("vcodeimg").src="${pageContext.request.contextPath}/vimage.jsp?type=login&t="+Date.parse(new Date());
	 		}
		  	function login()
		  	{
		  		if($("#username").val().length<=0)
		  		{
		  			alert("请输入登陆账号！");
		  			return;
		  		}
		  		else if($("#pwd").val().length<=0)
		  		{
		  			alert("请输入登陆密码！");
		  			return;
		  		}
		  		/*else if($("#vcode").val().length<=0)
		  		{
		  			alert("请输入验证码！");
		  			return;
		  		}*/		  		
		  		
		  		$("#loginfrm").ajaxSubmit({
					dataType:  'json',
					success: function(data) {
						if(data["login"]=="fail")
						{
							alert(data["msg"]);
							rvode();
							$("#vcode").val("");
						}else if(data["login"]=="access")
						{
							loadUser();
							//window.location="${pageContext.request.contextPath}/login!access.action";
						}else
						{
							alert("异常代码！");
						}
					},
					error:function(xhr){
						alert("提交过程中发生网络错误，请与管理员联系!");
					}
				});
		  	}
		  	
		  	//加载员工信息
		  	function loadUser()
		  	{		  		
		  		$.ajax({
					url:"${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action?"+new Date(),
					type:"get",
					timeout:1200000,
					success:function(data){
						if(data)
						{
							var datalength=data.length;
							if(datalength>0)
							{
								var userListPanel=$("#userListPanel");
								userListPanel.html("");
								for(var i=0;i<datalength;i++)
								{
									var item=data[i];
									userListPanel.append('<li><a href="${pageContext.request.contextPath}/login!access.action?id='+item.id+'">'+item.name+'</a></li>');
								}
								$("#selectUserModal").modal("show");
							}
							else
							{
								//user list is empty
								window.location="${pageContext.request.contextPath}/login!access.action";
							}
						}
						else
							window.location="${pageContext.request.contextPath}/login!access.action";
					}
				});
		  	}
		  	
</script>
</body>
</html>