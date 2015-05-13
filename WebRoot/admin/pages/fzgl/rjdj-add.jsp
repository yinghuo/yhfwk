<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
  		<form id="frmrjdj" class="jqtransform">
  			<input type="hidden" name="rj.xh" value="${rj.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbh" name="rj.nzbh" class="input-text lh30" value="${rj.nzbh}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检查日期：</td>
					<td class="">
						<input type="text" id="jcrq" name="rj.jcrq" class="input-text lh30" readonly="readonly" value="<s:date name="rj.jcrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检查类型：</td>
					<td class="">
						<select id="jclx" name="rj.jclx" class="select" >
							<option value="">请选择检查类型</option>
						<y:EnumValues value="${rj.jclx}" enumName="RJJCLX">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检查结果：</td>
					<td class="">
						<input type="text" id="jcjg" name="rj.jcjg" class="input-text lh30" value="${rj.jcjg}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检查人：</td>
					<td class="">
						<input type="text" id="jcytxt" readonly="readonly" class="input-text lh30" value="${rj.jcy}" size="35">
						<input type="hidden" id="jcy" name="rj.jcy" value="${rj.jcy}">
						&nbsp;<a id="selectjcy" onclick="ygSelect('selectjcy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">检查方式：</td>
					<td class="">
						<input type="text" id="jcfs" name="rj.jcfs" class="input-text lh30" value="${rj.jcfs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎儿状况：</td>
					<td class="">
						<input type="text" id="tszt" name="rj.tszt" class="input-text lh30" value="${rj.tszt}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎儿性别：</td>
					<td class="">
						<select id="nzxb" name="rj.nzxb" class="select" >
						<option value="">请选择胎儿性别</option>
						<y:EnumValues value="${rj.nzxb}" enumName="NZXB">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="rj.bz" cols="80" rows="10" class="textarea">${rj.bz}</textarea>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/rjdj!save.action" name="frmrjdj" class="btn btn82 btn_add" type="button" value=" <s:if test="rj==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
    <script type="text/javascript">
     	showmap("妊娠检查信息管理 > 新增妊娠检查信息");
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
     	
     	var select=new YSelect("selectjcy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		$("#jcytxt").val(t);
		 	$("#jcy").val(t);
		});
			
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
				select.show(id);
		}
     	
     </script>
  </body>
</html>