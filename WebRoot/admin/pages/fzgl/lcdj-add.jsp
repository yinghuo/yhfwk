<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
  		<form id="frmlcdj" class="jqtransform">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbh" name="lc.nzbh" class="input-text lh30" value="${lc.nzbh}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">流产日期：</td>
					<td class="">
						<input type="text" id="lcrq" name="lc.lcrq" class="input-text lh30" readonly="readonly" value="<s:date name="lc.lcrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">流产原因：</td>
					<td class="">
						<input type="text" id="lcyy" name="lc.lcyy" class="input-text lh30" value="${lc.lcyy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎儿类型：</td>
					<td class="">
						<input type="text" id="telx" name="lc.telx" class="input-text lh30" value="${lc.lcyy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现人：</td>
					<td class="">
						<input type="text" id="fxr" name="lc.fxr" class="input-text lh30" value="${lc.fxr}" size="35">
						&nbsp;<a class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现方式：</td>
					<td class="">
						<input type="text" id="fxfs" name="lc.fxfs" class="input-text lh30" value="${lc.fxfs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">核实人：</td>
					<td class="">
						<input type="text" id="hsr" name="lc.hsr" class="input-text lh30" value="${lc.hsr}" size="35">
						&nbsp;<a class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">流产证人：</td>
					<td class="">
						<input type="text" id="lczr" name="lc.lczr" class="input-text lh30" value="${lc.lczr}" size="35">
						&nbsp;<a class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="lc.bz" cols="80" rows="10" class="textarea">${lc.bz}</textarea>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/lcdj!save.action" name="frmlcdj" class="btn btn82 btn_add" type="button" value=" <s:if test="lc==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
    <script type="text/javascript">
    	showmap("流产信息管理 > 新增流产信息");
     	function validata()
     	{
     		if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/lcdj.action";
     		});
     	}
     </script>
  </body>
</html>