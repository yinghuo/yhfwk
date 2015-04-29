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
     		<form id="frmfqdj">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增发情登记信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>牛只编号</td>
						<td align="left"><input type="text" id="nzbh" name="fq.nzbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发情时间</td>
						<td align="left"><input type="text" id="fqsj" name="fq.fqsj" value="" readonly="readonly" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发情类型</td>
						<td align="left"><input type="text" id="fqlx" name="fq.fqlx" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发现方式</td>
						<td align="left"><input type="text" id="fxfs" name="fq.fxfs" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发现人</td>
						<td align="left"><input type="text" id="fxr" name="fq.fxr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>审核员</td>
						<td align="left"><input type="text" id="shy" name="fq.shy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>是否配种</td>
						<td align="left">
							<select id="sfpz" name="fq.sfpz" class="txt vm" >
								<option value="">选择是否配种</option>
								<option value="是">是</option>
								<option value="否">否</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>未配原因</td>
						<td align="left"><input type="text" id="wpyy" name="fq.wpyy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>备注</td>
						<td align="left"><input type="text" id="bz" name="fq.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="1comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/fqdj!save.action" name="frmfqdj" class="blueBtn" type="button" value=" 确认新增 "/>
			</div>
     	</div>
     </div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	showmap("发情信息管理 > 新增发情信息");
     	
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
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/fqdj.action";
     		});
     	}
     </script>
  </body>
</html>