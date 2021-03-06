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
	          		<form id="frmSearch" action="${pageContext.request.contextPath}/master/fzgl/fqdj.action" method="post">
	          		<table class="form_table" border="0" cellpadding="0" cellspacing="0">
	          			<tr>
	          				<td>牛只编号：</td>
	          				<td><input id="bh" type="text" name="bh" class="input-text lh25" value="${bh}" size="30"></td>
	          				<td>耳标编号：</td>
	          				<td><input id="eb" type="text" name="eb" class="input-text lh25" value="${eb}" size="30"></td>
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
			          			<input type="hidden" name="fileType" value="5">
			          			<input id="imgfile" class="fileInput cr-p" accept=".xlsx,.xls" type="file" name="upfile">
		          			</form>
	          			</div>
	          			<input type="button" name="button" data="5" onClick="dataExport()" class="btn btn82 btn_export" value="导出">
	          		</div>
	         </div>
	 </div>
  	
  	<div class="box span10 oh mt5">
  	 	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="list_table ta-c">
  	 		<tr>
              	<th width="200">牛只编号</th>
              	<th width="200">当前情期</th>
              	<th width="200">发情时间</th>
              	<th width="200">最佳配种时段</th>
              	<th width="200">发情类型</th>
              	<th width="200">发现方式</th>
              	<th width="200" url="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=1${searchString}" value="sfpz" type="1" class="order cr-p" title="降序">是否配种&nbsp;<span class="fa fa-caret-down"></span></th>
              	<th width="200">操作</th>
         	</tr>
         	<s:iterator value="fqlist" status="status" id="fqxx">
						<tr>
							<td><s:property value="#fqxx.nzjbxx.nzbh"/></td>
							<td><s:property value="#fqxx.nzjbxx.qq"/></td>
							<td><s:date name="#fqxx.fqsj" format="yyyy-MM-dd HH:mm"/></td>
							<s:if test="#fqxx.pzsj!=null&&#fqxx.pzsj1!=null">
								<td><s:date name="#fqxx.pzsj" format="yyyy-MM-dd HH:mm"/><br><s:date name="#fqxx.pzsj1" format="yyyy-MM-dd HH:mm"/></td>
							</s:if>
							<s:else>
								<td></td>
							</s:else>
							<td><y:EnumLabel enumName="FQLX" value="${fqxx.fqlx}"/></td>
							<td><y:EnumLabel enumName="FXFS" value="${fqxx.fxfs}"/></td>
							<td><y:EnumLabel enumName="SFPZ" value="${fqxx.sfpz}"/></td>
							<td>
								<a title="修改" onclick="edit('<s:property value="#fqxx.xh"/>')" class="fa fa-edit cr-p">修改</a>
								<a title="删除" id="comsubmit_delete" promptInfo='确认删除该条发情信息吗？' callfunction=",deleteDone," url="${pageContext.request.contextPath}/master/fzgl/fqdj!delete.action?id=<s:property value="#fqxx.xh"/>" class="fa fa-remove cr-p">删除</a>
								<s:if test="#fqxx.sfpz==0">
									<a title="配种" onclick="peizhong('<s:property value="#fqxx.xh"/>')" class="fa fa-beaker cr-p">配种</a>
								</s:if>
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
							<li class="first-child"><a href="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=${pageNowNum-1}${searchString}">上一页</a></li>
						</s:else>
						<i:PageNum>
							<s:if test="#attr.IsNow">
								<li class="active"><span>${pageIndex}</span></li>
							</s:if>
							<s:else>
								<li><a href="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=${pageIndex}${searchString}">${pageIndex}</a></li>
							</s:else>
						</i:PageNum>
						<s:if test="#attr.IsLast">
							<li class="disabled"><span>下一页</span></li>
						</s:if>
						<s:else>
							<li><a class="" href="${pageContext.request.contextPath}/master/fzgl/fqdj.action?p=${pageNowNum+1}${searchString}">下一页</a></li>
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
     	showmap("发情信息管理 > 发情信息列表");
     	
     	function search()
     	{
     		document.getElementById("frmSearch").submit();
     	}
     	
     	function add()
     	{
     		window.location.href="${pageContext.request.contextPath}/admin/pages/fzgl/fqdj-add.jsp";
     	}
     	
     	function peizhong(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/pzdj!addPz.action?id="+id;
     	}
     	
     	function edit(id)
     	{
     		window.location.href="${pageContext.request.contextPath}/master/fzgl/fqdj!edit.action?id="+id;
     	}
     	
     	function deleteDone(data)
     	{
     		jsonResult(data,function(data){
     			if(data["error"]==0)
     				window.location.reload();
     		});
     	}
     	
     	var oname = "${oname}";
     	var otype = "${otype}";
     	
     	if(oname && oname.length > 0){
     		$(".order[value='"+oname+"']").attr("type",otype);
     	}
     	
     </script>
  </body>
</html>