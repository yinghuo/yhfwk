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
  			<form id="frmlcxx" class="jqtransform">
  				<input type="hidden" name="lc.nzxh" value="${nz.xh}">
  				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
  					<tr>
						<td class="td_right">牛只编号：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.nzbh}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">电子耳标编号：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.ebbh}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">所属圈舍：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.jsjbxx.jsmc}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">性别：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px"><y:EnumLabel enumName="NZXB" value="${nz.xb}"/></div>
						</td>
					</tr>
					<tr>
						<td class="td_right">月龄：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.yl}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">类别：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px"><y:EnumLabel enumName="NZLB" value="${nz.lb}"/></div>
						</td>
					</tr>
					<tr>
						<td class="td_right">品种：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.pz}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">出生重：</td>
						<td class="">
							<div class="input-text lh30 cr-na" style="width:324px">${nz.csz}</div>
						</td>
					</tr>
					<tr>
						<td class="td_right">离群日期：</td>
						<td class="">
							<input type="text" id="lqrq" name="lc.lqrq" class="input-text lh30" readonly="readonly" value="" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm'})" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">离群类型：</td>
						<td class="">
							<input type="text" id="lqlx" name="lc.lqlx" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">离群体重：</td>
						<td class="">
							<input type="text" id="lqtz" name="lc.lqtz" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">离群原因：</td>
						<td class="">
							<input type="text" id="lqyy" name="lc.lqyy" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">去向：</td>
						<td class="">
							<input type="text" id="qx" name="lc.qx" class="input-text lh30" value="" size="50"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">经手人：</td>
						<td class="">
							<input type="text" id="jsrtxt" readonly="readonly" class="input-text lh30" value="" size="35">
							<input type="hidden" id="jsr" name="lc.jsr">
							&nbsp;<a id="selectBtn" onclick="ygSelect()" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">备注信息：</td>
						<td class="">
							<textarea id="bz" name="lc.bz" cols="50" rows="10" class="textarea"></textarea>
						</td>
					</tr>
  				</table>
  			</form>
  		</div>
  		<div class="btns">
			<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/nzgl/lcxx!save.action" name="frmlcxx" class="btn btn82 btn_add" type="button" value=" 登记 "/>
		</div>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>
     	<script type="text/javascript">
     		showmap("牛只信息管理 > 牛只离场登记");
	     	function validata()
	     	{
	     		if(IsNull("lqrq",0))
	     		{
	     			alert("请填写离群日期！");
	     			return false;
	     		}
	     		else if(IsNull("lqlx",0))
	     		{
	     			alert("请填写离群类型！");
	     			return false;
	     		}
	     		else if(IsNull("lqtz",0))
	     		{
	     			alert("请填写离群体重！");
	     			return false;
	     		}
	     		else if(IsNull("lqyy",0))
	     		{
	     			alert("请填写离群原因！");
	     			return false;
	     		}
	     		else if(IsNull("qx",0))
	     		{
	     			alert("请填写去向！");
	     			return false;
	     		}
	     		else if(IsNull("jsr",0))
	     		{
	     			alert("请填写经手人！");
	     			return false;
	     		}
	     		return true;
	     	}
	     
	     	function savedone(data)
	     	{
	     		jsonResult(data,function(data){
	     			if(data["error"]==0)
	     				window.location.href="${pageContext.request.contextPath}/master/nzgl/lcxx.action";
	     		});
	     	}
	     	
	     	function loadjsdone(data)
	     	{
	     		var selectControl=document.getElementById("zrjs");
	     		var defval="${nz.js}";
	     		selectControl.options.length = 1;
	     		if(data)
	     		{
	     			for(var i=0;i<data.length;i++)
					{
						var items=data[i];
						if(defval!=items.id){
							var optionItem=new Option(items.name,items.id);
							selectControl.options.add(optionItem);
						}
					}
	     		}
	     	}
	     	
	     	var select=new YSelect("selectBtn","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	     		$("#jsrtxt").val(t);
	     		$("#jsr").val(t);
	     	});
			
			function ygSelect()
			{
				if(select.state())
					select.hiden();
				else
					select.show();
			}
	     	
     		window.parent.selectMenu("a945cb02-a136-4735-b349-332f8fc94bfa");
     </script>
  </body>
</html>