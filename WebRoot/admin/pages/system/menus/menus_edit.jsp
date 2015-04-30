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
			if($("#yradiobar_level").attr("value")<1)
				$("#eurl").val("#");
	});
	
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
						location.reload();
					}
				},
				error:function(xhr){
					alert("提交过程中发生网络错误，请与管理员联系!");
				}
			});
		}
	}
</script>

<div id="forms" class="mt10">
	<div class="box_center">
		<form id="frm_menus" class="jqtransform" action="${pageContext.request.contextPath}/master/system/menu!doSaveOrUpdate.action" method="post">
			<input name="editmenu.mid" id="eid" type="hidden" value="<s:property value="editmenu.mid"/>"/> 
			<input name="editmenu.mparentid" id="pid" type="hidden" value="<s:property value="editmenu.mparentid"/>"/>
			<input name="addtype" id="addtype" type="hidden" value="-1"/> 
			<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_right">显示名称：</td>
					<td class="">
						<input type="text" id="ename" name="editmenu.mname" class="input-text lh30" value="${editmenu.mname}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">菜单路径：</td>
					<td class="">
						<input type="text" id="eurl" name="editmenu.maction" class="input-text lh30" value="${editmenu.maction}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">父级菜单：</td>
					<td class="">
						<div id="parentTxt" class="input-text lh30" style="width:325px;"></div>
					</td>
				</tr>
				<tr>
					<td class="td_right">显示排序：</td>
					<td class="">
						<input type="text" id="eorder" name="editmenu.mseq" class="input-text lh30" value="${editmenu.mseq}" size="50"><span class="required">*必填</span>
					</td>
				</tr>
				<tr>
					<td class="td_right">菜单层级：</td>
					<td class="">
						<div name="editmenu.mlevel" id="yradiobar_level" value="<s:property value="editmenu.mlevel"/>">
							<a value="0" <s:if test="editmenu.mlevel==0">class="selected"</s:if>>1级</a>
							<a value="1" <s:if test="editmenu.mlevel==1">class="selected"</s:if>>2级</a>
						</div>
					</td>
				</tr>
			</table>
		</form>
		<div class="btn_bar ta-c">
			<input class="btn blue" id="btnSave" onclick="save()" type="button" value="  更新菜单  "/>
		</div>
	</div>
</div>


<s:if test="editmenu.mlevel==1">
	<script>$("#btnAdd2").attr("disabled","disabled");</script>
</s:if>
<s:else>
	<script>$("#btnAdd2").attr("disabled",false);</script>
</s:else>


