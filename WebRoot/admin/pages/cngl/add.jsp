<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
		<form id="frmcnxx" class="jqtransform">
				<input type="hidden" name="cn.xh" value="${cn.xh}">
				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">牛只编号：</td>
						<td class="">
							<input type="text" id="nzbh" name="cn.nzbh" class="input-text lh30" value="${cn.nzbh}" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">挤奶日期：</td>
						<td class="">
							<input type="text" id="jnrq" name="cn.jnrq" readonly="readonly" class="input-text lh30" value="<s:date name="cn.jnrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">班次：</td>
						<td class="">
							<input type="text" id="bc" name="cn.bc" class="input-text lh30" value="${cn.bc}" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">产量：</td>
						<td class="">
							<input type="text" id="cl" name="cn.cl" class="input-text lh30" value="${cn.cl}" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">备注信息：</td>
						<td class="">							
							<textarea id="bz" name="cn.bz" cols="80" rows="10" class="textarea">${cn.bz}</textarea>
						</td>
					</tr>
  				</table>
  		</form>
	</div>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/cngl/gtcnxx!save.action" name="frmcnxx" class="btn btn82 btn_add" type="button" value=" <s:if test="nc==null">新增</s:if><s:else>更新</s:else> "/>
			</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
     <script type="text/javascript">
     	showmap("产奶信息管理 > <s:if test="nc==null">新增</s:if><s:else>更新</s:else>个体产奶信息");
     	function validata()
     	{
     		debugger;
     		if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}
     		else if(IsNull("jnrq",0))
     		{
     			alert("请填写挤奶日期！");
     			return false;
     		}
     		else if(IsNull("bc",0))
     		{
     			alert("请填写挤奶班次！");
     			return false;
     		}
     		else if(IsNull("cl",0))
     		{
     			alert("请填写挤奶产量！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/cngl/gtcnxx.action";
     		});
     	}
     </script>
  </body>
</html>
