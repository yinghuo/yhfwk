<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<%@include file='importResource.jsp'%>
</head>
<body>
	<iframe frameborder="0" width="100%" height="100%" scrolling="auto" src="mainTemplate.jsp"></iframe>
	<div class="maskLayer" id="maskLayer"></div>
	<div class="dialog" id="dialog">
		<h6>
			<span id="dialogTitle">提示</span>
			<a class="dialogClose"></a>
		</h6>
		<div id="dialogContext" class="dialogContext"></div>
		<div class="dialogBtnBox">
			<input type="button" id="dialogCancelBtn" class="dialogCancel blueBtn" value="取 消"/>
			<input type="button" id="dialogConfirmBtn" class="blueBtn" value="确 定"/>	
			<div class="clearFloat"></div>		
		</div>
	</div>		
</body>
</html>
