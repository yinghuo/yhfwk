<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%@include file='/admin/pages/importResource.jsp'%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/iframe.js"></script>
		<script src="${pageContext.request.contextPath}/vendor/jqueryui/jquery-ui-1.10.2.custom.js" type="text/javascript"></script>
		<link href="${pageContext.request.contextPath}/plugins/fancytree/skin/win/ui.fancytree.css" rel="stylesheet" type="text/css">
  		<script src="${pageContext.request.contextPath}/plugins/fancytree/jquery.fancytree.js" type="text/javascript"></script>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/css/table.css" />
		<script src="${pageContext.request.contextPath}/js/YBaseValidata.js" type="text/javascript"></script>
      	<script src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	</head>
  	<script type="text/javascript">
  	var pnode=null,selnode=null;
    $(function(){
      // using default options
      $("#tree").fancytree({
      	 activate: function(event, data){
	        var node = data.node;
	        selnode=node;
	        pnode=node.parent;
	        if(node.key!="")
	        {
		        $("#editName").html(node.title);
		        $.ajax({
					url:'${pageContext.request.contextPath}/master/system/menu!doEdit.action?editid='+node.key,
					type:"get",
					data:"",
					timeout:1200000,
					success:function(data){
						if(typeof(data)=="object")
						{
							if(data["error"]==1)
								alert(data["msg"]);
						}
						else
						{
							$("#editPanel").html(data);
							$("#parentTxt").html(pnode.title=="root"?"无":pnode.title);
							//$("#parentId").value(pnode.key);
						}
					},
					error:function(xmlHttpRequest, error){
						alert("加载菜单信息错误！");
					}	 		
				});
			}
	      }
      }).bind("fancytreeactivate",function(event, data){
      	return false;
      });
    });
    
    function addmenu(lid)
    {
    	if(lid==1)//同级
    	{
    		$("#parentTxt").html(pnode.title=="root"?"无":pnode.title);
    		$("#pid").val((pnode.key.indexOf("root_")>-1)?"":pnode.key);<%-- @modify Daniel 2014-08-01 1:修复父级文字显示和父级ID的获取。  --%>
    		if(pnode!=null) $("#eorder").val(pnode.children.length);//取消+1，下标从0开始 by:Daniel
    	}
    	else if(lid==2)//子级
    	{
    		$("#parentTxt").html($("#ename").val());
    		$("#pid").val($("#eid").val());
    		//nextItem("yradiobar_level");
    		if(selnode!=null) $("#eorder").val(selnode.children==null?"0":selnode.children.length);
    		selectLevel(nl+1);
    	}
    	$("#addtype").val(lid);
    	$("#ename").val("");
    	$("#eurl").val("#");
    	$("#eid").val("");
    	$("#btnSave").val("保存菜单");
    }
 	
 	//下一级
 	function nextItem(id)
 	{
 		var con=$("#"+id);
 		//扫描子项
 		var count=con[0].children.length;
 		$("#"+id).find("a").each(function(){
 			console.log("下标："+count);
 			if(count==-1)
 			{
 				$(this).addClass("selected");
 				count=0;
 			}
 			else
 				count--;
 			if($(this).attr("class"))
 			{
 				//查找到当前选择，判断设置标记，继续前进
 				if(count>0)
 				{
 					$(this).removeClass("selected");
 					count=-1;
 				}
 			}
		});
 	}
    
    function deletemenu()
    {
    	if(selnode!=null&&confirm("您确定要移除菜单："+selnode.title))
    	{
	    	 $.ajax({
						url:'${pageContext.request.contextPath}/master/system/menu!doDelete.action?editid='+selnode.key,
						type:"get",
						data:"",
						timeout:1200000,
						success:function(data){
							alert(data["msg"]);
							if(data["error"]=="0")
							{
								window.location.href=window.location.href;
							}
						},
						error:function(xmlHttpRequest, error){
							alert("执行操作错误！");
						}	 		
					});
		}
    }
    
    function reloadmenu()
    {
    	window.parent.window.parent.window.location="${pageContext.request.contextPath}/login!access.action";
    }
    
  </script>
  	
  <body>
    <div class="centerRightContainer">
    	<div class="centerRight">
    		<h6 id="NavMap"></h6>
    		<div class="blueDivBox">
				<div style="float:left;">
					<input onclick="deletemenu()" type="button" class="wraingBtn" value="删除选择菜单"/>
					<input onclick="addmenu(1)" type="button" class="blueBtn" value="新增同级菜单"/>
					<input id="btnAdd2" onclick="addmenu(2)" type="button" class="blueBtn" value="新增子级菜单"/>	
					
							
			    </div>	
			    <div style="float:right;">
			    	<input id="btnAdd2" onclick="reloadmenu()" type="button" class="blueBtn" style="float:right;" value="刷新菜单缓存"/>		
			    </div>
			    <div class="clearFloat"/></div>
			</div>
			<div>
				<div id="tree" class="treeBox">
	    			<ul id="treeData" style="display: none;">
		    			<s:iterator value="menus" id="element" status="st"><!-- class="active focused" -->
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
				</div>
				<div id="editPanel" style="float:left;padding-left:10px;width:50%"></div>
				<div class="clearFloat"></div>
			</div>
    	</div>
    </div>
  </body>
</html>
