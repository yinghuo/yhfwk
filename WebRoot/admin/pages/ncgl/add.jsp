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
							<label>新增牛场信息</label>
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>牛场名称</td>
						<td align="left"><input type="text" id="ncmc" name="nc.ncmc" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>牛场性质</td>
						<td align="left"><input type="text" id="ncxz" name="nc.ncxz" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>牛场地址</td>
						<td align="left"><input type="text" id="ncdz" name="nc.ncdz" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>牛场所属区域</td>
						<td align="left">
							 <select id="sheng" class="txt vm" > <option value="">请选择省</option></select>
						 	 <select id="shi" class="txt vm" ><option value="0">请选择市</option></select>
						 	 <select id="xian" class="txt vm" ><option value="0">请选择县</option></select>
							 <input type="hidden" id="ssqy" name="nc.ssqy" value=""><span style='color:red;'>*必填</span>
						</td>
					</tr>
					<tr>
						<td>收奶企业</td>
						<td align="left"><input type="text" id="snqy" name="nc.snqy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>负责人</td>
						<td align="left"><input type="text" id="fzr" name="nc.fzr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>负责人电话</td>
						<td align="left"><input type="text" id="fzrdh" name="nc.fzrdh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>联系人</td>
						<td align="left"><input type="text" id="lxr" name="nc.lxr" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>联系人电话</td>
						<td align="left"><input type="text" id="lxrdh" name="nc.lxrdh" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>配种员</td>
						<td align="left"><input type="text" id="pzy" name="nc.pzy" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>配种员电话</td>
						<td align="left"><input type="text" id="pzhdg" name="nc.pzhdg" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>发情系统使用标志</td>
						<td align="left"><input type="text" maxlength="1" id="fqxtsybz" name="nc.fqxtsybz" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>开始使用时间</td>
						<td align="left"><input type="text" id="kssysj" name="nc.kssysj" readonly="true" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>使用到期时间</td>
						<td align="left"><input type="text" id="tzsysj" name="nc.tzsysj" readonly="true" onClick="WdatePicker()"><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>联系邮箱</td>
						<td align="left"><input type="text" id="lxyx" name="nc.lxyx" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>快递地址</td>
						<td align="left"><input type="text" id="kddz" name="nc.kddz" value=""><span style='color:red;'>*必填</span></td>
					</tr>
					<tr>
						<td>备注信息</td>
						<td align="left"><input type="text" id="bz" name="nc.bz" value=""></td>
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