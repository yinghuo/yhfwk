<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/importResource.jsp'%>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
  </head>
  <body>
     <div class="centerRightContainer">
     	<div class="centerRight">
     		<h6 id="NavMap"></h6>
     		<form id="frmnzxx">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增牛只转舍记录</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr align="left">
						<td colspan="2" style="font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;转出牛只信息</td>
					</tr>
					<tr>
						<td>牛只编号</td>
						<td align="left"><s:property value="nz.nzbh"/></td>
						<input type="hidden" name="" value="<s:property value="nz.xh"/>"/>
					</tr>
					<tr>
						<td>电子耳标编号</td>
						<td align="left"><s:property value="nz.ebbh"/></td>
					</tr>
					<tr>
						<td>计步器编号</td>
						<td align="left"><s:property value="nz.jbqbh"/></td>
					</tr>
					<tr>
						<td>当前所属牛场</td>
						<td align="left">
							1111111111
						</td>
					</tr>
					<tr>
						<td>当前所属圈舍</td>
						<td align="left"><s:property value="nz.jsjbxx.jsmc"/></td>
					</tr>
					<tr align="left">
						<td colspan="2" style="font-weight:bold;">&nbsp;&nbsp;&nbsp;&nbsp;转入圈舍信息</td>
					</tr>
					<tr>
						<td>转入牛场</td>
						<td align="left">
							<select id="nc" name="nz.ncbh" class="txt vm" ><option value="">请选择转入牛场</option></select>
							<span style='color:red;'>*必填</span>
							<div style="display:none" id="widgetData_loadnc" url="${pageContext.request.contextPath}/master/ncgl/ncgl!loadname.action" callfunction=",loadncdone,"></div>
						</td>
					</tr>
					<tr>
						<td>转入圈舍</td>
						<td align="left">
							<select id="js" name="nz.js" class="txt vm" ><option value="">请选择转入圈舍</option></select>
							<span style='color:red;'>*必填</span>
							<div style="display:none" auto="false" id="widgetData_loadjs" url="${pageContext.request.contextPath}/master/jsgl/jsgl!loadname.action" callfunction=",loadjsdone,"></div>
						</td>
					</tr>
					<tr>
						<td>备注信息</td>
						<td align="left"><input type="text" id="bz" name="nz.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="1comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/nzgl/nzxx!save.action" name="frmnzxx" class="blueBtn" type="button" value=" 确认转舍 "/>
			</div>
     	</div>
     </div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	
     	function validata()
     	{
     		if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}
     		else if(IsNull("js",0))
     		{
     			alert("请选择牛只的圈舍！");
     			return false;
     		}
     		else if(IsNull("ebbh",0))
     		{
     			alert("请填写牛只耳标编号！");
     			return false;
     		}
     		else if(IsNull("jbqbh",0))
     		{
     			alert("请填写牛只计步器编号！");
     			return false;
     		}
     		else if(IsNull("csrq",0))
     		{
     			alert("请填写牛只的出生日期！");
     			return false;
     		}
     		else if(IsNull("xb",0))
     		{
     			alert("请选择牛只的性别！");
     			return false;
     		}
     		else if(IsNull("lb",0))
     		{
     			alert("请选择牛只的类别！");
     			return false;
     		}
     		else if(IsNull("rqlx",0))
     		{
     			alert("请选择牛只的入群类型！");
     			return false;
     		}
     		else if(IsNull("yl",0))
     		{
     			alert("请填写牛只的月龄！");
     			return false;
     		}
     		else if(IsNull("csz",0))
     		{
     			alert("请填写牛只的出生重量！");
     			return false;
     		}
     		else if(IsNull("pz",0))
     		{
     			alert("请填写牛只的品种！");
     			return false;
     		}
     		else if(IsNull("ms",0))
     		{
     			alert("请填写牛只的毛色！");
     			return false;
     		}
     		else if(IsNull("tc",0))
     		{
     			alert("请填写牛只的胎次！");
     			return false;
     		}
     		else if(IsNull("cdrq",0))
     		{
     			alert("请填写牛只的到产犊日期！");
     			return false;
     		}
     		else if(IsNull("fqh",0))
     		{
     			alert("请选择牛只的父亲！");
     			return false;
     		}
     		else if(IsNull("mqh",0))
     		{
     			alert("请选择牛只的母亲！");
     			return false;
     		}
     		else if(IsNull("mrzt",0))
     		{
     			alert("请填写牛只的泌乳状态！");
     			return false;
     		}
     		else if(IsNull("fzzt",0))
     		{
     			alert("请填写牛只的繁殖状态！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/nzgl/nzxx.action";
     		});
     	}
     	
     	function loadncdone(data)
     	{
     		if(data)
     		{
     			var selectControl=document.getElementById("nc");
     			for(var i=0;i<data.length;i++)
				{
					var items=data[i];
					var optionItem=new Option(items.name,items.id);
					selectControl.options.add(optionItem);
				}
     		}
     	}
     	
     	function loadjsdone(data)
     	{
     		var selectControl=document.getElementById("js");
     		selectControl.options.length = 1;
     		if(data)
     		{
     			for(var i=0;i<data.length;i++)
				{
					var items=data[i];
					var optionItem=new Option(items.name,items.id);
					selectControl.options.add(optionItem);
				}
     		}
     	}
     	
     	$("#nc").on("change",function(e){
     		$("#widgetData_loadjs").attr("data","ncbh="+$("#nc").val());
     		$("#widgetData_loadjs").trigger("loaddata");
     	});
     	
     	window.parent.window.frames["leftFrame"].selectMenu("2124e606-2184-4d92-af67-fee9e292fe57");
     </script>
  </body>
</html>