<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<s:set name="ncxx" value="#session.uncxx"></s:set>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
		<div id="forms" class="mt10">
			<div class="box_center">
				<form id="frmncxx" class="jqtransform">
					32<input type="hidden" id="ncbh" name="nc.ncbh" value="${ncxx.ncbh}">
					<table class="form_table pt15 pb15" border="0" cellpadding="0"
						cellspacing="0">
						<tr>
							<td class="td_right">牛场名称：</td>
							<td class="">
								
								<input type="text" id="ncmc" name="nc.ncmc" class="input-text lh30" value="${ncxx.ncmc}" size="80"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">牛场性质：</td>
							<td class="">
								<input type="text" id="ncxz" name="nc.ncxz" class="input-text lh30" size="80" value="${ncxx.ncxz}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">牛场地址：</td>
							<td class="">
								<input type="text" id="ncdz" name="nc.ncdz" class="input-text lh30" size="80" value="${ncxx.ncdz}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">牛场所属区域：</td>
							<td class="">
								 <select id="sheng" class="select" > <option value="">请选择省</option></select>
							 	 <select id="shi" class="select" ><option value="0">请选择市</option></select>
							 	 <select id="xian" class="select" ><option value="0">请选择县</option></select>
								 <input type="hidden" id="ssqy" name="nc.ssqy" value=""><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">收奶企业：</td>
							<td class="">
								<input type="text" id="snqy" name="nc.snqy" class="input-text lh30" size="80" value="${ncxx.snqy}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">负责人：</td>
							<td class="">
								<input type="text" id="fzr" name="nc.fzr" class="input-text lh30" size="80" value="${ncxx.fzr}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">负责人电话：</td>
							<td class="">
								<input type="text" id="fzrdh" name="nc.fzrdh" class="input-text lh30" size="80" value="${ncxx.fzrdh}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">联系人：</td>
							<td class="">
								<input type="text" id="lxr" name="nc.lxr" class="input-text lh30" size="80" value="${ncxx.lxr}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">联系人电话：</td>
							<td class="">
								<input type="text" id="lxrdh" name="nc.lxrdh" class="input-text lh30" size="80" value="${ncxx.lxrdh}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">配种员：</td>
							<td class="">
								<input type="text" id="pzy" name="nc.pzy" class="input-text lh30" size="80" value="${ncxx.pzy}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">配种员电话：</td>
							<td class="">
								<input type="text" id="pzhdg" name="nc.pzhdg" class="input-text lh30" size="80" value="${ncxx.pzhdg}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">发情系统使用标志：</td>
							<td class="">
								<input type="text" maxlength="1" id="fqxtsybz" name="nc.fqxtsybz" class="input-text lh30" size="80" value="${ncxx.fqxtsybz}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">开始使用时间：</td>
							<td class="">
								<input type="text" id="kssysj" name="nc.kssysj" class="input-text lh30" size="80" value="<fmt:formatDate value="${ncxx.kssysj}" pattern="yyyy-MM-dd"/>" readonly="true" onClick="WdatePicker()"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">使用到期时间：</td>
							<td class="">
								<input type="text" id="tzsysj" name="nc.tzsysj" class="input-text lh30" size="80" value="<fmt:formatDate value="${ncxx.tzsysj}" pattern="yyyy-MM-dd"/>" readonly="true" onClick="WdatePicker()"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">联系邮箱：</td>
							<td class="">
								<input type="text" id="lxyx" name="nc.lxyx" class="input-text lh30" size="80" value="${ncxx.lxyx}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">快递地址：</td>
							<td class="">
								<input type="text" id="kddz" name="nc.kddz" class="input-text lh30" size="80" value="${ncxx.kddz}"><span class="required">*必填</span>
							</td>
						</tr>
						<tr>
							<td class="td_right">备注信息：</td>
							<td class="">							
								<textarea id="bz" name="nc.bz" cols="80" rows="10" class="textarea">${ncxx.bz}</textarea>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="btns">
			<input type="button" id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/ncgl/ncgl!save.action" name="frmncxx"  class="btn btn82 btn_add" value="更新">
		</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YDistrict3.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	showmap("我的基础数据> 编辑我的牛场信息");
     	var district=new YDistrict({
			"YDistrict.SHENG":{"id":"sheng"},
			"YDistrict.SHI":{"id":"shi"},
			"YDistrict.XIAN":{"id":"xian"},
			"init":true,
			"initvalue":"${ncxx.ssqy}"
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
     				window.location.href="${pageContext.request.contextPath}/admin/pages/ncgl/me.jsp";
     		});
     	}
     </script>
  </body>
</html>