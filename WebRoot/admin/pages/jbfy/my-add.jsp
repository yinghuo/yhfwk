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
  		<form id="frmmyxx" class="jqtransform">
  			<input type="hidden" name="my.xh" value="${my.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
	  			<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${my.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="my.nzbh" value="${my.nzbh}">
						<span class="required">*必填</span>						
					</td>
				</tr>
				<tr>
					<td class="td_right">免疫日期：</td>
					<td class="">
						<input type="text" id="myrq" name="my.myrq" class="input-text lh30" readonly="readonly" value="<s:date name="my.myrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">免疫项目：</td>
					<td class="">
						<input type="text" id="myxm" name="my.myxm" class="input-text lh30" value="${my.myxm}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">疫苗名称：</td>
					<td class="">
						<input type="text" id="ymmc" name="my.ymmc" class="input-text lh30" value="${my.ymmc}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">使用剂量：</td>
					<td class="">
						<input type="text" id="syjl" name="my.syjl" class="input-text lh30" value="${my.syjl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">批号：</td>
					<td class="">
						<input type="text" id="ph" name="my.ph" class="input-text lh30" value="${my.ph}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">制造商：</td>
					<td class="">
						<input type="text" id="zzs" name="my.zzs" class="input-text lh30" value="${my.zzs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">结果：</td>
					<td class="">
						<input type="text" id="jg" name="my.jg" class="input-text lh30" value="${my.jg}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">兽医：</td>
					<td class="">
						<input type="text" id="sytxt" readonly="readonly" class="input-text lh30" value="${my.sy}" size="35">
						<input type="hidden" id="sy" name="my.sy" value="${my.sy}">
						&nbsp;<a id="selectsy" onclick="ygSelect('selectsy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="my.bz" cols="80" rows="10" class="textarea">${my.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jbfy/myxx!save.action" name="frmmyxx" class="btn btn82 btn_add" type="button" value=" <s:if test="my==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
 	<script type="text/javascript">
 		showmap("疾病防疫管理 > 新增免疫信息");
     	function validata() {
			if (IsNull("nzbh", 0)) {
				alert("请填写牛只编号！");
				return false;
			}
			if (IsNull("myrq", 0)) {
				alert("请填写免疫日期！");
				return false;
			}
			if (IsNull("myxm", 0)) {
				alert("请填写免疫项目！");
				return false;
			}
			if (IsNull("ymmc", 0)) {
				alert("请填写疫苗名称！");
				return false;
			}
			if (IsNull("syjl", 0)) {
				alert("请填写使用剂量！");
				return false;
			}
			if (IsNull("ph", 0)) {
				alert("请填写批号！");
				return false;
			}
			if (IsNull("zzs", 0)) {
				alert("请填写制造商！");
				return false;
			}
			if (IsNull("jg", 0)) {
				alert("请填写结果！");
				return false;
			}
			if (IsNull("sy", 0)) {
				alert("请填写兽医！");
				return false;
			}
			return true;
		}

		function savedone(data) {
			jsonResult(
					data,
					function(data) {
						if (data["error"] == 0)
							window.location.href = "${pageContext.request.contextPath}/master/jbfy/myxx.action";
					});
		}
		
		var select=new YSelect("selectsy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		
	  		if(id=="selectsy")
	  		{
		  		$("#sytxt").val(t);
		 		$("#sy").val(t);
	 		}
		},true);
		
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
		
		var nzselect=new YSelect("nzbhtxt","selectNz","${pageContext.request.contextPath}/master/nzgl/nzxx!load.action",function(id,v,t){
			$("#nzbhtxt").val(t);
			$("#nzbh").val(v);
		});
		
		var nzList;
		function nzSelect(id)
		{
			//筛选过滤
			nzList=nzselect.screening($("#nzbhtxt").val());
		}
		
		function nzHiden()
		{
			if(nzList&&nzList.length>0)
			{
				var nzxx=nzList[0];
				$("#nzbhtxt").val(nzxx[1]);
				$("#nzbh").val(nzxx[0]);
			}
			nzselect.hiden();
		}
    </script>
  </body>
 </html>
