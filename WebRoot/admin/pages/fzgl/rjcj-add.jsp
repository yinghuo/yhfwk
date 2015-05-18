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
  		<form id="frmrjcj" class="jqtransform">
  			<input type="hidden" name="rj.xh" value="${rj.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${rj.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="rj.nzbh" value="${rj.nzbh}">
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检查日期：</td>
					<td class="">
						<input type="text" id="cjrq" name="rj.cjrq" class="input-text lh30" readonly="readonly" value="<s:date name="rj.cjrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">初检结果：</td>
					<td class="">
						<select id="cjjg" name="rj.cjjg" class="select" >
							<option value="">请选择初检结果</option>
						<y:EnumValues value="${rj.cjjg}" enumName="CJJG">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">初检员：</td>
					<td class="">
						<input type="text" id="cjytxt" readonly="readonly" class="input-text lh30" value="${rj.cjy}" size="35">
						<input type="hidden" id="cjy" name="rj.cjy" value="${rj.cjy}">
						&nbsp;<a id="selectcjy" onclick="ygSelect('selectcjy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">初检方式：</td>
					<td class="">
						<select id="cjfs" name="rj.cjfs" class="select" >
							<option value="">请选择初检方式</option>
						<y:EnumValues value="${rj.cjfs}" enumName="CJFS">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="rj.bz" cols="80" rows="10" class="textarea">${rj.bz}</textarea>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/rjcj!save.action" name="frmrjcj" class="btn btn82 btn_add" type="button" value=" <s:if test="rj==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
    <script type="text/javascript">
     	showmap("妊娠检查信息管理 > 新增妊娠初检信息");
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
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/rjcj.action";
     		});
     	}
     	
     	var select=new YSelect("selectcjy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		$("#cjytxt").val(t);
		 	$("#cjy").val(t);
		},true);
			
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
				select.show(id,$("#cjytxt").val());
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