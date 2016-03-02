<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fqxt/jbq.action" method="post">
		          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
		          			<tr>
		          				<td>计步器编号：</td>
		          				<td><input id="jbq" type="text" name="jbq" class="input-text lh25" value="${jbq}" size="50"></td>
		          				<td>牛只编号：</td>
		          				<td><input id="nz" type="text" name="nz" class="input-text lh25" value="${nz}" size="50"></td>
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
				          			<input type="hidden" name="fileType" value="20">
				          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
			          			</form>
		          			</div>
		          			<input type="button" name="button" data="20" onClick="" class="btn btn82 btn_export" value="导出"><!-- dataExport() -->
		          		</div>
		         </div>
		 </div>
		 
		  <div class="box span10 oh mt5">
		  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
		  	 		<tr>
		              	<th width="">计步器编号</th>
		              	<th width="">所属控制器</th>
		              	<th width="">牛只编号</th>
		              	<th width="180">登记日期</th>
		              	<th width="200">操作</th>
		         	</tr>
		         	<s:iterator value="jbqlst" status="status" id="jbq">
								<tr>
									<td><s:property value="#jbq.jbqbh"/></td>
									<td></td>
									<td><s:property value="#jbq.nzjbxx.nzbh"/></td>
									<td><s:date name="#jbq.regdate" format="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
										<a title="计步器数据" onclick="data('<s:property value="#jbq.xh"/>')" class="fa fa-list-alt cr-p">计步器数据</a>
										<a title="修改" onclick="edit('<s:property value="#jbq.xh"/>')" class="fa fa-edit cr-p">修改</a>
										<a title="删除" id="comsubmit_delete" promptInfo='确认删除该条计步器信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/fqxt/jbq!delete.action?id=<s:property value="#jbq.xh"/>" class="fa fa-remove cr-p">删除</a>
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
									<li class="first-child"><a href="${pageContext.request.contextPath}/master/fqxt/jbq.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
								</s:else>
								<i:PageNum>
									<s:if test="#attr.IsNow">
										<li class="active"><span>${pageIndex}</span></li>
									</s:if>
									<s:else>
										<li><a href="${pageContext.request.contextPath}/master/fqxt/jbq.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
									</s:else>
								</i:PageNum>
								<s:if test="#attr.IsLast">
									<li class="disabled"><span>下一页</span></li>
								</s:if>
								<s:else>
									<li><a class="" href="${pageContext.request.contextPath}/master/fqxt/jbq.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
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
	     	showmap("计步器信息管理 > 计步器信息列表");
	     	function search()
	     	{
	     		document.getElementById("frmSearch").submit();
	     	}
	     	function add()
	     	{
	     		window.location.href="${pageContext.request.contextPath}/admin/pages/fqxt/jbq-add.jsp";
	     	}
	     	
	     	function data(id)
	     	{
	     		window.location.href="${pageContext.request.contextPath}/admin/pages/fqxt/jbq-data.jsp";
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
	     		window.location.href="${pageContext.request.contextPath}/master/fqxt/jbq!edit.action?id="+id;
	     	}     	
     	</script>
	</body>
</html>