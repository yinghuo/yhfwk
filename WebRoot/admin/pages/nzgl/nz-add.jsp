<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/importResource.jsp'%>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
  </head>
  <body>
     <div class="centerRightContainer">
     	<div class="centerRight">
     		<form id="frmnzxx">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增牛只信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>牛只编号</td>
						<td align="left"><input type="text" id="nzbh" name="nz.nzbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>所属牛场</td>
						<td align="left">
							<select id="nc" name="nz.ncbh" class="txt vm" ><option value="">请选择所属牛场</option></select>
							<span style='color:red;'>*必填</span>
							<div style="display:none" id="widgetData_loadnc" url="${pageContext.request.contextPath}/master/ncgl/ncgl!loadname.action" callfunction=",loadncdone,"></div>
						</td>
					</tr>
					<tr>
						<td>所属圈舍</td>
						<td align="left">
							<select id="js" name="nz.js" class="txt vm" ><option value="">请选择所属圈舍</option></select>
							<span style='color:red;'>*必填</span>
							<div style="display:none" auto="false" id="widgetData_loadjs" url="${pageContext.request.contextPath}/master/jsgl/jsgl!loadname.action" callfunction=",loadjsdone,"></div>
						</td>
					</tr>
					<tr>
						<td>电子耳标编号</td>
						<td align="left"><input type="text" id="ebbh" name="nz.ebbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>计步器编号</td>
						<td align="left"><input type="text" id="jbqbh" name="nz.jbqbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>出生日期</td>
						<td align="left"><input type="text" id="csrq" name="nz.csrq" value="" readonly="readonly" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>性别</td>
						<td align="left">
							<select id="xb" name="nz.xb" class="txt vm" >
								<option value="1">公</option>
								<option value="0">母</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>类别</td>
						<td align="left">
						<select id="lb" name="nz.lb" class="txt vm" >
								<option value="">请选择牛只类别</option>
								<option value="哺乳犊牛">哺乳犊牛</option>
								<option value="断奶犊牛">断奶犊牛</option>
								<option value="育成牛">育成牛</option>
								<option value="青年牛">青年牛</option>
								<option value="泌乳牛">泌乳牛</option>
								<option value="干奶牛">干奶牛</option>
								<option value="留养公牛">留养公牛</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>入群类型</td>
						<td align="left">
							<select id="rqlx" name="nz.rqlx" class="txt vm" >
								<option value="">请选择入群类型</option>
								<option value="自繁">自繁</option>
								<option value="购买">购买</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>月龄</td>
						<td align="left"><input type="text" id="yl" name="nz.yl" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>出生重</td>
						<td align="left"><input type="text" id="csz" name="nz.csz" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>品种</td>
						<td align="left"><input type="text" id="pz" name="nz.pz" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>毛色</td>
						<td align="left"><input type="text" id="ms" name="nz.ms"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>胎次</td>
						<td align="left"><input type="text" id="tc" name="nz.tc"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>产犊日期</td>
						<td align="left"><input type="text" id="cdrq" name="nz.cdrq" value="" readonly="readonly" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>父亲牛只</td>
						<td align="left"><input type="text" id="fqh" name="nz.fqh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>母亲牛只</td>
						<td align="left"><input type="text" id="mqh" name="nz.mqh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>泌乳状态</td>
						<td align="left"><input type="text" id="mrzt" name="nz.mrzt" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>繁殖状态</td>
						<td align="left"><input type="text" id="fzzt" name="nz.fzzt" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>备注信息</td>
						<td align="left"><input type="text" id="bz" name="nz.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/nzgl/nzxx!save.action" name="frmnzxx" class="blueBtn" type="button" value=" 确认新增 "/>
			</div>
     	</div>
     </div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	showmap("牛只信息管理 > 新增牛只信息");
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
     	
     </script>
  </body>
</html>