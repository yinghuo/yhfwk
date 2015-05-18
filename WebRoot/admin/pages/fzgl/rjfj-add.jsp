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
  		<form id="frmrjfj" class="jqtransform">
  			<input type="hidden" name="fj.xh" value="${fj.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${fj.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="fj.nzbh" value="${fj.nzbh}">
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">复检日期：</td>
					<td class="">
						<input type="text" id="fjrq" name="fj.fjrq" class="input-text lh30" readonly="readonly" value="<s:date name="fj.fjrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">复检结果：</td>
					<td class="">
						<input type="text" id="fjjg" name="fj.fjjg" class="input-text lh30" value="${fj.fjjg}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">复检员：</td>
					<td class="">
						<input type="text" id="fjytxt" readonly="readonly" class="input-text lh30" value="${fj.fjy}" size="35">
						<input type="hidden" id="fjy" name="fj.fjy" value="${fj.fjy}">
						&nbsp;<a id="selectfjy" onclick="ygSelect('selectfjy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎儿状况：</td>
					<td class="">
						<input type="text" id="tezk" name="fj.tezk" class="input-text lh30" value="${fj.tezk}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">牛只性别：</td>
					<td class="">
						<select id="nzxb" name="fj.nzxb" class="select" >
							<option value="">请选择牛只性别</option>
						<y:EnumValues value="${fj.nzxb}" enumName="NZXB">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="fj.bz" cols="80" rows="10" class="textarea">${fj.bz}</textarea>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/rjfj!save.action" name="frmrjfj" class="btn btn82 btn_add" type="button" value=" <s:if test="rj==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
    <script type="text/javascript">
     	showmap("妊娠检查信息管理 > 新增妊娠复检信息");
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
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/rjfj.action";
     		});
     	}
     	
     	var select=new YSelect("selectfjy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		$("#fjytxt").val(t);
		 	$("#fjy").val(t);
		},true);
			
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
				select.show(id,$("#fjytxt").val());
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