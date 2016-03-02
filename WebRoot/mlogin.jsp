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
					</div>
					<div style="margin-top:20px;float:right;font-size:16px;color:#555">
						当前已有<span id="count" style="color:#eeb900;margin:0px 3px;">00000000</span>个牧场在使用，期待您的加入！
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		Copyright © 2015 <a href="#" target="_blank"><strong>北京创捷世纪科技有限公司</strong></a> All rights reserved .
	</div>
	<script type="text/javascript">
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
		  		$("#loginfrm").ajaxSubmit({
					dataType:  'json',
					success: function(data) {
						if(data["login"]=="fail")
						{
							alert(data["msg"]);
						}else if(data["login"]=="access")
						{
							window.location="${pageContext.request.contextPath}/m/m!access.action";
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
	</script>
</body>
</html>