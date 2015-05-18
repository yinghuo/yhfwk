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
  		<form id="frmgndj" class="jqtransform">
  			<input type="hidden" name="gn.xh" value="${gn.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
	  			<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="gn.nzbh" value="${gn.nzbh}">
						<span class="required">*必填</span>						
					</td>
				</tr>
				<tr>
					<td class="td_right">干奶日期：</td>
					<td class="">
						<input type="text" id="gnrq" name="gn.gnrq" class="input-text lh30" readonly="readonly" value="<s:date name="gn.gnrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">干奶方法：</td>
					<td class="">
						<input type="text" id="gnff" name="gn.gnff" class="input-text lh30" value="${gn.gnff}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">使用药物：</td>
					<td class="">
						<input type="text" id="syyw" name="gn.syyw" class="input-text lh30" value="${gn.syyw}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">兽医：</td>
					<td class="">
						<input type="text" id="sytxt" readonly="readonly" class="input-text lh30" value="${gn.sy}" size="35">
						<input type="hidden" id="sy" name="gn.sy" value="${gn.sy}">
						&nbsp;<a id="selectsy" onclick="ygSelect('selectsy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="gn.bz" cols="80" rows="10" class="textarea">${gn.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/gndj!save.action" name="frmgndj" class="btn btn82 btn_add" type="button" value=" <s:if test="gn==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script type="text/javascript">
		showmap("繁殖信息管理 > 新增干奶信息");
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
							window.location.href = "${pageContext.request.contextPath}/master/fzgl/gndj.action";
					});
		}
		
		var select=new YSelect("selectsy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		if(id=="selectsy")
	  		{
		  		$("#sytxt").val(t);
		 		$("#sy").val(t);
	 		}
		},false);
		
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
			if(nzList)
			{
				if(nzList.length>0)
				{
					//只有一个唯一的值
					var nzxx=nzList[0];
					$("#nzbhtxt").val(nzxx[1]);
					$("#nzbh").val(nzxx[0]);
				}
				/*else
				{
					//存在多个值
					$("#nzbhtxt").val("");
					$("#nzbh").val("");
				}*/
			}
			nzselect.hiden();
		}

	</script>
</body>
</html>