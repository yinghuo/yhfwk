<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
		<form id="frmjbq" class="jqtransform">
				<input type="hidden" name="jbq.xh" value="${jbq.xh}">
				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">计步器编号：</td>
						<td class="">
							<input type="text" id="jbqbh" name="jbq.jbqbh" class="input-text lh30" value="${jbq.jbqbh}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">牛只编号：</td>
						<td class="">
							<input type="text" id="nzbhtxt" name="nzbh" onKeyup="nzSelect('nzbhtxt')" value="${jbq.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
							<input type="hidden" id="nzbh" name="jbq.nzbh" value="${jbq.nzbh}">
							<!-- <span class="required">*必填</span> -->
						</td>
					</tr>
  				</table>
  		</form>
	</div>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fqxt/jbq!save.action" name="frmjbq" class="btn btn82 btn_add" type="button" value=" <s:if test="yg==null">新增</s:if><s:else>更新</s:else> "/>
			</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
     <script type="text/javascript">
     	showmap("计步器信息管理 > <s:if test="jbq==null">新增</s:if><s:else>更新</s:else>计步器信息");
     	function validata()
     	{
     		if(IsNull("jbqbh",0))
     		{
     			alert("请填写计步器编号！");
     			return false;
     		}
     		/*else if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}*/
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/fqxt/jbq.action";
     		});
     	}
     	
     	var nzselect=new YSelect("nzbhtxt","selectNz","${pageContext.request.contextPath}/master/nzgl/nzxx!load.action",function(id,v,t){
			$("#nzbhtxt").val(t);
			$("#nzbh").val(v);
		});
		
		var nzList;
		function nzSelect(id)
		{
			//筛选过滤
			nzList=nzselect.screening($("#nzbhtxt").val());
		}
		
		function nzHiden()
		{
			if(nzList&&nzList.length>0)
			{
				var nzxx=nzList[0];
				$("#nzbhtxt").val(nzxx[1]);
				$("#nzbh").val(nzxx[0]);
			}
			nzselect.hiden();
		}
     	
     </script>
  </body>
</html>