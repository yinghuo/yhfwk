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
  		<form id="frmfqdj" class="jqtransform">
  			<input type="hidden" name="fq.xh" value="${fq.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
	  			<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${fq.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="fq.nzbh" value="${fq.nzbh}">
						<span class="required">*必填</span>						
					</td>
				</tr>
				<%/*<tr>
					<td class="td_right">当前情期：</td>
					<td class="">
						<div class="input-text lh30">${fq.nzjbxx.qq+1}</div>
					</td>
				</tr>*/%>
				<tr>
					<td class="td_right">发情时间：</td>
					<td class="">
						<input type="text" id="fqsj" name="fq.fqsj" class="input-text lh30" readonly="readonly" value="<s:date name="fq.fqsj" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发情类型：</td>
					<td class="">
						<select id="fqlx" name="fq.fqlx" class="select" >
							<option value="">选择发情类型</option>
						<y:EnumValues value="${fq.fqlx}" enumName="FQLX">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现方式：</td>
					<td class="">
						<select id="fxfs" name="fq.fxfs" class="select" onchange="fxfsdone()">
							<option value="">选择发现方式</option>
						<y:EnumValues value="${fq.fxfs}" enumName="FXFS">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				
				<tr id="trfxr">
					<td class="td_right">发现人：</td>
					<td class="">
						<input type="text" id="fxrtxt" readonly="readonly" class="input-text lh30" value="${fq.fxr}" size="35">
						<input type="hidden" id="fxr" name="fq.fxr" value="${fq.fxr}">
						&nbsp;<a id="selectfxr" onclick="ygSelect('selectfxr')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				
				<tr>
					<td class="td_right">审核员：</td>
					<td class="">
						<input type="text" id="shytxt" readonly="readonly" class="input-text lh30" value="${fq.shy}" size="35">
						<input type="hidden" id="shy" name="fq.shy" value="${fq.shy}">
						&nbsp;<a id="selectshy" onclick="ygSelect('selectshy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<%/*<tr>
					<td class="td_right">是否配种：</td>
					<td class="">
						<select id="sfpz" name="fq.sfpz" class="select" >
						<y:EnumValues value="${fq.sfpz}" enumName="SFPZ">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">未配原因：</td>
					<td class="">
						<input type="text" id="wpyy" name="fq.wpyy" class="input-text lh30" value="${fq.wpyy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>*/%>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="fq.bz" cols="80" rows="10" class="textarea">${fq.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/fqdj!save.action" name="frmfqdj" class="btn btn82 btn_add" type="button" value=" <s:if test="fq==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Yg.js"></script>
	<script type="text/javascript">
		showmap("发情信息管理 > 新增发情信息");
		
		<%//如果当前发情方式为计步器，则不需要发现人 %>
		fxfsdone();
		
		function validata() {
			if (IsNull("nzbh", 0)) {
				alert("请填写牛只编号！");
				return false;
			}
			else if(IsNull("fqsj",0))
     		{
     			alert("请填写发情日期！");
     			return false;
     		}
     		else if(IsNull("fqlx",0))
     		{
     			alert("请选择发情类型！");
     			return false;
     		}
     		else if(IsNull("fxfs",0))
     		{
     			alert("请选择发现方式！");
     			return false;
     		}
     		else if($("#fxfs").val()==0&&IsNull("fxr",0))
     		{
     			alert("请填写发现人！");
     			return false;
     		}
     		else if(IsNull("shy",0))
     		{
     			alert("请填写审核员！");
     			return false;
     		}
     		/*else if(IsNull("wpyy",0))
     		{
     			alert("请填写未配原因！");
     			return false;
     		}*/
     		
			return true;
		}
		
		function fxfsdone()
		{
			if($("#fxfs").val()==1)
			{
				$("#trfxr").css("display","none");
			}
			else
			{
				$("#trfxr").show();
			}
		}
		
		function savedone(data) {
			jsonResult(
					data,
					function(data) {
						if (data["error"] == 0)
							window.location.href = "${pageContext.request.contextPath}/master/fzgl/fqdj.action";
					});
		}
		
		var select=new YSelect("selectshy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		if(id=="selectshy")
	  		{
		  		$("#shytxt").val(t);
		 		$("#shy").val(t);
	 		}
	 		else if(id=="selectfxr")
	  		{
		  		$("#fxrtxt").val(t);
		 		$("#fxr").val(t);
	 		}
		},true);
		
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
			{
				if(id=="selectshy")
		  		{
			  		select.show(id,$("#shytxt").val());
		 		}
		 		else if(id=="selectfxr")
		  		{
			  		select.show(id,$("#fxrtxt").val());
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
		
		loadDef(["fxr","fxrtxt"]);
		
	</script>
</body>
</html>