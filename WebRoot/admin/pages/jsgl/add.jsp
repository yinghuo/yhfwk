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
     		<h6 id="NavMap"></h6>
     		<form id="frmncxx">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增圈舍信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>圈舍编号</td>
						<td align="left"><input type="text" id="jsbh" name="js.jsbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>圈舍名称</td>
						<td align="left"><input type="text" id="jsmc" name="js.jsmc" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>圈舍类型</td>
						<td align="left"><input type="text" id="jslb" name="js.jslb" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>所属牛场</td>
						<td align="left">
						<select id="nc" name="js.ncbh" class="txt vm" ><option value="">请选择所属牛场</option></select>
						<div style="display:none" id="widgetData_loadnc" url="${pageContext.request.contextPath}/master/ncgl/ncgl!loadname.action" callfunction=",loadncdone,"></div>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>备注信息</td>
						<td align="left"><input type="text" id="bz" name="js.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jsgl/jsgl!save.action" name="frmncxx" class="blueBtn" type="button" value=" 确认新增 "/>
			</div>
     	</div>
     </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	function validata()
     	{
     		if(IsNull("jsbh",0))
     		{
     			alert("请填写圈舍编号！");
     			return false;
     		}
     		else if(IsNull("jsmc",0))
     		{
     			alert("请填写圈舍名称！");
     			return false;
     		}
     		else if(IsNull("jslb",0))
     		{
     			alert("请填写圈舍类别！");
     			return false;
     		}
     		else if(IsNull("nc",0))
     		{
     			alert("请选择所属牛场！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/jsgl/jsgl.action";
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
     	
     </script>
  </body>
</html>