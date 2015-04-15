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
						<td>所属圈舍</td>
						<td align="left">
							<select id="js" name="nz.js" class="txt vm" ><option value="">请选择所属圈舍</option></select>
							<span style='color:red;'>*必填</span>
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
						<td>母亲牛只</td>
						<td align="left"><input type="text" id="bz" name="nz.bz" value=""></td>
					</tr>
				</tbody>
			</table>
			</form>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/ncgl/ncgl!save.action" name="frmncxx" class="blueBtn" type="button" value=" 确认新增 "/>
			</div>
     	</div>
     </div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YDistrict3.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	
     	var district=new YDistrict({
			"YDistrict.SHENG":{"id":"sheng"},
			"YDistrict.SHI":{"id":"shi"},
			"YDistrict.XIAN":{"id":"xian"},
			"init":true
		});
     	
     	function validata()
     	{
     		$("#ssqy").val(district.getSelectValue());
     		if(IsNull("ncmc",0))
     		{
     			alert("请填写牛场名称！");
     			return false;
     		}
     		else if(IsNull("ncxz",0))
     		{
     			alert("请填写牛场性质！");
     			return false;
     		}
     		else if(IsNull("ncdz",0))
     		{
     			alert("请填写牛场地址！");
     			return false;
     		}
     		else if(IsNull("ssqy",0))
     		{
     			alert("请填写牛场的所属区域！");
     			return false;
     		}
     		else if(IsNull("snqy",0))
     		{
     			alert("请填写牛场的收奶企业！");
     			return false;
     		}
     		else if(IsNull("fzr",0))
     		{
     			alert("请填写牛场的负责人！");
     			return false;
     		}
     		else if(IsNull("fzrdh",0))
     		{
     			alert("请填写牛场的负责人电话！");
     			return false;
     		}
     		else if(IsNull("lxr",0))
     		{
     			alert("请填写牛场的联系人！");
     			return false;
     		}
     		else if(IsNull("lxrdh",0))
     		{
     			alert("请填写牛场的联系人电话！");
     			return false;
     		}
     		else if(IsNull("pzy",0))
     		{
     			alert("请填写牛场的配种员！");
     			return false;
     		}
     		else if(IsNull("pzhdg",0))
     		{
     			alert("请填写牛场的配种员电话！");
     			return false;
     		}
     		else if(IsNull("fqxtsybz",0))
     		{
     			alert("请填写牛场的发情系统标志！");
     			return false;
     		}
     		else if(IsNull("kssysj",0))
     		{
     			alert("请填写牛场的开始使用时间！");
     			return false;
     		}
     		else if(IsNull("tzsysj",0))
     		{
     			alert("请填写牛场的到期使用时间！");
     			return false;
     		}
     		else if(IsNull("lxyx",0))
     		{
     			alert("请填写牛场的联系邮箱！");
     			return false;
     		}
     		else if(IsNull("kddz",0))
     		{
     			alert("请填写牛场的快递地址！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/ncgl/ncgl.action";
     		});
     	}
     </script>
  </body>
</html>