<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<html>
<head>
<title>用户-登录</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<div class="box_login" id="minHeightBox">
	<div class="box_login_content">
		<div class="box_login_logo">
			<div class="box_login_login_img"></div>
		</div>
		<div class="box_login_input">
			<div class="box_login_form">
				<form id="loginfrm" action="${pageContext.request.contextPath}/login.action" method="post">
					<label class="gray block pd5">邮箱/用户名</label>
					<div class="divinput_text relative">
						<input id="username" name="loginName" value="admin" class="input_text"  type="text"/>
						<div class="ditext_name_icon"></div>
					</div>
					<div id="rname" class="error"></div>
					<label class="gray block pd5">密码</label>
					<div class="divinput_text relative">
						<input id="pwd"  name='loginPwd' value="admin" class="input_text"  type="password"/>
						<div class="ditext_pwd_icon"></div>
					</div>
					<div id="pas" class="error"></div>
					
					
					<div class="divinput_login_btns">
						<div id="enterbutton" class="btns_login f18" onclick="login()">
							登录
						</div>
					</div>
					<div class="clear"></div>
				</form>
				<div class="login_sns login_sns_infos">
					你也可以使用以下账号登陆
					<div class="login-sns-content">
						<!-- XR-278 Daniel 功能下线 <a href="http://chonger.org:8080/otherLogin.jsp?tager=sinaweibo&lurl=http://localhost${pageContext.request.contextPath}/login!yh3a.action" class="weibo left">新浪微博</a>
		            	<a href="http://chonger.org:8080/otherLogin.jsp?tager=qq&lurl=http://localhost${pageContext.request.contextPath}/login!yh3a.action" class="qq left ml20">QQ</a>
		            	 -->
		            	<div class="clearFloat"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
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