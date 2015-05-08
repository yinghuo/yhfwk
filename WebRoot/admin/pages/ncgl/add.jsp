<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
  		<form id="frmncxx" class="jqtransform">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛场编号：</td>
					<td class="">
						<input type="text" id="ncbh" name="nc.ncbh" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">牛场名称：</td>
					<td class="">
						<input type="text" id="ncmc" name="nc.ncmc" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">所属区域：</td>
					<td class="">
						<select id="sheng" class="select" > <option value="">请选择省</option></select>
						<select id="shi" class="select" ><option value="0">请选择市</option></select>
						<select id="xian" class="select" ><option value="0">请选择县</option></select>
						<span class="required">*必填</span>
						<input type="hidden" id="ssqy" name="nc.ssqy" value="">
					</td>
				</tr>
				<tr>
					<td class="td_right">牛场地址：</td>
					<td class="">
						<input type="text" id="ncdz" name="nc.ncdz" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>				
				<tr>
					<td class="td_right">收奶企业：</td>
					<td class="">
						<input type="text" id="snqy" name="nc.snqy" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">负责人：</td>
					<td class="">
						<input type="text" id="fzr" name="nc.fzr" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">负责人电话：</td>
					<td class="">
						<input type="text" id="fzrdh" name="nc.fzrdh" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">联系人：</td>
					<td class="">
						<input type="text" id="lxr" name="nc.lxr" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">联系人电话：</td>
					<td class="">
						<input type="text" id="lxrdh" name="nc.lxrdh" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">授权开始时间：</td>
					<td class="">
						<input type="text" id="kssysj" name="nc.kssysj" readonly="true" onClick="WdatePicker()" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">使用到期时间：</td>
					<td class="">
						<input type="text" id="tzsysj" name="nc.tzsysj" readonly="true" onClick="WdatePicker()" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">管理员账号：</td>
					<td class="">
						<input type="text" id="uloginname" name="u.uloginname" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">管理员密码：</td>
					<td class="">
						<input type="password" id="upassword" name="u.upassword" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">确认密码：</td>
					<td class="">
						<input type="password" id="upassword2" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">管理员电话：</td>
					<td class="">
						<input type="text" id="phonenum" name="u.userInfo.phonenum" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">管理员邮箱：</td>
					<td class="">
						<input type="text" id="email" name="u.userInfo.email" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input type="button" id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/ncgl/ncgl!save.action" name="frmncxx"  class="btn btn82 btn_add" value=" 授权 ">
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YDistrict3.js"></script>
     <script type="text/javascript">
     	showmap("牧场信息管理 > 新增牛场授权");
     	var district=new YDistrict({
			"YDistrict.SHENG":{"id":"sheng"},
			"YDistrict.SHI":{"id":"shi"},
			"YDistrict.XIAN":{"id":"xian"},
			"init":true
		});
     	function validata()
     	{
     		$("#ssqy").val(district.getSelectValue());
     		if(IsNull("ncbh",0))
     		{
     			alert("请填写牛场编号！");
     			return false;
     		}
     		else if(IsNull("ncmc",0))
     		{
     			alert("请填写牛场名称！");
     			return false;
     		}
     		else if(IsNull("ssqy",0))
     		{
     			alert("请填写牛场的所属区域！");
     			return false;
     		}
     		else if(IsNull("ncdz",0))
     		{
     			alert("请填写牛场地址！");
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
     		else if(IsNull("kssysj",0))
     		{
     			alert("请填写牛场的开始授权时间！");
     			return false;
     		}
     		else if(IsNull("tzsysj",0))
     		{
     			alert("请填写牛场的到期使用时间！");
     			return false;
     		}
     		else if(IsNull("uloginname",0))
     		{
     			alert("请填写牛场的管理员账号！");
     			return false;
     		}
     		else if(IsNull("upassword",global_password_length))
     		{
     			alert("请填写牛场的管理员密码，且密码长度不能小于"+global_password_length+"！");
     			return false;
     		}
     		else if(IsNull("upassword2",0))
     		{
     			alert("请填写确认密码！");
     			return false;
     		}
     		else if(!IsEqual("upassword","upassword2"))
     		{
     			alert("两次密码不相等，请确认密码是否正确！");
     			return false;
     		}
     		else if(IsNull("phonenum",0))
     		{
     			alert("请填写管理员的联系电话！");
     			return false;
     		}
     		else if(IsNull("email",0))
     		{
     			alert("请填写管理员的电子邮箱地址！");
     			return false;
     		}
     		else if(!IsEmail("email"))
     		{
     			alert("请正确填写管理员的电子邮箱地址！");
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