<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="zh-CN">
<head>
	<meta charset="UTF-8">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<title>牧场管理系统</title>
</head>
<body>
	<div id="login_top">
		<div id="welcome">
			欢迎使用
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
					<div><input type="text" id="username" name="loginName" value="admin" class="username"></div>
					<div><input type="text" id="pwd"  name='loginPwd' value="admin" class="pwd"></div>
					<div id="btn_area">
						<input type="button" name="submit" id="sub_btn" onclick="login()" value="登&nbsp;&nbsp;录">&nbsp;&nbsp;
						<input type="text" class="verify">
						<img src="images/login/verify.png" alt="" width="80" height="40">
					</div>
				</form>
			</div>
		</div>
	</div>
	<div id="login_bottom">
		版权
	</div>
	<script type="text/javascript">
 			
		  	function login()
		  	{
		  		if($("#username").val().length<=0)
		  		{
		  			$("#rname").html("请输入登陆账号！");
		  			return;
		  		}
		  		else
		  		{
		  			$("#rname").html("");
		  		}
		  		if($("#pwd").val().length<=0)
		  		{
		  			$("#pas").html("请输入登陆密码！");
		  			return;
		  		}
		  		else
		  		{
		  			$("#pas").html("");
		  		}
		  		
		  		$("#loginfrm").ajaxSubmit({
					dataType:  'json',
					success: function(data) {
						if(data["login"]=="fail")
						{
							alert(data["msg"]);
							rvode();
						}else if(data["login"]=="access")
						{
							window.location="${pageContext.request.contextPath}/login!access.action";
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