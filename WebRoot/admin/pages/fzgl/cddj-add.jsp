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
     		<form id="frmcddj">
     		<table>
				<thead>
					<tr>
						<th colspan="3" class="borderRightNone">
							<label>新增产犊登记信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>牛只编号</td>
						<td align="left"><input type="text" id="nzbh" name="cd.nzbh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>产犊时间</td>
						<td align="left"><input type="text" id="cdsj" name="cd.cdsj" value="" readonly="readonly" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>产犊类型</td>
						<td align="left"><input type="text" id="cdlx" name="cd.cdlx" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>产犊难易</td>
						<td align="left">
							<select id="cdny" name="cd.cdny" class="txt vm" >
								<option value="">请选择产犊难易程度</option>
								<option value="自产">自产</option>
								<option value="轻度助产">轻度助产</option>
								<option value="难产(产道正常)">难产(产道正常)</option>
								<option value="难产(产道拉伤)">难产(产道拉伤)</option>
								<option value="碎胎">碎胎</option>
								<option value="其他">其他</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>胎位</td>
						<td align="left">
							<select id="tw" name="cd.tw" class="txt vm" >
								<option value="">请选择胎位</option>
								<option value="01">正常</option>
								<option value="02">坐生</option>
								<option value="03">倒产</option>
								<option value="04">人工矫正</option>
								<option value="99">其他</option>
							</select>
						<span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>接产员</td>
						<td align="left"><input type="text" id="jcy" name="cd.jcy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>胎儿数量</td>
						<td align="left"><input type="text" id="tesl" name="cd.tesl" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>计步器</td>
						<td align="left"><input type="text" id="jbq" name="cd.jbq" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>协助人</td>
						<td align="left"><input type="text" id="xzr" name="cd.xzr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="1comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/cddj!save.action" name="frmcddj" class="blueBtn" type="button" value=" 确认新增 "/>
			</div>
     	</div>
     </div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	showmap("产犊信息管理 > 新增产犊信息");
     	
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
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/cddj.action";
     		});
     	}
     </script>
  </body>
</html>