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
  		<form id="frmjbxx" class="jqtransform">
  			<input type="hidden" name="jb.xh" value="${jb.xh}">
  			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
	  			<tr>
					<td class="td_right">牛只编号：</td>
					<td class="">
						<input type="text" id="nzbhtxt" onKeyup="nzSelect('nzbhtxt')" value="${jb.nzjbxx.nzbh}" onFocus="nzSelect('nzbhtxt')" onblur="nzHiden()" class="input-text lh30" size="50">
						<input type="hidden" id="nzbh" name="jb.nzbh" value="${jb.nzbh}">
						<span class="required">*必填</span>						
					</td>
				</tr>
				<tr>
					<td class="td_right">发病日期：</td>
					<td class="">
						<input type="text" id="fbrq" name="jb.fbrq" class="input-text lh30" readonly="readonly" value="<s:date name="jb.fbrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">疾病种类：</td>
					<td class="">
						<input type="text" id="jbzl" name="jb.jbzl" class="input-text lh30" value="${jb.jbzl}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">疾病名称：</td>
					<td class="">
						<input type="text" id="jbmc" name="jb.jbmc" class="input-text lh30" value="${jb.jbmc}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">主要症状：</td>
					<td class="">
						<input type="text" id="zyzz" name="jb.zyzz" class="input-text lh30" value="${jb.zyzz}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">发病原因：</td>
					<td class="">
						<input type="text" id="fbyy" name="jb.fbyy" class="input-text lh30" value="${jb.fbyy}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">严重程度：</td>
					<td class="">
						<input type="text" id="yzcd" name="jb.yzcd" class="input-text lh30" value="${jb.yzcd}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">处置情况：</td>
					<td class="">
						<input type="text" id="czqk" name="jb.czqk" class="input-text lh30" value="${jb.czqk}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">是否弃奶：</td>
					<td class="">
						<select id="fsqn" name="jb.fsqn" class="select" >
						<y:EnumValues value="${jb.fsqn}" enumName="SFQN">
							<option value="${value}" ${selected}>${label}</option>
						</y:EnumValues>
						</select>
						<span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">用药日期：</td>
					<td class="">
						<input type="text" id="yyrq" name="jb.yyrq" class="input-text lh30" readonly="readonly" value="<s:date name="jb.yyrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">药费累计：</td>
					<td class="">
						<input type="text" id="yflj" name="jb.yflj" class="input-text lh30" value="${jb.yflj}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">用药次数：</td>
					<td class="">
						<input type="text" id="yycs" name="jb.yycs" class="input-text lh30" value="${jb.yycs}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">结束休药日期：</td>
					<td class="">
						<input type="text" id="jsxyrq" name="jb.jsxyrq" class="input-text lh30" readonly="readonly" value="<s:date name="jb.jsxyrq" format="yyyy-MM-dd"/>" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd'})" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">兽医：</td>
					<td class="">
						<input type="text" id="systxt" readonly="readonly" class="input-text lh30" value="${jb.sys}" size="35">
						<input type="hidden" id="sys" name="jb.sys" value="${jb.sys}">
						&nbsp;<a id="selectsys" onclick="ygSelect('selectsys')" class="ext_btn"><span class="add"></span>选择员工</a><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">备注：</td>
					<td class="">
						<textarea id="bz" name="jb.bz" cols="80" rows="10" class="textarea">${jb.bz}</textarea>
					</td>
				</tr>
			</table>
  		</form>
  	</div>
  	<div class="btns">
		<input id="comsubmit_save" callfunction=",savedone," validata="validata" url="${pageContext.request.contextPath}/master/jbfy/jbxx!save.action" name="frmjbxx" class="btn btn82 btn_add" type="button" value=" <s:if test="jb==null">新增</s:if><s:else>更新</s:else> "/>
	</div>
	<script	src="${pageContext.request.contextPath}/plugins/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YSelect.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/Yg.js"></script>
 	<script type="text/javascript">
     	showmap("疾病防疫管理 > 新增疾病信息");
    	function validata() {
			if (IsNull("nzbh", 0)) {
				alert("请填写牛只编号！");
				return false;
			}
			if (IsNull("fbrq", 0)) {
				alert("请填写发病日期！");
				return false;
			}
			if (IsNull("jbzl", 0)) {
				alert("请填写疾病种类！");
				return false;
			}
			if (IsNull("jbmc", 0)) {
				alert("请填写疾病名称！");
				return false;
			}
			if (IsNull("zyzz", 0)) {
				alert("请填写主要症状！");
				return false;
			}
			if (IsNull("fbyy", 0)) {
				alert("请填写发病原因！");
				return false;
			}
			if (IsNull("yzcd", 0)) {
				alert("请填写严重程度！");
				return false;
			}
			if (IsNull("czqk", 0)) {
				alert("请填写处置情况！");
				return false;
			}
			if (IsNull("fsqn", 0)) {
				alert("请填写是否弃奶！");
				return false;
			}
			if (IsNull("yyrq", 0)) {
				alert("请填写用药日期！");
				return false;
			}
			if (IsNull("yflj", 0)) {
				alert("请填写药费累计！");
				return false;
			}
			if (IsNull("yycs", 0)) {
				alert("请填写用药次数！");
				return false;
			}
			if (IsNull("jsxyrq", 0)) {
				alert("请填写结束休药日期！");
				return false;
			}
			if (IsNull("sys", 0)) {
				alert("请填写兽医！");
				return false;
			}
			return true;
		}

		function savedone(data) {
			jsonResult(
					data,
					function(data) {
						if (data["error"] == 0)
							window.location.href = "${pageContext.request.contextPath}/master/jbfy/jbxx.action";
					});
		}
		
		var select=new YSelect("selectsys","selectUser","${pageContext.request.contextPath}/master/yggl/ygxx!loadname.action",function(id,v,t){
	  		
	  		if(id=="selectsys")
	  		{
		  		$("#systxt").val(t);
		 		$("#sys").val(t);
	 		}
		},true);
		
		function ygSelect(id)
		{
			if(select.state())
				select.hiden();
			else
			{
				if(id=="selectsys")
		  		{
			  		select.show(id,$("#systxt").val());
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
		
		loadDefName(["sys","systxt"]);
    </script>
  </body>
 </html>
