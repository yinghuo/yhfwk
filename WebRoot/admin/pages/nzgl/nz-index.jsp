<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form" %>
<%@ taglib prefix="y" uri="http://open.yinghuo.info/taglib/form"%>

<!doctype html>
<html>
  <head>
  	 <%@include file='/admin/pages/import.jsp'%>
  </head>
  <body>
  	<div class="box">
	  		<div class="box_border">
	        	<!-- <div class="box_top">
	          		<div class="box_top">	          		
	          			<b class="pl15">查询搜索</b>
	          		</div>
	          	</div> -->
	          	<div class="box_center pt5 pb5">
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/nzgl/nzxx.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="20"></td>	          				
	          				<td>计步器编号：</td>
	          				<td><input id="jbq" type="text" name="jbq" class="input-text lh25" value="${jbq}" size="20"></td>
	          				<td>耳标编号：</td>
	          				<td><input id="eb" type="text" name="eb" class="input-text lh25" value="${eb}" size="20"></td>
	          			</tr>
	          			<tr>
	          				<td>所属圈舍：</td>
	          				<td><select id="js" name="js" class="select">
	          						<option>所有圈舍</option>
	          				</select></td>	
	          				<td>牛只类别：</td>
	          				<td><select id="lb" name="lb" class="select">
	          					<option value="">所有类别</option>
								<y:EnumValues value="${nz.lb}" enumName="NZLB">
									<option value="${value}" ${selected}>${label}</option>
								</y:EnumValues>
	          				</select></td>
	          				<td>繁殖状态：</td>
	          				<td><select id="fzzt" name="fzzt" class="select">
	          					<option value="">所有状态</option>
								<y:EnumValues value="${nz.lb}" enumName="NZFZZT">
									<option value="${value}" ${selected}>${label}</option>
								</y:EnumValues>
	          				</select></td>
	          				<td>泌乳状态：</td>
	          				<td><select id="mrzt" name="mrzt" class="select">
	          					<option value="">所有状态</option>
								<y:EnumValues value="${nz.lb}" enumName="NZMRZT">
									<option value="${value}" ${selected}>${label}</option>
								</y:EnumValues>
	          				</select></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          			<div class="fileButton" style="display:inline;">
	          				<form id="importform" style="display:inline;" action="${pageContext.request.contextPath}/master/data/import.action" method='post' enctype='multipart/form-data'>
			          			<input type="button" class="btn btn82 btn_export" value="导入">
			          			<input type="hidden" name="fileType" value="2">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="2" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
	          		</div>
	         </div>
	</div>
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
              	<th width="100">牛只编号</th>
              	<th width="100">所属圈舍</th>
              	<th>类别</th>
              	<th>繁殖状态</th>
              	<th>繁殖天数</th>
              	<th>最后配种日期</th>
              	<th>泌乳状态</th>
              	<th>泌乳天数</th>
              	<th width="120">出生日期</th>
              	<th>性别</th>
              	<th>配孕天数</th>
              	<th value="" type="1" class="order cr-p" title="降序">胎间距&nbsp;<span class="fa fa-caret-down"></span></th>
              	<th value="" type="1" class="order cr-p" title="降序">预产期&nbsp;<span class="fa fa-caret-down"></span></th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="nzlist" status="status" id="nzxx">
				<tr>
					<td><a href="${pageContext.request.contextPath}/master/nzgl/nzxx!info.action?id=<s:property value="#nzxx.xh"/>"><s:property value="#nzxx.nzbh"/></a></td>
					<td><s:property value="#nzxx.jsjbxx.jsmc"/></td>					
					<td><y:EnumLabel enumName="NZLB" value="${nzxx.lb}"/></td>
					<s:if test="#nzxx.nzfzzt!=null">
						<td><y:EnumLabel enumName="NZFZZT" value="${nzxx.nzfzzt.zt}"/></td>
					</s:if>
					<s:else>
						<td> -- </td>
					</s:else>
					<s:if test="#nzxx.nzfzzt!=null">
						<td>${nzxx.nzfzzt.day}天</td>
					</s:if>
					<s:else>
						<td> -- </td>
					</s:else>
					<s:if test="#nzxx.nzfzzt!=null">
						<td><s:date name="#nzxx.nzfzzt.sj" format="yyyy-MM-dd"/></td>
					</s:if>
					<s:else>
						<td> -- </td>
					</s:else>
					<s:if test="#nzxx.nzmrzt!=null">
						<td><y:EnumLabel enumName="NZMRZT" value="${nzxx.nzmrzt.zt}"/></td>
					</s:if>
					<s:else>
						<td> -- </td>
					</s:else>		
					<s:if test="#nzxx.nzmrzt!=null && #nzxx.nzmrzt.zt>-1">
						<td>${nzxx.nzmrzt.day}天</td>
					</s:if>
					<s:else>
						<td> -- </td>
					</s:else>
					<td><s:date name="#nzxx.csrq" format="yyyy-MM-dd"/></td>
					<td><y:EnumLabel enumName="NZXB" value="${nzxx.xb}"/></td>
					<td>
						<s:if test="#nzxx.pyts>-1">
							${nzxx.pyts}天
						</s:if>
						<s:else>
							 -- 
						</s:else>
					</td>
					<td>
						<s:if test="#nzxx.tjj>-1">
							${nzxx.tjj}天
						</s:if>
						<s:else>
							 -- 
						</s:else>
					</td>
					<td>
						<s:if test="#nzxx.nzfzzt!=null&&(#nzxx.nzfzzt.zt==1||#nzxx.nzfzzt.zt==2)">
							<s:date name="#nzxx.nzfzzt.tssj" format="yyyy-MM-dd"/>
						</s:if>
						<s:else>
							 -- 
						</s:else>
					</td>
					<td>
						<a title="修改" onclick="edit('<s:property value="#nzxx.xh"/>')" class="fa fa-edit cr-p">修改</a>
						<%//<a title="删除" id="comsubmit_delete" promptInfo='确认删除当前牛只的信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/nzgl/nzxx!delete.action?id=<s:property value="#nzxx.xh"/>" class="fa fa-remove cr-p">删除</a> %>
						<a title="转舍登记" class="fa fa-exchange cr-p" onclick="transfer('<s:property value="#nzxx.xh"/>')">转舍</a>
						<a title="离场登记" class="fa fa-truck cr-p" onclick="departure('<s:property value="#nzxx.xh"/>')">离场</a>
						<a title="淘汰登记" class="fa fa-remove cr-p" onclick="eliminate('<s:property value="#nzxx.xh"/>')">淘汰</a>
					</td>
				</tr>
			</s:iterator>
  	 	</table>
  	 	<div class="page mt10 fr pr10">
         	<div class="pagination">
            	<ul>
            		<i:Page page="pager" count="9">
            				<li class="first-child disabled"><span>数量：${dataCount}头</span></li>
            			<s:if test="#attr.IsFirst">
							<li class="disabled"><span>上一页</span></li>
						</s:if>
						<s:else>
							<li class=""><a href="${pageContext.request.contextPath}/master/nzgl/nzxx.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/nzgl/nzxx.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/nzgl/nzxx.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
  	 <div style="display:none" id="widgetData_loadjs" url="${pageContext.request.contextPath}/master/jsgl/jsgl!loadname.action?ncbh=me" callfunction=",loadjsdone,"></div>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YWidget.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YMask.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/import.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/export.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YOrder.js"></script>
     <script>
     	showmap("牛只信息管理 > 牛只信息列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/nzgl/nz-add.jsp";
     	}
     	
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/nzgl/nzxx!edit.action?id="+id;
     	}
     	
     	function transfer(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/nzgl/zsxx!add.action?id="+id;
     	}
     	
     	function departure(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/nzgl/lcxx!add.action?id="+id;
     	}
     	
     	function eliminate(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/nzgl/ttxx!add.action?id="+id;
     	}
     	
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
     	
     	<%/*function deleteDone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.reload();
     		});
     	}
     	*/%>
     </script>
  </body>
</html>