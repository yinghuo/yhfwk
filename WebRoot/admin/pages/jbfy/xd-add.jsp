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
  		<form id="frmxdxx" class="jqtransform">
  			<input type="hidden" name="xd.xh" value="${xd.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_right">消毒日期：</td>
					<td class="">
						<input type="text" id="xdrq" name="xd.xdrq" class="input-text lh30" readonly="readonly" value="<s:date name="xd.xdrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">消毒区域：</td>
					<td class="">
						<input type="text" id="xdqy" name="xd.xdqy" class="input-text lh30" value="${xd.xdqy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">药剂名称：</td>
					<td class="">
						<input type="text" id="yjmc" name="xd.yjmc" class="input-text lh30" value="${xd.yjmc}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">使用剂量：</td>
					<td class="">
						<input type="text" id="syjl" name="xd.syjl" class="input-text lh30" value="${xd.syjl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">批号：</td>
					<td class="">
						<input type="text" id="ph" name="xd.ph" class="input-text lh30" value="${xd.ph}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">制造商：</td>
					<td class="">
						<input type="text" id="zzs" name="xd.zzs" class="input-text lh30" value="${xd.zzs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">兽医：</td>
					<td class="">
						<input type="text" id="sytxt" readonly="readonly" class="input-text lh30" value="${xd.sy}" size="35">
						<input type="hidden" id="sy" name="xd.sy" value="${xd.sy}">
						&nbsp;<a id="selectsy" onclick="ygSelect('selectsy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="xd.bz" cols="80" rows="10" class="textarea">${xd.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jbfy/xdxx!save.action" name="frmxdxx" class="btn btn82 btn_add" type="button" value=" <s:if test="xd==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
 	<script type="text/javascript">
 		showmap("疾病防疫管理 > 新增消毒信息");
 		function validata() {
			if (IsNull("xdrq", 0)) {
				alert("请填写消毒日期！");
				return false;
			}
			return true;
		}
 		
		function savedone(data) {
			jsonResult(
					data,
					function(data) {
						if (data["error"] == 0)
							window.location.href = "${pageContext.request.contextPath}/master/jbfy/xdxx.action";
					});
		}
		
		var select=new YSelect("selectsy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		
	  		if(id=="selectsy")
	  		{
		  		$("#sytxt").val(t);
		 		$("#sy").val(t);
	 		}
		});
		
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
			{
				if(id=="selectsy")
		  		{
			  		select.show(id,$("#sytxt").val());
		 		}
			}
		}
    </script>
  </body>
 </html>
