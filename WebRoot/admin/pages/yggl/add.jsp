<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
		<form id="frmygxx" class="jqtransform">
				<input type="hidden" name="js.xh" value="${js.xh}">
				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">员工编号：</td>
						<td class="">
							<input type="text" id="ygbh" name="yg.ygbh" class="input-text lh30" value="${yg.ygbh}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">员工名称：</td>
						<td class="">
							<input type="text" id="ygmc" name="yg.ygmc" class="input-text lh30" value="${yg.ygmc}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">员工类别：</td>
						<td class="">
							<input type="text" id="yglb" name="yg.yglb" class="input-text lh30" value="${yg.yglb}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">证件号码：</td>
						<td class="">
							<input type="text" id="zjhm" name="yg.zjhm" class="input-text lh30" value="${yg.zjhm}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">联系电话：</td>
						<td class="">
							<input type="text" id="lxdh" name="yg.lxdh" class="input-text lh30" value="${yg.lxdh}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">联系地址：</td>
						<td class="">
							<input type="text" id="lxdz" name="yg.lxdz" class="input-text lh30" value="${yg.lxdz}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					
					<tr>
						<td class="td_right">备注信息：</td>
						<td class="">							
							<textarea id="bz" name="js.bz" cols="80" rows="10" class="textarea">${js.bz}</textarea>
						</td>
					</tr>
  				</table>
  		</form>
	</div>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/yggl/ygxx!save.action" name="frmygxx" class="btn btn82 btn_add" type="button" value=" <s:if test="yg==null">新增</s:if><s:else>更新</s:else> "/>
			</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
     <script type="text/javascript">
     	showmap("员工信息管理 > <s:if test="yg==null">新增</s:if><s:else>更新</s:else>员工信息");
     	function validata()
     	{
     		if(IsNull("ygbh",0))
     		{
     			alert("请填写员工编号！");
     			return false;
     		}
     		else if(IsNull("ygmc",0))
     		{
     			alert("请填写员工名称！");
     			return false;
     		}
     		else if(IsNull("yglb",0))
     		{
     			alert("请填写员工类别！");
     			return false;
     		}
     		else if(IsNull("zjhm",0))
     		{
     			alert("请填写员工证件号码！");
     			return false;
     		}
     		else if(IsNull("lxdh",0))
     		{
     			alert("请填写员工联系电话！");
     			return false;
     		}
     		else if(IsNull("lxdz",0))
     		{
     			alert("请填写员工联系地址！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/yggl/ygxx.action";
     		});
     	}
     	
     </script>
  </body>
</html>