<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
		<form id="frmtsxx" class="jqtransform">
				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">牛只编号：</td>
						<td class="">
							<div class="input-text lh30" style="width:400px">${ts.nzjbxx.nzbh}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">圈舍名称：</td>
						<td class="">
							<div class="input-text lh30">${ts.nzjbxx.jsjbxx.jsmc}</div>
						</td>
					</tr>					
					<tr>
						<td class="td_right">提示信息：</td>
						<td class="">
							<div class="input-text lh30">${ts.tsms}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">当前状态：</td>
						<td class="">
							<div class="input-text lh30"><y:SwitchLabel text="${ts.sffq}" labels="未确认,确认发情,未发情" status="0,1,2" /></div>
						</td>
					</tr>
					<tr>
						<td class="td_right">备注信息：</td>
						<td class="">							
							<div class="input-text lh30">${ts.bz}</div>
						</td>
					</tr>
  				</table>
  		</form>
	</div>
		<s:if test="ts!=null&&ts.sffq==0">
			<div class="btns">
				<input id="comsubmit_pass" callfunction=",passdone," url="${pageContext.request.contextPath}/master/fqxt/fqts!pass.action?id=${ts.xh}" class="btn btn82 btn_add" type="button" value="未发情"/>
				<input onclick="add('${ts.xh}')" class="btn btn82 btn_add" type="button" value="已发情"/>
			</div>
		</s:if>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
    <script type="text/javascript">
     	showmap("发情信息管理 > 发情提示信息详情");
     	
     	function add(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/fqdj!add.action?id="+id;
     	}
     	
     	function passdone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/fqxt/fqts.action";
     		});
     	}
     	
     </script>
  </body>
</html>
