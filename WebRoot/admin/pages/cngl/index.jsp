<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="i" uri="http://open.yinghuo.info/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/cngl/gtcnxx.action" method="post">
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
	          			<input type="button" name="button" onClick="add()" class="btn btn82 btn_add" value="新增">
	          			<div class="fileButton" style="display:inline">
	          				<form id="importform" style="display:inline" action="${pageContext.request.contextPath}/master/data/import.action" method='post' enctype='multipart/form-data'>
			          			<input type="button" class="btn btn82 btn_export" value="导入">
			          			<input type="hidden" name="fileType" value="12">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="12" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
	          		</div>
	         </div>
	 </div>
	 <div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
              	<th>牛只编号</th>
              	<th url="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=1${searchString}" value="nzjbxx.tc" type="1" class="order cr-p" title="降序">胎次&nbsp;<span class="fa fa-caret-down"></span></th>
              	<th>泌乳天数</th>
              	<th url="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=1${searchString}" value="jnrq" type="1" class="order cr-p" title="降序">挤奶日期&nbsp;<span class="fa fa-caret-down"></span></th>
              	<th>早</th>
              	<th>中</th>
              	<th>晚</th>
              	<th url="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=1${searchString}" value="rc" type="1" class="order cr-p" title="降序">日产&nbsp;<span class="fa fa-caret-down"></span></th>
              	<th>上次产量</th>
              	<th url="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=1${searchString}" value="src" type="1" class="order cr-p" title="降序">差额&nbsp;<span class="fa fa-caret-down"></span></th>
              	<!-- <th width="160">操作</th> -->
         	</tr>
         	<s:iterator value="cnlist" status="status" id="gtcnxx">
						<tr>
							<td><a href="#"><s:property value="#gtcnxx.nzjbxx.nzbh"/></a></td>
							<td><s:property value="#gtcnxx.nzjbxx.tc"/></td>
							<td><s:property value="#gtcnxx.nzjbxx.nzmrzt.day"/>天</td>
							<td><s:date name="#gtcnxx.jnrq" format="yyyy-MM-dd"/></td>
							<td><s:property value="#gtcnxx.scl"/></td>
							<td><s:property value="#gtcnxx.xcl"/></td>
							<td><s:property value="#gtcnxx.wcl"/></td>
							<td><s:property value="#gtcnxx.rc"/></td>
							<td><s:property value="#gtcnxx.src"/></td>
							<td><fmt:formatNumber value="${gtcnxx.rc-gtcnxx.src}" pattern="#,##0.00" /></td>
							<!-- <td>&nbsp;</td> -->
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/cngl/gtcnxx.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
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
  	 <script type="text/javascript" src="${pageContext.request.contextPath}/js/YOrder.js"></script>
     <script>
     	showmap("产奶信息管理 > 个体产奶信息列表");
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/cngl/add.jsp";
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
     		window.location.href="${pageContext.request.contextPath}/master/jsgl/jsgl!edit.action?id="+id;
     	}     	
     	
     	var oname = "${oname}";
     	var otype = "${otype}";
     	
     	if(oname && oname.length > 0){
     		console.log($(".order[value="+oname+"]"));
     		$(".order[value="+oname+"]").attr("type",otype);
     	}
     	
     </script>
  </body>
 </html>