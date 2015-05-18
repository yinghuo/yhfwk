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
  		<form id="frmjyxx" class="jqtransform">
  			<input type="hidden" name="jy.xh" value="${jy.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
	  			<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${jy.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="jy.nzbh" value="${jy.nzbh}">
						<span class="required">*必填</span>						
					</td>
				</tr>
				<tr>
					<td class="td_right">检疫日期：</td>
					<td class="">
						<input type="text" id="jyrq" name="jy.jyrq" class="input-text lh30" readonly="readonly" value="<s:date name="jy.jyrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检疫月龄：</td>
					<td class="">
						<input type="text" id="jyyl" name="jy.jyyl" class="input-text lh30" value="${jy.jyyl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检疫项目：</td>
					<td class="">
						<input type="text" id="jyxm" name="jy.jyxm" class="input-text lh30" value="${jy.jyxm}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">疫苗名称：</td>
					<td class="">
						<input type="text" id="ymmc" name="jy.ymmc" class="input-text lh30" value="${jy.ymmc}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检疫类型：</td>
					<td class="">
						<input type="text" id="jylx" name="jy.jylx" class="input-text lh30" value="${jy.jylx}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">使用剂量：</td>
					<td class="">
						<input type="text" id="syjl" name="jy.syjl" class="input-text lh30" value="${jy.syjl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">批号：</td>
					<td class="">
						<input type="text" id="ph" name="jy.ph" class="input-text lh30" value="${jy.ph}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">制造商：</td>
					<td class="">
						<input type="text" id="zzs" name="jy.zzs" class="input-text lh30" value="${jy.zzs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">结果：</td>
					<td class="">
						<input type="text" id="jg" name="jy.jg" class="input-text lh30" value="${jy.jg}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">兽医：</td>
					<td class="">
						<input type="text" id="sytxt" readonly="readonly" class="input-text lh30" value="${jy.sy}" size="35">
						<input type="hidden" id="sy" name="jy.sy" value="${jy.sy}">
						&nbsp;<a id="selectsy" onclick="ygSelect('selectsy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="jy.bz" cols="80" rows="10" class="textarea">${jy.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jbfy/jyxx!save.action" name="frmjyxx" class="btn btn82 btn_add" type="button" value=" <s:if test="jy==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
 	<script type="text/javascript">
     	showmap("疾病防疫管理 > 新增检疫信息");
     	function validata() {
			if (IsNull("nzbh", 0)) {
				alert("请填写牛只编号！");
				return false;
			}
			return true;
		}

		function savedone(data) {
			jsonResult(
					data,
					function(data) {
						if (data["error"] == 0)
							window.location.href = "${pageContext.request.contextPath}/master/jbfy/jyxx.action";
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
