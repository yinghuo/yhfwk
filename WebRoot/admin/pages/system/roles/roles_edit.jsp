<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html>
<head>
	<%@include file='/admin/pages/importResource.jsp'%>
    <script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/jqueryui/jquery-ui-1.10.2.custom.js" type="text/javascript"></script>
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
	<div class="centerRightContainer">
     	<div class="centerRight">
     		<h6 id="NavMap"></h6>
     		<div style="float:left;">
     			<form id="frm_roles" action="${pageContext.request.contextPath}/master/system/role!addRoles.action" method="post">
     			<input type="hidden" id="selmenus" name="editRole.rmids" value="<s:property value="editRole.rmids"/>"/>
     			<input type="hidden" name="editRole.rid" value="<s:property value="editRole.rid"/>"/> 
     			<table cellpadding="0" style="width:500px;" cellspacing="0">
		     		<thead>
						<tr>
							<th colspan="3" class="borderRightNone">
								<label>
								<s:if test="editRole==null">
									创建新的系统角色
								</s:if>
								<s:else>
									修改角色信息
								</s:else>
								</label>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td width="30%">角色名称：</td>
							<td class="borderRightNone"><input id="editRole_rname" name="editRole.rname" type="text" style="width:300px;" class="lightBlueInput" value="<s:property value="editRole.rname"/>"/></td>
						</tr>
						<tr>
							<td width="30%">角色类型：</td>
							<td class="borderRightNone">
								<select style="width:300px;" class="lightBlueInput" name="editRole.rtype">
									<option value="1">系统管理员</option>
									<option value="2">普通会员</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="borderRightNone"  width="30%" colspan="2"><input class="blueBtn" onclick="save()" type="button" value=" <s:if test="editRole==null">新增</s:if><s:else>更新</s:else> "/></td>
						</tr>
					</tbody>
		     	</table>
		     	</form>
     		</div>
     		<div style="float:left;margin-left:20px; height:85%;">
     			<table cellpadding="0" style="width:500px;height:100%" cellspacing="0">
		     		<thead>
						<tr>
							<th class="borderRightNone">
								<label>系统菜单列表</label>
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td align="left"><div id="tree" style="height:100%;overflow:auto">
				    			<ul id="treeData" style="display:none;">
					    			<s:iterator value="menus" id="element" status="st">
					    				<li class="folder expanded" id="<s:property value="mid"></s:property>" title="<s:property value="mname"></s:property>"><s:property value="mname"></s:property>
						    				<ul>
						    					<s:iterator value="child" id="child" status="stchild">
						    						 <li class="folder" id="<s:property value="mid"></s:property>"><s:property value="mname"></s:property>
						    						 	<ul>
						    						 		<s:iterator value="child" id="child2" status="stchild2">
						    						 			<li id="<s:property value="mid"></s:property>"><s:property value="mname"></s:property></li>
						    						 		</s:iterator>
						    						 	</ul>
						    						 </li>
						    					</s:iterator>
						    				</ul>
					    				</li>
					    			</s:iterator>
							    </ul>
							</div></td>
						</tr>
					</tbody>
		     	</table>
     		</div>
     	</div>
	</div>
</body>
</html>
