<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
	<%@include file='/admin/pages/import.jsp'%>
    <script src="${pageContext.request.contextPath}/plugins/jqueryui/jquery-ui-1.10.2.custom.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/plugins/fancytree/skin/win/ui.fancytree.css" rel="stylesheet" type="text/css">
  	<script src="${pageContext.request.contextPath}/plugins/fancytree/jquery.fancytree.js" type="text/javascript"></script>
  	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
  	
    <script type="text/javascript">
    	$(function(){
    		$("#tree").fancytree({
    			checkbox:true,
    			selectMode: 3,
    			select: function(event,data){
    				var selRootNodes = data.tree.getSelectedNodes(true);
    				var selRootKeys = $.map(selRootNodes, function(node){
    					if(node.key.indexOf("_")==0)
    					{
    						alert("无法操作错误的菜单！");
    						node.setSelected(false);
    						return null;
    					}
						return node.key;
					});
					$("#selmenus").val(selRootKeys);
    			}
    		});
    		<s:if test="editRole!=null">
				editLoad();
			</s:if>
    	});
    	
    	function editLoad()
    	{
    		var treeObj=$("#tree").fancytree("getTree");
    		var selectkeys="${editRole.rmids}";
    		
    		if(selectkeys)
    		{
    			var ids=selectkeys.split(",");
    			for(var i=0;i<ids.length;i++)
    			{
    				var id=ids[i];
    				var treeNode=treeObj.getNodeByKey(id);
    				if(treeNode)treeNode.setSelected(true);
    			}	
    		}
    	}
    	
    	function save()
    	{
    		if($("#editRole_rname").val().length<=0)
    		{
    			alert("请输入角色名称，不能为空！");
    			return;
    		}
    		else if($("#selmenus").val().length<=0)
    		{
    			alert("请选择角色的菜单！");
    			return;
    		}
    		
    		$("#frm_roles").ajaxSubmit({
				dataType:  'json',
				success: function(data) {
					alert(data["msg"]);
					if(data["error"]=="0")
					{
						//清空表单
						clearfrm();
					}
					 window.location.href="${pageContext.request.contextPath}/master/system/role!listRoles.action";
				},
				error:function(xhr){
					alert("提交过程中发生网络错误，请与管理员联系!");
				}
			});
    	}
    	
    	function clearfrm()
    	{
    		$("#editRole_rname").val();
    		$("#tree").fancytree("getTree").visit(function(node){
		        node.setSelected(false);
		    });
    	}
    	
    </script>
</head>
<body>
	
	<div class="main_left fl span5">
    	<div class="box pr5">
        	<div class="box_border">
         		<div class="box_top">
          			<div class="box_top">
          			<b class="pl15">角色信息</b>
				</div>
             	</div>
       			<div class="box_center">
       				<form id="frm_roles" action="${pageContext.request.contextPath}/master/system/role!addRoles.action" method="post">
       					<input type="hidden" id="selmenus" name="editRole.rmids" value="<s:property value="editRole.rmids"/>"/>
     					<input type="hidden" name="editRole.rid" value="<s:property value="editRole.rid"/>"/>
     					<table class="form_table pt15 pb15" border="0" cellpadding="0" cellspacing="0">
     						<tr>
								<td class="td_right">角色名称：</td>
								<td class="">
									<input type="text" id="editRole_rname" name="editRole.rname" class="input-text lh30" value="${editRole.rname}" size="50"><span class="required">*必填</span>
								</td>
							</tr>
							<tr>
								<td class="td_right">访问权限：</td>
								<td class="">
									<select class="select" name="editRole.rtype">
										<option value="2">企业会员</option>										
										<option value="1">系统管理员</option>
									</select>
								</td>
							</tr>
     					</table>
       				</form>
       				<div class="btn_bar ta-c mb10">
						<input class="btn blue" id="btnSave" onclick="save()" type="button" value="  <s:if test="editRole==null">新增</s:if><s:else>更新</s:else>角色  "/>
					</div>
       			</div>
       		</div>
    	</div>
	</div>
	
	<div class="main_left fl span5">
    	<div class="box pr5">
        	<div class="box_border">
         		<div class="box_top">
          			<div class="box_top"><b class="pl15">选择角色菜单</b></div>
             	</div>
       			<div id="tree" class="box_center">
       				<ul id="treeData" style="display:none;">
					 	<s:iterator value="menus" id="element" status="st">
					   		<li class="folder expanded" id="<s:property value="mid"></s:property>" title="<s:property value="mname"></s:property>"><s:property value="mname"></s:property>
								<ul>
						  			<s:iterator value="child" id="child" status="stchild">
						    			<li class="folder" id="<s:property value="mid"></s:property>"><s:property value="mname"></s:property>
						   			</s:iterator>
						  		</ul>
							</li>
						</s:iterator>
					</ul>
       			</div>
       		</div>
    	</div>
	</div>
</body>
</html>
