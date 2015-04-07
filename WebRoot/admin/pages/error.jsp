<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/error.css" />
</head>
<body>
	<div class="errorContainer">
		<img src="../images/errImg.png"/>
		<p>您正在预览的问也可能加载超时、已被删除、重命名或暂时不可用</p>
		<p>系统会5秒钟后自动返回首页</p>
		<p style="margin-top:100px;">您也可以：</p>
		<a href="">刷新</a>
		<a href="">返回首页</a>
		<a href="">返回上一页</a>
		<a href="">联系客服</a>
	</div>
</body>
</html>