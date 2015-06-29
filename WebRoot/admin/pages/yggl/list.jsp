<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form"%>


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
		          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/yggl/ygxx.action" method="post">
		          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
		          			<tr>
		          				<td>员工编号：</td>
		          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="50"></td>
		          				<td>员工姓名：</td>
		          				<td><input id="xm" type="text" name="xm" class="input-text lh25" value="${xm}" size="50"></td>
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
				          			<input type="hidden" name="fileType" value="1">
				          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
			          			</form>
		          			</div>
		          			<input type="button" name="button" data="1" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
		          		</div>
		         </div>
		 </div>
		 
		  <div class="box span10 oh mt5">
		  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
		  	 		<tr>
		              	<th width="">员工编号</th>
		              	<th width="">员工名称</th>
		              	<th width="200">员工类别</th>
		              	<th width="">联系电话</th>
		              	<th width="200">操作</th>
		         	</tr>
		         	<s:iterator value="yglist" status="status" id="ygxx">
								<tr>
									<td><s:property value="#ygxx.ygbh"/></td>
									<td><s:property value="#ygxx.ygmc"/></td>
									<td><s:property value="#ygxx.yglb"/></td>
									<td><s:property value="#ygxx.lxdh"/></td>
									<td>
										<a title="修改" onclick="edit('<s:property value="#ygxx.xh"/>')" class="fa fa-edit cr-p">修改</a>
										<!-- <a title="删除" id="comsubmit_delete" promptInfo='确认删除员工[<s:property value="#ygxx.ygmc"/>]吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/jsgl/jsgl!delete.action?id=<s:property value="#ygxx.xh"/>" class="fa fa-remove cr-p">删除</a> -->
									</td>
								</tr>
					</s:iterator>
		  	 	</table>
		  	 	<div class="page mt10 fr pr10">
		         	<div class="pagination">
		            	<ul>
		            		<i:Page page="pager" count="9">
		            			<s:if test="#attr.IsFirst">
									<li class="first-child disabled"><span>上一页</span></li>
								</s:if>
								<s:else>
									<li class="first-child"><a href="${pageContext.request.contextPath}/master/yggl/ygxx.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
								</s:else>
								<i:PageNum>
									<s:if test="#attr.IsNow">
										<li class="active"><span>${pageIndex}</span></li>
									</s:if>
									<s:else>
										<li><a href="${pageContext.request.contextPath}/master/yggl/ygxx.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
									</s:else>
								</i:PageNum>
								<s:if test="#attr.IsLast">
									<li class="disabled"><span>下一页</span></li>
								</s:if>
								<s:else>
									<li><a class="" href="${pageContext.request.contextPath}/master/yggl/ygxx.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
								</s:else>
								<li class="last-child"><span>共${pageMaxNum}页</span></li>
		            		</i:Page>
		                 </ul>
		           	</div>
				</div>
		  	 </div>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>	 
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YMask.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/import.js"></script>
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/export.js"></script>
		<script>
	     	showmap("员工信息管理 > 员工信息列表");
	     	function search()
	     	{
	     		document.getElementById("frmSearch").submit();
	     	}
	     	function add()
	     	{
	     		window.location.href="${pageContext.request.contextPath}/admin/pages/yggl/add.jsp";
	     	}
	     	function deleteDone(data)
	     	{
	     		jsonResult(data,function(data){
	     			if(data["error"]==0)
	     				window.location.reload();
	     		});
	     	}
	     	function edit(id)
	     	{
	     		window.location.href="${pageContext.request.contextPath}/master/yggl/ygxx!edit.action?id="+id;
	     	}     	
     	</script>
	</body>
</html>