<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box fl span5">
  		<div class="box_border">
	        	<div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">用户详细信息</b>
	          		</div>
	          	</div>
	          	<div class="box_center pt5 pb5 pl20" style="height:300px;">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>用户登录名：</td>
	          				<td><input id="oldpwd" type="password" name="oldpwd" class="input-text lh25" size="50"></td>
	          			</tr>
	          			<tr>
	          				<td>用户类型：</td>
	          				<td><input id="oldpwd" type="password" name="oldpwd" class="input-text lh25" size="50"></td>
	          			</tr>
	          			
	          		</table>
	          	</div>	          	
	         </div>
  	</div>
  
 	<div class="box fl ml5 span4">
	  		<div class="box_border">
	        	<div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">密码修改</b>
	          		</div>
	          	</div>
	          	<div class="box_center pt5 pb5 pl20">
	          		<form id="frmpwd" action="${pageContext.request.contextPath}/master/jsgl/jsgl.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>当前密码：</td>
	          				<td><input id="oldpwd" type="password" name="oldpwd" class="input-text lh25" size="50"></td>
	          			</tr>
	          			<tr>
	          				<td>新密码：</td>
	          				<td><input id="newpwd" type="password" name="newpwd" class="input-text lh25" size="50"></td>
	          			</tr>
	          			<tr>
	          				<td>确认密码：</td>
	          				<td><input id="newpwd1" type="password" class="input-text lh25" size="50"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="update()" class="btn btn82 btn_add" value="更新">
	          		</div>
	         </div>
	 </div>
 	
 	<div class="box fl span4 ml5 mt5">
	  		<div class="box_border">
	        	<div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">头像修改</b>
	          		</div>
	          	</div>
	          	<div class="box_center pt5 pb5 pl20">
	          	</div>
	         </div>
	 </div>
 	
 	<script type="text/javascript">
     	showmap("个人信息编辑");
    </script>
  </body>
 </html>
