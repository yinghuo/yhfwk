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
  		<form id="frmlcdj" class="jqtransform">
  			<input type="hidden" name="lc.xh" value="${lc.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${lc.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="lc.nzbh" value="${lc.nzbh}">
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">流产日期：</td>
					<td class="">
						<input type="text" id="lcrq" name="lc.lcrq" class="input-text lh30" readonly="readonly" value="<s:date name="lc.lcrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">流产原因：</td>
					<td class="">
						<input type="text" id="lcyy" name="lc.lcyy" class="input-text lh30" value="${lc.lcyy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎儿类型：</td>
					<td class="">
						<input type="text" id="telx" name="lc.telx" class="input-text lh30" value="${lc.lcyy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现人：</td>
					<td class="">
						<input type="text" id="fxrtxt" readonly="readonly" class="input-text lh30" value="${lc.fxr}" size="35">
						<input type="hidden" id="fxr" name="lc.fxr" value="${lc.fxr}">
						&nbsp;<a id="selectfxr" onclick="ygSelect('selectfxr')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发现方式：</td>
					<td class="">
						<input type="text" id="fxfs" name="lc.fxfs" class="input-text lh30" value="${lc.fxfs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">核实人：</td>
					<td class="">
						<input type="text" id="hsrtxt" readonly="readonly" class="input-text lh30" value="${lc.hsr}" size="35">
						<input type="hidden" id="hsr" name="lc.hsr" value="${lc.hsr}">
						&nbsp;<a id="selecthsr" onclick="ygSelect('selecthsr')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">流产证人：</td>
					<td class="">
						<input type="text" id="lczrtxt" readonly="readonly" class="input-text lh30" value="${lc.lczr}" size="35">
						<input type="hidden" id="lczr" name="lc.lczr" value="${lc.lczr}">
						&nbsp;<a id="selectlczr" onclick="ygSelect('selectlczr')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="lc.bz" cols="80" rows="10" class="textarea">${lc.bz}</textarea>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/fzgl/lcdj!save.action" name="frmlcdj" class="btn btn82 btn_add" type="button" value=" <s:if test="lc==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
    <script type="text/javascript">
    	showmap("流产信息管理 > 新增流产信息");
     	function validata()
     	{
     		if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}
     		else if(IsNull("lcrq",0))
     		{
     			alert("请填写流产日期！");
     			return false;
     		}
     		else if(IsNull("lcyy",0))
     		{
     			alert("请填写流产原因！");
     			return false;
     		}
     		else if(IsNull("telx",0))
     		{
     			alert("请填写胎儿类型！");
     			return false;
     		}
     		else if(IsNull("fxr",0))
     		{
     			alert("请填写发现人！");
     			return false;
     		}
     		else if(IsNull("fxfs",0))
     		{
     			alert("请填写发现方式！");
     			return false;
     		}
     		else if(IsNull("hsr",0))
     		{
     			alert("请填写核实人！");
     			return false;
     		}
     		else if(IsNull("lczr",0))
     		{
     			alert("请填写流产证人！");
     			return false;
     		}
     		
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/fzgl/lcdj.action";
     		});
     	}
     	
     	var select=new YSelect("selectfxr","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		
	  		if(id=="selectfxr")
	  		{
		  		$("#fxrtxt").val(t);
		 		$("#fxr").val(t);
	 		}
	 		else if(id=="selecthsr")
	  		{
		  		$("#hsrtxt").val(t);
		 		$("#hsr").val(t);
	 		}
	 		else if(id=="selectlczr")
	  		{
		  		$("#lczrtxt").val(t);
		 		$("#lczr").val(t);
	 		}
		},true);
			
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
			{
				if(id=="selectfxr")
		  		{
			  		select.show(id,$("#fxrtxt").val());
		 		}
		 		else if(id=="selecthsr")
		  		{
			  		select.show(id,$("#hsrtxt").val());
		 		}
		 		else if(id=="selectlczr")
		  		{
			  		select.show(id,$("#lczrtxt").val());
		 		}
			}				
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