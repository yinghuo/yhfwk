<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box_center mt10">
		<form id="frmncxx" class="jqtransform">
			<input type="hidden" id="ncbh" name="nc.ncbh" value="${ncxx.ncbh}">
				<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td class="td_right">圈舍编号：</td>
						<td class="">
							<input type="text" id="jsbh" name="js.jsbh" class="input-text lh30" value="${js.jsbh}" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">圈舍名称：</td>
						<td class="">
							<input type="text" id="jsmc" name="js.jsmc" class="input-text lh30" value="${js.jsmc}" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">圈舍类型：</td>
						<td class="">
							<input type="text" id="jslb" name="js.jslb" class="input-text lh30" value="${js.jslb}" size="80"><span class="required">*必填</span>
						</td>
					</tr>
					<tr>
						<td class="td_right">所属牛场：</td>
						<td class="">
							<div class="input-text lh30" style="width:325px;">${uncxx.ncmc}</div>
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
				<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jsgl/jsgl!save.action" name="frmncxx" class="btn btn82 btn_add" type="button" value=" 新增 "/>
			</div>
     	</div>
     </div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script src="${pageContext.request.contextPath}/js/YBaseValidata.js"></script>
     <script type="text/javascript">
     	showmap("牧场信息管理 > 新增圈舍信息");
     	function validata()
     	{
     		if(IsNull("jsbh",0))
     		{
     			alert("请填写圈舍编号！");
     			return false;
     		}
     		else if(IsNull("jsmc",0))
     		{
     			alert("请填写圈舍名称！");
     			return false;
     		}
     		else if(IsNull("jslb",0))
     		{
     			alert("请填写圈舍类别！");
     			return false;
     		}
     		return true;
     	}
     
     	function savedone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.href="${pageContext.request.contextPath}/master/jsgl/jsgl.action";
     		});
     	}
     	
     	/*function loadncdone(data)
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
     	}*/
     	
     </script>
  </body>
</html>