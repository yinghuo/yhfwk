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
     		<form id="frmrjdj">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增妊娠检查登记信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>牛只编号</td>
						<td align="left"><input type="text" id="nzbh" name="rj.nzbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>检查日期</td>
						<td align="left"><input type="text" id="jcrq" name="rj.jcrq" value="" readonly="readonly" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>检查类型</td>
						<td align="left">
							<select id="jclx" name="rj.jclx" class="txt vm" >
								<option value="">请选择检查类型</option>
								<option value="初检">初检</option>
								<option value="复检">复检</option>
								<option value="其他">其他</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>检查结果</td>
						<td align="left"><input type="text" id="jcjg" name="rj.jcjg" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>检查人</td>
						<td align="left"><input type="text" id="jcy" name="rj.jcy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>检查方式</td>
						<td align="left"><input type="text" id="jcfs" name="rj.jcfs" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>胎儿状况</td>
						<td align="left"><input type="text" id="tszt" name="rj.tszt" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>牛只性别</td>
						<td align="left">
							<select id="nzxb" name="rj.nzxb" class="txt vm" >
								<option value="">请选择牛只性别</option>
								<option value="公">公</option>
								<option value="母">母</option>
								<option value="其他">其他</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>备注</td>
						<td align="left"><input type="text" id="bz" name="rj.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/rjdj!save.action" name="frmrjdj" class="blueBtn" type="button" value=" 确认新增 "/>
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
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/rjdj.action";
     		});
     	}
     </script>
  </body>
</html>