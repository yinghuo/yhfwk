<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form"%>
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
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fqxt/fqts.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="50"></td>
	          			</tr>
	          		</table>
	          		</form>
	          	</div>	          	
	         </div>
	         <div class="pb5 pt5 pr10">
	          		<div class="search_bar_btn" style="text-align:right;">
	          			<input type="button" name="button" onClick="search()" class="btn btn82 btn_search" value="查询">
	          			<%/*<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          			<div class="fileButton" style="display:inline">
	          				<form id="importform" style="display:inline" action="${pageContext.request.contextPath}/master/data/import.action" method='post' enctype='multipart/form-data'>
			          			<input type="button" class="btn btn82 btn_export" value="导入">
			          			<input type="hidden" name="fileType" value="12">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="12" onClick="dataExport()" class="btn btn82 btn_export" value="导出">*/%>
	          		</div>
	         </div>
	 </div>
	 <div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
              	<th>牛只编号</th>
              	<th>圈舍名称</th>
              	<th>提示信息</th>
              	<th>结果</th>
              	<th>审核人</th>
              	<th>备注</th>
         	</tr>
         	<s:iterator value="tslist" status="status" id="fqtsxx">
						<tr id="list_${status.index}">
							<td><s:property value="#fqtsxx.nzjbxx.nzbh"/></td>
							<td><s:property value="#fqtsxx.nzjbxx.jsjbxx.jsmc"/></td>							
							<%//<td><a href="${pageContext.request.contextPath}/master/fqxt/fqts!info.action?id=${fqtsxx.xh}">详情</a></td> %>
							<td><s:property value="#fqtsxx.tsms"/></td>
							<s:if test="#fqtsxx.sffq==0">
								<td>
									<a id="comsubmit_yes" callfunction=",handlerDone," url="${pageContext.request.contextPath}/master/fqxt/fqts!yes.action?id=<s:property value="#fqtsxx.xh"/>&bh=list_${status.index}" href="javascript:{}">已发情</a>
									/<a id="comsubmit_pass" callfunction=",passDone," url="${pageContext.request.contextPath}/master/fqxt/fqts!pass.action?id=<s:property value="#fqtsxx.xh"/>&bh=list_${status.index}" href="javascript:{}">未发情</a>
								</td>
							</s:if>
							<s:else>
								<td><y:SwitchLabel text="${fqtsxx.sffq}" labels="未确认,已发情,未发情" status="0,1,2" /></td>
							</s:else>
							<td><s:property value="#fqtsxx.shy"/></td>
							<td><s:property value="#fqtsxx.bz"/></td>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/fqxt/fqts.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/fqxt/fqts.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/fqxt/fqts.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
						</s:else>
						<li class="last-child"><span>共${pageMaxNum}页</span></li>
            		</i:Page>
                 </ul>
           	</div>
		</div>
  	 </div>
	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YSubmit2.0.js"></script>
     <script>
     	showmap("发情信息管理 > 发情通知信息列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	
     	function handlerDone(data)
     	{
     		jsonResult(data,function(data){
     			
     			if(data["error"]==0)
     			{
     				var rid=data["id"];
     				var shy=data["shy"];
     				//获取数据行
     				var row=document.getElementById(rid);
     				row.cells[3].innerHTML="已发情";
     				row.cells[4].innerHTML=shy;
     			}     			
     		});
     	}
     	
     	function passDone(data)
     	{
			jsonResult(data,function(data){
     			
     			if(data["error"]==0)
     			{
     				var rid=data["id"];
     				var shy=data["shy"];
     				//获取数据行
     				var row=document.getElementById(rid);
     				row.cells[3].innerHTML="未发情";
     				row.cells[4].innerHTML=shy;
     			}     			
     		});
     	}
     	
     </script>
  </body>
 </html>