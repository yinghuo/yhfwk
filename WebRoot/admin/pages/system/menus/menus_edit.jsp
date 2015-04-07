<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<style>
	.yradiobar {
	height: 20px;
	line-height: 20px;
	border-radius: 5px;
}

.yradiobar a {
	border-radius:8px;
	-moz-border-radius:8px
	height: 20px;
	line-height: 20px;
	margin: 0;
	padding: 0px;
	float: left;
	font-size: 12px;
	background-color: #999999;
	color: #000;
	text-align:center;
}

.yradiobar .selected {
	background-color: #1B9228;
	color: #fff;
}

.yradiobar a:hover {
	cursor: pointer;
	text-decoration: none;	
}
.text{
	padding:6px;
	width:300px;
	border:1px #cccccc solid;
}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$("div[id^=yradiobar_]").each(function(){
				var name=$(this).attr('name');
				var value=$(this).attr('value');
				if(!value)value="";
				$(this).before('<input type="hidden" name="'+name+'" id="'+name+'" value="'+value+'" />');
				$(this).attr("bindid",name);
				$(this).attr("name","");
				$(this).addClass("yradiobar");
				var childCount=this.children.length;
				$(this).css("width",50*childCount);
				var width=(100/childCount)+"%";
				$(this).find("a").each(function(){
					$(this).css("width",width);
					$(this).bind("click",function(){
						$(this).parent().find("a").removeClass("selected");
						$(this).addClass("selected");
						var mvalue=$(this).attr("value");
						if(!mvalue)mvalue="";
						$("input[id='"+name+"']").val(mvalue);
					});
				});
				var selecteds=$(this).find(".selected");
				if(selecteds.length!=1)
				{
					$(this).find("a").removeClass("selected");
					$(this).find(":first").addClass("selected");
				}
				//默认值处理
				/*$(this).find(".selected").each(function(){
					var mvalue=$(this).attr("value");
					if(!mvalue)mvalue="";
					$("#"+name).val(mvalue);
				});*/
				
			});
			
			//@modify Daniel 2014-08-01 1：修复非底层菜单的路径问题，默认为#
			if($("#yradiobar_level").attr("value")<2)
				$("#eurl").val("#");
	});
	
	<%-- @modify Daniel 2014-08-01	1：添加菜单等级自动切换功能，当点击【添加子级】的时候，自动切换菜单等级，先记录当前展示菜单的等级，然后+1作为下一级，并将值放入到form中 --%>
	var nl=<s:property value="editmenu.mlevel"/>;
	function selectLevel(l)
	{
		$("#yradiobar_level").find("a").removeClass("selected");
		var lkas=$("#yradiobar_level").find("a");
		$(lkas[l]).addClass("selected");
		document.getElementById("editmenu.mlevel").value=l;
	}
	
	//validata
	function validata()
	{
		if(IsNull("ename",0))
		{
			alert("请输入操作菜单的名称！");
			return false;
		}
		else if(IsNull("eurl",0))
		{
			alert("请输入操作菜单的访问路径！");
			return false;
		}
		else if(IsNull("eorder",0))
		{
			document.getElementById("eorder").value=0;
		}
		return true;
	}
	
	function save()
	{
		if(validata())
		{
			$("#frm_menus").ajaxSubmit({
				dataType:  'json',
				success: function(data) {
					alert(data["msg"]);
					if(data["error"]=="0")
					{
						window.location.href=window.location.href;
					}
				},
				error:function(xhr){
					alert("提交过程中发生网络错误，请与管理员联系!");
				}
			});
		}
	}
</script>
<form id="frm_menus" action="${pageContext.request.contextPath}/master/system/menu!doSaveOrUpdate.action" method="post">
	<input name="editmenu.mid" id="eid" type="hidden" value="<s:property value="editmenu.mid"/>"/> 
	<input name="editmenu.mparentid" id="pid" type="hidden" value="<s:property value="editmenu.mparentid"/>"/>
	<input name="addtype" id="addtype" type="hidden" value="-1"/> 
	<table cellpadding="0" cellspacing="0" style="width:500px;">
			<tr>
				<td>操作菜单</td>
				<td class="borderRightNone"><input name="editmenu.mname" class="text" id="ename" type="text" value="<s:property value="editmenu.mname"/>"/></td>
			</tr>
			<tr>
				<td>菜单路径</td>
				<td class="borderRightNone"><input name="editmenu.maction" class="text" id="eurl"  type="text" value="<s:property value="editmenu.maction"/>"/></td>
			</tr>
			<tr>
				<td>父级菜单</td>
				<td class="borderRightNone"><label id="parentTxt"></label></td>
			</tr>
			<tr>
				<td>菜单排序</td>
				<td class="borderRightNone"><input name="editmenu.mseq" class="text" id="eorder" type="text" value="<s:property value="editmenu.mseq"/>"/></td>
			</tr>
			<!-- <tr>
				<td>菜单类型</td>
				<td class="borderRightNone">
					<input name="type" type="radio"/>前台&nbsp;&nbsp;&nbsp;<input name="type" checked="checked" type="radio"/>后台</td>
			</tr> -->
			<tr>
				<td>菜单类型</td>
				<td class="borderRightNone" align="center">
					<div name="editmenu.mtype" id="yradiobar_type" value="<s:property value="editmenu.mtype"/>">
						<a value="0" <s:if test="editmenu.mtype==0">class="selected"</s:if>>前台</a>
						<a value="1" <s:if test="editmenu.mtype==1">class="selected"</s:if>>后台</a>
					</div>	
				</td>
			</tr>
			<tr>
				<td>菜单层级</td>
				<td class="borderRightNone" align="center">
					<!-- <input name="level" <s:if test="editmenu.mlevel==0">checked="checked"</s:if> type="radio"/>1级&nbsp;
					<input name="level" <s:if test="editmenu.mlevel==1">checked="checked"</s:if> type="radio"/>2级&nbsp;
					<input name="level" <s:if test="editmenu.mlevel==2">checked="checked"</s:if> type="radio"/>3级</td> -->
					<div name="editmenu.mlevel" id="yradiobar_level" value="<s:property value="editmenu.mlevel"/>">
						<a value="0" <s:if test="editmenu.mlevel==0">class="selected"</s:if>>1级</a>
						<a value="1" <s:if test="editmenu.mlevel==1">class="selected"</s:if>>2级</a>
						<a value="2" <s:if test="editmenu.mlevel==2">class="selected"</s:if>>3级</a>
					</div>
			</tr>
			<tr>
				<td>菜单状态</td>
				<td class="borderRightNone" align="center">
					<div name="editmenu.mstatus" id="yradiobar_level" value="<s:property value="editmenu.mstatus"/>">
						<a value="0" <s:if test="editmenu.mstatus==0">class="selected"</s:if>>隐藏</a>
						<a value="1" <s:if test="editmenu.mstatus==1">class="selected"</s:if>>显示</a>
					</div>
			</tr>
	</table>
</form>
<s:if test="editmenu.mlevel==2">
	<script>$("#btnAdd2").attr("disabled","disabled");</script>
</s:if>
<s:else>
	<script>$("#btnAdd2").attr("disabled",false);</script>
</s:else>
<div align="right" style="padding-right:30px;">
	<input id="btnSave" onclick="save()" type="button" value="更新菜单"/>
</div>
