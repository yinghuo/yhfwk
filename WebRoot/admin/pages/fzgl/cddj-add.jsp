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
  		<form id="frmcddj" class="jqtransform">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbh" name="cd.nzbh" class="input-text lh30" value="${cd.nzbh}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
  				<tr>
					<td class="td_right">产犊时间：</td>
					<td class="">
						<input type="text" id="cdsj" name="cd.cdsj" class="input-text lh30" readonly="readonly" value="<s:date name="cd.cdsj" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">产犊类型：</td>
					<td class="">
						<input type="text" id="cdlx" name="cd.cdlx" class="input-text lh30" value="${cd.cdlx}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">产犊难易：</td>
					<td class="">
						<select id="cdny" name="cd.cdny" class="select" >
							<option value="">请选择产犊难易程度</option>
						<y:EnumValues value="" enumName="CDNYCD">
							<option value="${value}">${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">产犊难易：</td>
					<td class="">
						<select id="tw" name="cd.tw" class="select" >
							<option value="">请选择胎位</option>
						<y:EnumValues value="" enumName="CDTW">
							<option value="${value}">${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">接产员：</td>
					<td class="">
						<input type="text" id="jcytxt" readonly="readonly" class="input-text lh30" value="${cd.jcy}" size="35">
						<input type="hidden" id="jcy" name="cd.jcy" value="${cd.jcy}">
						&nbsp;<a id="selectjcy" onclick="ygSelect('selectjcy')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎儿数量：</td>
					<td class="">
						<input type="text" id="tesl" name="cd.tesl" class="input-text lh30" value="${cd.tesl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">计步器：</td>
					<td class="">
						<input type="text" id="jbq" name="cd.jbq" class="input-text lh30" value="${cd.jbq}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">协助人：</td>
					<td class="">
						<input type="text" id="xzrtxt" readonly="readonly" class="input-text lh30" value="${cd.xzr}" size="35">
						<input type="hidden" id="xzr" name="cd.xzr" value="${cd.xzr}">
						&nbsp;<a id="selectxzr" onclick="ygSelect('selectxzr')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/cddj!save.action" name="frmcddj" class="btn btn82 btn_add" type="button" value=" <s:if test="cd==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
  	
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
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
     	
     	var select=new YSelect("selectjcy","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		
	  		if(id=="selectjcy")
	  		{
		  		$("#jcytxt").val(t);
		 		$("#jcy").val(v);
	 		}
	 		else if(id=="selectxzr")
	  		{
		  		$("#xzrtxt").val(t);
		 		$("#xzr").val(v);
	 		}
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