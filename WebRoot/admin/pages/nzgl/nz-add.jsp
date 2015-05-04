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
  		<form id="frmnzxx" class="jqtransform">
  			<input type="hidden" name="nz.xh" value="${nz.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  				<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbh" name="nz.nzbh" class="input-text lh30" value="${nz.nzbh}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">所属圈舍：</td>
					<td class="">
						<select id="js" name="nz.js" class="select">
							<option value="">请选择所属圈舍</option>
						</select>
						<div style="display:none" id="widgetData_loadjs" url="${pageContext.request.contextPath}/master/jsgl/jsgl!loadname.action?ncbh=me" callfunction=",loadjsdone,"></div>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">电子耳标编号：</td>
					<td class="">
						<input type="text" id="ebbh" name="nz.ebbh" class="input-text lh30" value="${nz.ebbh}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">计步器编号：</td>
					<td class="">
						<input type="text" id="jbqbh" name="nz.jbqbh" class="input-text lh30" value="${nz.jbqbh}" size="80">
					</td>
				</tr>
				<tr>
					<td class="td_right">出生日期：</td>
					<td class="">
						<input type="text" id="csrq" name="nz.csrq" class="input-text lh30" readonly="readonly" value="<s:date name="nz.csrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">性别：</td>
					<td class="">
						<select id="xb" name="nz.xb" class="select" >
							<y:EnumValues value="" enumName="NZXB">
								<option value="${value}">${label}</option>
							</y:EnumValues>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_right">类别：</td>
					<td class="">
						<select id="lb" name="nz.lb" class="select" >
							<option value="">请选择牛只类别</option>
							<y:EnumValues value="${nz.lb}" enumName="NZLB">
								<option value="${value}" ${selected}>${label}</option>
							</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">入群类型：</td>
					<td class="">
						<select id="rqlx" name="nz.rqlx" class="select" >
							<option value="">请选择入群类型</option>
							<y:EnumValues value="${nz.rqlx}" enumName="NZRQLX">
								<option value="${value}" ${selected}>${label}</option>
							</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">月龄：</td>
					<td class="">
						<input type="text" id="yl" name="nz.yl" class="input-text lh30" value="${nz.yl}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">出生重：</td>
					<td class="">
						<input type="text" id="csz" name="nz.csz" class="input-text lh30" value="${nz.csz}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">品种：</td>
					<td class="">
						<input type="text" id="pz" name="nz.pz" class="input-text lh30" value="${nz.pz}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">毛色：</td>
					<td class="">
						<input type="text" id="ms" name="nz.ms" class="input-text lh30" value="${nz.ms}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">胎次：</td>
					<td class="">
						<input type="text" id="tc" name="nz.tc" class="input-text lh30" value="${nz.tc}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">产犊日期：</td>
					<td class="">
						<input type="text" id="cdrq" name="nz.cdrq" class="input-text lh30" readonly="readonly" value="<s:date name="nz.cdrq" format="yyyy-MM-dd HH:mm"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">父亲牛只：</td>
					<td class="">
						<input type="text" id="fqh" name="nz.fqh" class="input-text lh30" value="${nz.fqh}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">母亲牛只：</td>
					<td class="">
						<input type="text" id="mqh" name="nz.mqh" class="input-text lh30" value="${nz.mqh}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">泌乳状态：</td>
					<td class="">
						<input type="text" id="mrzt" name="nz.mrzt" class="input-text lh30" value="${nz.mrzt}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">繁殖状态：</td>
					<td class="">
						<input type="text" id="fzzt" name="nz.fzzt" class="input-text lh30" value="${nz.fzzt}" size="80"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注信息：</td>
					<td class="">
						<textarea id="bz" name="nz.bz" cols="80" rows="10" class="textarea">${nz.bz}</textarea>
					</td>
				</tr>
  			</table>
  		</form>
  	</div>
	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/nzgl/nzxx!save.action" name="frmnzxx" class="btn btn82 btn_add" type="button" value=" <s:if test="nz==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	showmap("牛只信息管理 > <s:if test="nz==null">新增</s:if><s:else>更新</s:else>牛只信息");
     	function validata()
     	{
     		if(IsNull("nzbh",0))
     		{
     			alert("请填写牛只编号！");
     			return false;
     		}
     		else if(IsNull("js",0))
     		{
     			alert("请选择牛只的圈舍！");
     			return false;
     		}
     		else if(IsNull("ebbh",0))
     		{
     			alert("请填写牛只耳标编号！");
     			return false;
     		}
     		/*else if(IsNull("jbqbh",0))
     		{
     			alert("请填写牛只计步器编号！");
     			return false;
     		}*/
     		else if(IsNull("csrq",0))
     		{
     			alert("请填写牛只的出生日期！");
     			return false;
     		}
     		else if(IsNull("xb",0))
     		{
     			alert("请选择牛只的性别！");
     			return false;
     		}
     		else if(IsNull("lb",0))
     		{
     			alert("请选择牛只的类别！");
     			return false;
     		}
     		else if(IsNull("rqlx",0))
     		{
     			alert("请选择牛只的入群类型！");
     			return false;
     		}
     		else if(IsNull("yl",0))
     		{
     			alert("请填写牛只的月龄！");
     			return false;
     		}
     		else if(IsNull("csz",0))
     		{
     			alert("请填写牛只的出生重量！");
     			return false;
     		}
     		else if(IsNull("pz",0))
     		{
     			alert("请填写牛只的品种！");
     			return false;
     		}
     		else if(IsNull("ms",0))
     		{
     			alert("请填写牛只的毛色！");
     			return false;
     		}
     		else if(IsNull("tc",0))
     		{
     			alert("请填写牛只的胎次！");
     			return false;
     		}
     		else if(IsNull("cdrq",0))
     		{
     			alert("请填写牛只的到产犊日期！");
     			return false;
     		}
     		else if(IsNull("fqh",0))
     		{
     			alert("请选择牛只的父亲！");
     			return false;
     		}
     		else if(IsNull("mqh",0))
     		{
     			alert("请选择牛只的母亲！");
     			return false;
     		}
     		else if(IsNull("mrzt",0))
     		{
     			alert("请填写牛只的泌乳状态！");
     			return false;
     		}
     		else if(IsNull("fzzt",0))
     		{
     			alert("请填写牛只的繁殖状态！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/nzgl/nzxx.action";
     		});
     	}
     	
     	<%/*function loadncdone(data)
     	{
     		if(data)
     		{
     			var selectControl=document.getElementById("nc");
     			for(var i=0;i<data.length;i++)
				{
					var items=data[i];
					var optionItem=new Option(items.name,items.id);
					selectControl.options.add(optionItem);
				}
     		}
     	}*/%>
     	
     	function loadjsdone(data)
     	{
     		var selectControl=document.getElementById("js");
     		var defval="${nz.js}";
     		selectControl.options.length = 1;
     		if(data)
     		{
     			for(var i=0;i<data.length;i++)
				{
					var items=data[i];
					var optionItem=new Option(items.name,items.id);
					if(defval&&defval==items.id)optionItem.selected=true;
					selectControl.options.add(optionItem);
				}
     		}
     	}
     	
     	$("#nc").on("change",function(e){
     		$("#widgetData_loadjs").attr("data","ncbh="+$("#nc").val());
     		$("#widgetData_loadjs").trigger("loaddata");
     	});
     	
     </script>
  </body>
</html>