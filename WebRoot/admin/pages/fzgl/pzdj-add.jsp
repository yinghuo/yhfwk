<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<%@include file='/admin/pages/importResource.jsp'%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
</head>
<body>
	<div class="centerRightContainer">
		<div class="centerRight">
			<h6 id="NavMap"></h6>
			<form id="frmpzdj">
				<table>
					<thead>
						<tr>
							<th colspan="3" class="borderRightNone"><label>新增配种登记信息</label>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>牛只编号</td>
							<td align="left"><input type="text" id="nzbh" name="pz.nzbh"
								value=""><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>配种时间</td>
							<td align="left"><input type="text" id="pzsj" name="pz.pzsj"
								value="" readonly="readonly" onClick="WdatePicker()"><span
								style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>冻精编号</td>
							<td align="left"><input type="text" id="djbh" name="pz.djbh"
								value=""><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>冻精类型</td>
							<td align="left"><input type="text" id="djlx" name="pz.djlx"
								value=""><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>配种员</td>
							<td align="left"><input type="text" id="pzy" name="pz.pzy"
								value=""><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>发情时间</td>
							<td align="left"><input type="text" id="fqsj" name="pz.fqsj"
								value="" readonly="readonly" onClick="WdatePicker()"><span
								style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>发情类型</td>
							<td align="left"><select id="fqlx" name="pz.fqlx"
								class="txt vm">
									<option value="">选择发情类型</option>
									<option value="自然发情">自然发情</option>
									<option value="人工催情">人工催情</option>
							</select> <span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>发现方式</td>
							<td align="left"><select id="fxfs" name="pz.fxfs"
								class="txt vm">
									<option value="">选择发现方式</option>
									<option value="人工">人工</option>
									<option value="计步器">计步器</option>
							</select><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>发现人</td>
							<td align="left"><input type="text" id="fxr" name="pz.fxr"
								value=""><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>数量</td>
							<td align="left"><input type="text" id="sl" name="pz.sl"
								value=""><span style='color: red;'>*必填</span></td>
						</tr>
						<tr>
							<td>备注</td>
							<td align="left"><input type="text" id="bz" name="pz.bz"
								value=""></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone,"
					validata="validata"
					url="${pageContext.request.contextPath}/master/fzgl/pzdj!save.action"
					name="frmpzdj" class="blueBtn" type="button" value=" 确认新增 " />
			</div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YDistrict3.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
	<script type="text/javascript">
		function validata() {
			if (IsNull("nzbh", 0)) {
				alert("请填写牛只编号！");
				return false;
			}
			return true;
		}

		function savedone(data) {
			jsonResult(
					data,
					function(data) {
						if (data["error"] == 0)
							window.location.href = "${pageContext.request.contextPath}/master/fzgl/pzdj.action";
					});
		}
	</script>
</body>
</html>