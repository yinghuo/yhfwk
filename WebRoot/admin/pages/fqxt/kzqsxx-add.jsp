<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box fl span4">
	  		<div class="box_border">
	        	<div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">控制器警告线设置</b>
	          		</div>
	          	</div>
	          	<div class="box_center pt5 pb5 pl20">
	          		<form id="frmkzqsz">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>警告线上限：</td>
	          				<td><input id="shang" type="text" name="conf.value" class="input-text lh25" size="50" value="${conf.value}"></td>
	          			</tr>
	          			<tr>
	          				<td>警告线下限</td>
	          				<td><input id="xia" type="text" name="conf1.value" class="input-text lh25" size="50" value="${conf1.value}"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" id="comsubmit_save" validata="validata" callfunction=",savedone," url="${pageContext.request.contextPath}/master/fqxt/kzqpz!save.action" name="frmkzqsz" class="btn btn82 btn_add" value="更新">
	          		</div>
	         </div>
	 </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
    <script type="text/javascript">
     	showmap("控制器设置 > 控制器警告线设置");
     	
     	function validata()
     	{
     		if(IsNull("shang",0))
     		{
     			alert("请填写控制器上限值！");
     			return false;
     		}
     		else if(IsNull("xia",0))
     		{
     			alert("请填写控制器下限值！");
     			return false;
     		}
     		return true;
     	}
     	
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			
     		});
     	}
     	
     </script>
  </body>
</html>
