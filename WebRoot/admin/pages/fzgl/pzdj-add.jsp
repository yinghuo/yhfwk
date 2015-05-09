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
  		<form id="frmpzdj" class="jqtransform">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbh" name="pz.nzbh" class="input-text lh30" value="${pz.nzbh}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">配种时间：</td>
					<td class="">
						<input type="text" id="pzsj" name="pz.pzsj" class="input-text lh30" readonly="readonly" value="<s:date name="pz.pzsj" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">冻精编号：</td>
					<td class="">
						<input type="text" id="djbh" name="pz.djbh" class="input-text lh30" value="${pz.djbh}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">冻精类型：</td>
					<td class="">
						<input type="text" id="djlx" name="pz.djlx" class="input-text lh30" value="${pz.djlx}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">配种员：</td>
					<td class="">
						<input type="text" id="pzytxt" readonly="readonly" class="input-text lh30" value="${pz.pzy}" size="35">
						<input type="hidden" id="pzy" name="pz.pzy" value="${pz.pzy}">
						&nbsp;<a id="selectpzy" onclick="ygSelect('selectpzy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发情时间：</td>
					<td class="">
						<input type="text" id="fqsj" name="pz.fqsj" class="input-text lh30" readonly="readonly" value="<s:date name="pz.fqsj" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发情类型：</td>
					<td class="">
						<select id="fqlx" name="pz.fqlx" class="select" >
							<option value="">选择发情类型</option>
						<y:EnumValues value="" enumName="FQLX">
							<option value="${value}">${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现方式：</td>
					<td class="">
						<select id="fxfs" name="pz.fxfs" class="select" >
							<option value="">选择发现方式</option>
						<y:EnumValues value="" enumName="FXFS">
							<option value="${value}">${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现人：</td>
					<td class="">
						<input type="text" id="fxrtxt" readonly="readonly" class="input-text lh30" value="${pz.fxr}" size="35">
						<input type="hidden" id="fxr" name="pz.fxr" value="${pz.fxr}">
						&nbsp;<a id="selectfxr" onclick="ygSelect('selectfxr')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">数量：</td>
					<td class="">
						<input type="text" id="sl" name="pz.sl" class="input-text lh30" value="${pz.sl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="pz.bz" cols="80" rows="10" class="textarea">${pz.bz}</textarea>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/pzdj!save.action" name="frmpzdj" class="btn btn82 btn_add" type="button" value=" <s:if test="pz==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript"	src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
	<script type="text/javascript">
		showmap("配种信息管理 > 新增配种信息");
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
							window.location.href = "${pageContext.request.contextPath}/master/fzgl/pzdj.action";
					});
		}
		
		var select=new YSelect("selectfxr","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		
	  		if(id=="selectfxr")
	  		{
		  		$("#fxrtxt").val(t);
		 		$("#fxr").val(v);
	 		}
	 		else if(id=="selectpzy")
	  		{
		  		$("#pzytxt").val(t);
		 		$("#pzy").val(v);
	 		}
		});
			
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
				select.show(id);
		}
		
	</script>
</body>
</html>