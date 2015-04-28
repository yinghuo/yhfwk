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
     		<form id="frmlcdj">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增流产登记信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>牛只编号</td>
						<td align="left"><input type="text" id="nzbh" name="cd.nzbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>流产日期</td>
						<td align="left"><input type="text" id="lcrq" name="lc.lcrq" value="" readonly="readonly" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>流产原因</td>
						<td align="left"><input type="text" id="lcyy" name="lc.lcyy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>胎儿类型</td>
						<td align="left"><input type="text" id="telx" name="lc.telx" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发现人</td>
						<td align="left"><input type="text" id="fxr" name="lc.fxr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发现方式</td>
						<td align="left"><input type="text" id="fxfs" name="lc.fxfs" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>核实人</td>
						<td align="left"><input type="text" id="hsr" name="lc.hsr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>流产证人</td>
						<td align="left"><input type="text" id="lczr" name="lc.lczr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>备注</td>
						<td align="left"><input type="text" id="bz" name="lc.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/lcdj!save.action" name="frmlcdj" class="blueBtn" type="button" value=" 确认新增 "/>
			</div>
     	</div>
     </div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YDistrict3.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
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
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/lcdj.action";
     		});
     	}
     </script>
  </body>
</html>