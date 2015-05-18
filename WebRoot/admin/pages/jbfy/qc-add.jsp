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
  		<form id="frmqcxx" class="jqtransform">
  			<input type="hidden" name="qc.xh" value="${qc.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
	  			<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${qc.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="qc.nzbh" value="${qc.nzbh}">
						<span class="required">*必填</span>						
					</td>
				</tr>
				<tr>
					<td class="td_right">驱虫日期：</td>
					<td class="">
						<input type="text" id="qcrq" name="qc.qcrq" class="input-text lh30" readonly="readonly" value="<s:date name="qc.qcrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">驱虫方法：</td>
					<td class="">
						<input type="text" id="qcff" name="qc.qcff" class="input-text lh30" value="${qc.qcff}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">药物名称：</td>
					<td class="">
						<input type="text" id="ywmc" name="qc.ywmc" class="input-text lh30" value="${qc.ywmc}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">使用剂量：</td>
					<td class="">
						<input type="text" id="syjl" name="qc.syjl" class="input-text lh30" value="${qc.syjl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">批号：</td>
					<td class="">
						<input type="text" id="ph" name="qc.ph" class="input-text lh30" value="${qc.ph}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">制造商：</td>
					<td class="">
						<input type="text" id="zzs" name="qc.zzs" class="input-text lh30" value="${qc.zzs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">驱虫效果：</td>
					<td class="">
						<input type="text" id="qcxg" name="qc.qcxg" class="input-text lh30" value="${qc.qcxg}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">兽医：</td>
					<td class="">
						<input type="text" id="sytxt" readonly="readonly" class="input-text lh30" value="${qc.sy}" size="35">
						<input type="hidden" id="sy" name="qc.sy" value="${qc.sy}">
						&nbsp;<a id="selectsy" onclick="ygSelect('selectsy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="qc.bz" cols="80" rows="10" class="textarea">${qc.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jbfy/qcxx!save.action" name="frmqcxx" class="btn btn82 btn_add" type="button" value=" <s:if test="qc==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
 	<script type="text/javascript">
 		showmap("疾病防疫管理 > 新增驱虫信息");
     	function validata() {
			if (IsNull("nzbh", 0)) {
				alert("请填写牛只编号！");
				return false;
			}
			if (IsNull("qcrq", 0)) {
				alert("请填写驱虫日期！");
				return false;
			}
			if (IsNull("qcff", 0)) {
				alert("请填写驱虫方法！");
				return false;
			}
			if (IsNull("ywmc", 0)) {
				alert("请填写药物名称！");
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
			if (IsNull("qcxg", 0)) {
				alert("请填写驱虫效果！");
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
							window.location.href = "${pageContext.request.contextPath}/master/jbfy/qcxx.action";
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
