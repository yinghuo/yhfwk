<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
	<body>
  		<div class="box_center mt10">
  			<form id="frmzsxx" class="jqtransform">
  				<input type="hidden" name="zs.nzxh" value="${nz.xh}">			
  				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  					<tr>
						<td class="td_right">牛只编号：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.nzbh}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">电子耳标编号：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.ebbh}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">当前圈舍：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.jsjbxx.jsmc}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">转入圈舍：</td>
						<td class="">
							<select id="zrjs" name="zs.zrjs" class="select">
								<option value="">请选择转入圈舍</option>
							</select>
							<div style="display:none" id="widgetData_loadjs" url="${pageContext.request.contextPath}/master/jsgl/jsgl!loadname.action?ncbh=me" callfunction=",loadjsdone,"></div>
							<span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">转舍日期：</td>
						<td class="">
							<input type="text" id="zsrq" name="zs.zsrq" class="input-text lh30" readonly="readonly" value="" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
					<td class="td_right">经手人：</td>
						<td class="">
							<input type="text" id="jsrtxt" readonly="readonly" class="input-text lh30" value="" size="35">
							<input type="hidden" id="jsr" name="zs.jsr">
							&nbsp;<a id="selectBtn" onclick="ygSelect()" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">备注信息：</td>
						<td class="">
							<textarea id="bz" name="zs.bz" cols="50" rows="10" class="textarea"></textarea>
						</td>
					</tr>
  				</table>
  			</form>
  		</div>
  		<div class="btns">
			<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/nzgl/zsxx!save.action" name="frmzsxx" class="btn btn82 btn_add" type="button" value=" 登记 "/>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
     	<script type="text/javascript">
     		showmap("牛只信息管理 > 牛只转舍登记");
	     	function validata()
	     	{
	     		if(IsNull("zrjs",0))
	     		{
	     			alert("请选择转入圈舍！");
	     			return false;
	     		}
	     		else if(IsNull("zsrq",0))
	     		{
	     			alert("请填写转舍日期！");
	     			return false;
	     		}
	     		else if(IsNull("jsr",0))
	     		{
	     			alert("请填写经手人！");
	     			return false;
	     		}
	     		return true;
	     	}
	     
	     	function savedone(data)
	     	{
	     		jsonResult(data,function(data){
	     			if(data["error"]==0)
	     				window.location.href="${pageContext.request.contextPath}/master/nzgl/zsxx.action";
	     		});
	     	}
	     	
	     	function loadjsdone(data)
	     	{
	     		var selectControl=document.getElementById("zrjs");
	     		var defval="${nz.js}";
	     		selectControl.options.length = 1;
	     		if(data)
	     		{
	     			for(var i=0;i<data.length;i++)
					{
						var items=data[i];
						if(defval!=items.id){
							var optionItem=new Option(items.name,items.id);
							selectControl.options.add(optionItem);
						}
					}
	     		}
	     	}
	     	
	     	var select=new YSelect("selectBtn","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	     		$("#jsrtxt").val(t);
	     		$("#jsr").val(v);
	     	});
			
			function ygSelect()
			{
				if(select.state())
					select.hiden();
				else
					select.show();
			}
				     	
     		window.parent.selectMenu("9881e7c2-d5ca-4d5b-b567-f2607a4951ae");
     </script>
  </body>
</html>