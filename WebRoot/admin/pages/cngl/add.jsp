<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
		<form id="frmcnxx" class="jqtransform"> 
				<input type="hidden" name="cn.xh" value="${cn.xh}">
				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">牛只编号：</td>
						<td class="">
							<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
							<input type="hidden" id="nzbh" name="cn.nzbh" value="${cn.nzbh}">
							<span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">挤奶日期：</td>
						<td class="">
							<input type="text" id="jnrq" name="cn.jnrq" readonly="readonly" class="input-text lh30" value="<s:date name="cn.jnrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
						</td>
					</tr>					
					<tr>
						<td class="td_right">早班产量：</td>
						<td class="">
							<input type="text" id="scl" name="cn.scl" class="input-text lh30" value="${cn.scl}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">午班产量：</td>
						<td class="">
							<input type="text" id="xcl" name="cn.xcl" class="input-text lh30" value="${cn.xcl}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">晚班产量：</td>
						<td class="">
							<input type="text" id="wcl" name="cn.wcl" class="input-text lh30" value="${cn.wcl}" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">备注信息：</td>
						<td class="">							
							<textarea id="bz" name="cn.bz" cols="80" rows="10" class="textarea">${cn.bz}</textarea>
						</td>
					</tr>
  				</table>
  		</form>
	</div>
			<div class="btns">
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/cngl/gtcnxx!save.action" name="frmcnxx" class="btn btn82 btn_add" type="button" value=" <s:if test="nc==null">新增</s:if><s:else>更新</s:else> "/>
			</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
    <script type="text/javascript">
     	showmap("产奶信息管理 > <s:if test="nc==null">新增</s:if><s:else>更新</s:else>个体产奶信息");
     	function validata()
     	{
     		if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}
     		else if(IsNull("jnrq",0))
     		{
     			alert("请填写挤奶日期！");
     			return false;
     		}
     		//产奶量的输入检测
     		var vale;
     		if((vale=$("#scl").val()).length>0 && isNaN(vale))
     		{
     			alert("早班的产量输入错误，必须为数字！");
     			return false;
     		}
     		
     		if((vale=$("#xcl").val()).length>0 && isNaN(vale))
     		{
     			alert("午班的产量输入错误，必须为数字！");
     			return false;
     		}
     		
     		if((vale=$("#wcl").val()).length>0 && isNaN(vale))
     		{
     			alert("晚班的产量输入错误，必须为数字！");
     			return false;
     		}
     		
     		
     		/*else if(IsNull("bc",0))
     		{
     			alert("请填写挤奶班次！");
     			return false;
     		}
     		else if(IsNull("cl",0))
     		{
     			alert("请填写挤奶产量！");
     			return false;
     		}*/
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/cngl/gtcnxx.action";
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
